package com.ustc.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ustc.instance.Book;
import com.ustc.instance.Cart;
import com.ustc.instance.CartItem;
import com.ustc.instance.Category;
import com.ustc.service.BookService;
import com.ustc.service.CategoryService;

/**
 * Servlet implementation class CartServlet
 */
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public CartServlet() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String method=request.getParameter("method");
		switch (method) {
		case "addBookToCart":
			addBookToCart(request,response);
			break;
		case "changeBookNum":
			changeBookNum(request,response);
			break;
		case "delectBookFromCart":
			delectBookFromCart(request,response);
			break;
		case "clearAllOfCart":
			clearAllOfCart(request,response);
		default:
			break;
		}
	}

//清除购物车
	private void clearAllOfCart(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		session.removeAttribute("cart");
		response.sendRedirect("/BookStore/cart.jsp");
	}
//将某项商品从购物车中删除
	private void delectBookFromCart(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String bid=request.getParameter("bid");
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		int num=0;
		int subTotal=0;
		if(cart!=null) {
			Map<String, CartItem> cartItem = cart.getCartItem();
			 num = cartItem.get(bid).getNum();
			 subTotal = cartItem.get(bid).getSubTotal();
			cartItem.remove(bid);
		}
		cart.setTotalNum(cart.getTotalNum()-num);
		cart.setTotalPrice(cart.getTotalPrice()-subTotal);
		session.setAttribute("cart", cart);
		response.sendRedirect("/BookStore/cart.jsp");
	}
//ajax改变session中的某些商品的数量
	private void changeBookNum(HttpServletRequest request, HttpServletResponse response) {
		String num=request.getParameter("newNum");
		int newNum=Integer.parseInt(num);
		String bid=request.getParameter("bid");
		int oldSubNum=0;
		int oldSubPrice=0;
		int newSubPrice=0;
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		Map<String, CartItem> cartItems = cart.getCartItem();
		if(cartItems.containsKey(bid)) {
			CartItem cartItem = cartItems.get(bid);
			oldSubNum=cartItem.getNum();
			oldSubPrice=cartItem.getSubTotal();
			cartItem.setNum(newNum);
			newSubPrice=newNum*cartItem.getBook().getPrice();
			cartItem.setSubTotal(newSubPrice);
		}
		cart.setTotalNum(cart.getTotalNum()-oldSubNum+newNum);
		cart.setTotalPrice(cart.getTotalPrice()-oldSubPrice+newSubPrice);
		session.setAttribute("cart", cart);
	}
//将商品添加到购物车中，并将cart保存到session中
	private void addBookToCart(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String bid=request.getParameter("bid");
		String buyNum=request.getParameter("buyNum");
		HttpSession session = request.getSession();
		session.setMaxInactiveInterval(60*60*60);
		//设置cookie保存session的jsessionid以便关闭浏览器后还能访问
		String id = session.getId();
		Cookie cookie=new Cookie("JSESSIONID",id);
		cookie.setPath("/BookStore/");
		cookie.setMaxAge(60*60*60);
		response.addCookie(cookie);
		BookService bs=new BookService();
		Book book=null;
		
		try {
			 book=bs.findBookInfomation(bid);
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		CartItem cartItem=new CartItem();
		cartItem.setBook(book);
		int num=Integer.parseInt(buyNum);
		cartItem.setNum(num);
		int subTotal=num*book.getPrice();
		cartItem.setSubTotal(subTotal);
		//获得购物车
		Cart cart = (Cart) session.getAttribute("cart");
		if(cart==null) {
			cart=new Cart();
		}
		//判断购物车中是否已经有此书籍 判断key是否存在
		//如果购物车中已经存在该商品，就将买的数量与原先的相加
		Map<String, CartItem> cartItems= cart.getCartItem();//原有购物车的cartitem
		if(cartItems.containsKey(bid)) {
			//取出原有商品
			CartItem cartItem2 = cartItems.get(bid);//原先已有的商品
			int oldBuyNum =cartItem2.getNum();
			oldBuyNum+=num;
			cartItem2.setNum(oldBuyNum);
			int oldSubTotal=cartItem2.getSubTotal();
			oldSubTotal+=subTotal;
			cartItem2.setSubTotal(oldSubTotal);
		}else {
			cart.getCartItem().put(bid, cartItem);	
		}
		
		int total=cart.getTotalPrice();
		int totalNum=cart.getTotalNum();
		totalNum+=cartItem.getNum();
		total+=cartItem.getSubTotal();
		cart.setTotalPrice(total);
		cart.setTotalNum(totalNum);
		session.setAttribute("cart", cart);
		
		/*response.sendRedirect("/BookStore/cart.jsp");*/
		response.getWriter().write("1");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
