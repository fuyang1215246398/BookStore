package com.ustc.web;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import com.ustc.instance.Book;
import com.ustc.instance.Cart;
import com.ustc.instance.CartItem;
import com.ustc.instance.Category;
import com.ustc.instance.Order;
import com.ustc.instance.OrderItem;
import com.ustc.instance.User;
import com.ustc.service.BookService;
import com.ustc.service.CategoryService;
import com.ustc.service.OrderService;


public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public OrderServlet() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String method =request.getParameter("method");
		switch (method) {
		case "submitOrder":
			submitOrder(request,response);
			break;
		case "confirmOrder":
			confirmOrder(request,response);
			break;
		case "showAllOrder":
			showAllOrder(request,response);
			break;
		case "payForTheUnpayed":
			payForTheUnpayed(request,response);
			break;
		case "buyNow":
			buyNow(request,response);
			break;
		case "deleteOrder":
			deleteOrder(request,response);
		default:
			break;
		}
		
	}

	private void deleteOrder(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String oid=request.getParameter("oid");
		OrderService os =new OrderService();
		int row=os.deleteOrder(oid);
		if(row>0)
		{
			response.getWriter().write("1");
		}else{
			response.getWriter().write("2");
		}
	}


	//实现立即购买功能，跳过购物车
	private void buyNow(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String bid=request.getParameter("bid");
		String buyNum=request.getParameter("buyNum");
		int num=Integer.parseInt(buyNum);
		HttpSession session = request.getSession();
		
		
		User user = (User) session.getAttribute("user");
		if(user==null) {
			response.sendRedirect(request.getContextPath()+"/login.jsp");
			return;
		}
		//目的，封装成Order 传给service
		Order order=new Order();
//		private String oid;//订单号
		String oid=UUID.randomUUID().toString();
		order.setOid(oid);
//		private Date ordertime;//下单时间
		order.setOrdertime(new Date());
//		private int totalprice;//该订单的总金额
		//获得书籍对象
		BookService bs=new BookService();
		Book book=null;
		try {
			 book=bs.findBookInfomation(bid);
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		int totalprice=book.getPrice()*num;
		order.setTotalprice(totalprice);
//		private int state;//订单的状态 1代表已付款，0代表为付款
		order.setState(0);
//		private String address;//收货人地址
		order.setAddress(null);
//		private String name;//收货人姓名
		order.setName(null);
//		private String telephone;//收货人电话
		order.setTelephone(null);
//		private User user;//该订单属于哪个用户
		order.setUser(user);
//		private List<OrderItem> orderItems =new ArrayList<OrderItem>();
		OrderItem orderItem=new OrderItem();
			orderItem.setBook(book);
			orderItem.setCount(num);
			orderItem.setItemid(UUID.randomUUID().toString());
			orderItem.setOrder(order);
			orderItem.setSubtotal(totalprice);
		order.getOrderItems().add(orderItem);
			OrderService os=new OrderService();
			//提交订单 将order传到service层
			os.submitOrder(order);
			session.setAttribute("order", order);
			response.sendRedirect("/BookStore/submitOrder.jsp");
		
	}

//在查看订单里为未付款的订单付款，将未付款的订单封装到order对象中，并跳转到付款页面
	private void payForTheUnpayed(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		if(user==null) {
			response.sendRedirect("/BookStore/login.jsp");
			return;
		}
		String oid=request.getParameter("oid");
		//查询该用户的所有订单信息
		OrderService os= new OrderService();
		Order order=os.findOrdersByOid(oid);
		//循环每个订单
		if(order!=null) {
			List<Map<String, Object>> orderItemMapList=os.findAllOrderItemByOid(oid);
			
			//将maplist封装到Itemlist
			for(Map<String, Object> map:orderItemMapList) {
				//每一个map都相当于一个orderItem
				try {
					OrderItem item= new OrderItem();
					//将数据封装到订单项中
					BeanUtils.populate(item, map);
					Book book= new Book();
					//将数据封装到书对象中
					BeanUtils.populate(book, map);
					//将书对象存入订单项
					item.setBook(book);
					//将订单项存入每个订单的订单list中
					order.getOrderItems().add(item);
				} catch (IllegalAccessException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (InvocationTargetException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}}
		session.setAttribute("order", order);
		response.sendRedirect("/BookStore/submitOrder.jsp");
		
	}

//展示所有的订单
	private void showAllOrder(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		if(user==null) {
			response.sendRedirect("/BookStore/login.jsp");
			return;
		}
		//查询该用户的所有订单信息
		OrderService os= new OrderService();
		List<Order> orderList=os.findAllOrders(user.getId());
		//循环每个订单
		if(orderList!=null)
		for(Order order:orderList) {
			String oid= order.getOid();
			List<Map<String, Object>> orderItemMapList=os.findAllOrderItemByOid(oid);
			
			//将maplist封装到Itemlist
			for(Map<String, Object> map:orderItemMapList) {
				//每一个map都相当于一个orderItem
				try {
					OrderItem item= new OrderItem();
					//将数据封装到订单项中
					BeanUtils.populate(item, map);
					Book book= new Book();
					//将数据封装到书对象中
					BeanUtils.populate(book, map);
					book.setBid(map.get("Bid")+"");
					//将书对象存入订单项
					item.setBook(book);
					//将订单项存入每个订单的订单list中
					order.getOrderItems().add(item);
				} catch (IllegalAccessException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (InvocationTargetException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
		}
		//orderList封装完成
		request.setAttribute("orderList", orderList);
		
		request.getRequestDispatcher("/OrderList.jsp").forward(request, response);
	}

//确认订单进行购买，将收货人信息填写，并将状态更新为已付款,并且更新书籍的库存信息，售出信息
	private void confirmOrder(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String address=request.getParameter("address");
		address=new String(address.getBytes("ISO8859-1"),"UTF-8");
		String name=request.getParameter("name");
		name=new String(name.getBytes("ISO8859-1"),"UTF-8");
		String telephone=request.getParameter("telephone");
		Order order=(Order)request.getSession().getAttribute("order");
		String oid=order.getOid();
		OrderService os=new OrderService();
		response.setContentType("text/html;charset=UTF-8");
		//更新书籍的库存信息售出信息
		int flag=0;
		String message="";
				List<OrderItem> orderItems = order.getOrderItems();
				for(OrderItem item:orderItems) {
					Book book=item.getBook();
					int storage=book.getStorage();
				//购买数量大于库存
					if(item.getCount()>storage) {
						
						flag=1;
					   message+=book.getName()+"库存不足！      ";	
					}
				
				}
				if(flag==1) {
					request.getSession().setAttribute("message", message);
					response.sendRedirect("/BookStore/buySuccess.jsp");
					return;
				}
				
				for(OrderItem item:orderItems) {
					Book book=item.getBook();
					String bid=book.getBid();
					int count = item.getCount();
					os.updateBookInfo(bid,count);
				}
		
		//更新订单收货人信息和订单状态
		os.updateInfo(address,name,telephone,oid);
		message="购买成功！";
		request.getSession().setAttribute("message", message);
		response.sendRedirect("/BookStore/buySuccess.jsp");
	}

//提交订单，将购物车内的商品提交，但是订单的收货人信息还未填写，只是将数据读入数据库，订单状态为未付款
	private void submitOrder(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//判断用户是否已经登录
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		if(user==null) {
			response.sendRedirect(request.getContextPath()+"/login.jsp");
			return;
		}
		//目的，封装成Order 传给service
		Order order=new Order();
//		private String oid;//订单号
		String oid=UUID.randomUUID().toString();
		order.setOid(oid);
//		private Date ordertime;//下单时间
		order.setOrdertime(new Date());
//		private int totalprice;//该订单的总金额
		//获得购物车
		Cart cart = (Cart) session.getAttribute("cart");
		int total=0;
		if(cart!=null) {
			total=cart.getTotalPrice();
			order.setTotalprice(total);
//			private int state;//订单的状态 1代表已付款，0代表为付款
			order.setState(0);
//			private String address;//收货人地址
			order.setAddress(null);
//			private String name;//收货人姓名
			order.setName(null);
//			private String telephone;//收货人电话
			order.setTelephone(null);
//			
//			private User user;//该订单属于哪个用户
			order.setUser(user);
	//List<OrderItem> orderItems =new ArrayList<OrderItem>();
			//获得购物车中的集合Map
			Map<String, CartItem> cartItems = cart.getCartItem();
			for(Map.Entry<String, CartItem> entry:cartItems.entrySet()) {
				CartItem cartItem = entry.getValue();
				OrderItem orderItem=new OrderItem();
//				private String itemid;//订单项的id
				orderItem.setItemid(UUID.randomUUID().toString());
//				private int count;//订单项内购买的数量
				orderItem.setCount(cartItem.getNum());
//				private int subtotal;//订单项的小计
				orderItem.setSubtotal(cartItem.getSubTotal());
//				private Book book;//订单项内部的商品
				orderItem.setBook(cartItem.getBook());
//				private Order order;//订单项所属的订单
				orderItem.setOrder(order);
				//将订单项添加到订单的订单项集合中
				order.getOrderItems().add(orderItem);
			}
			
			OrderService os=new OrderService();
			//提交订单 将order传到service层
			os.submitOrder(order);
			session.setAttribute("order", order);
			
			response.sendRedirect("/BookStore/submitOrder.jsp");
		}

		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
