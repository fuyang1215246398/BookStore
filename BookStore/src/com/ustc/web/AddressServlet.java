package com.ustc.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import com.google.gson.Gson;
import com.ustc.instance.Address;
import com.ustc.instance.User;
import com.ustc.service.AddressService;
import com.ustc.utils.c3p0Utils;

/**
 * Servlet implementation class AddressServlet
 */
public class AddressServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddressServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String method=request.getParameter("method");
		switch (method) {
		case "addAddress":
			addAddress(request,response);
			break;
		case "getAddress":
			getAddress(request,response);
			break;
		case "deleteAddress":
			deleteAddress(request,response);
			break;
		case "changeDefaultAddress":
			changeDefaultAddress(request,response);
		case "changeAddress":
			changeAddress(request,response);
			break;
		default:
			break;
		}
	}

	private void changeAddress(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name=request.getParameter("name");
		
		String telephone=request.getParameter("telephone");
		String address=request.getParameter("address");
		String addinfoid=request.getParameter("addinfoid");
		QueryRunner qr=new QueryRunner(c3p0Utils.getDataSource());
		String sql="update addressinfo set name=? , telephone=? , address=? where addinfoid=?";
		try {
			qr.update(sql,name,telephone,address,addinfoid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		getAddress(request,response);
		
	}

	private void changeDefaultAddress(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		User user = (User) request.getSession().getAttribute("user");
		String addinfoid=request.getParameter("addinfoid");
		AddressService as=new AddressService();
		int row =as.changeDefaultAddress(addinfoid,user.getId());
		
			getAddress(request,response);
			
	}

	private void deleteAddress(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String addinfoid=request.getParameter("addinfoid");
		AddressService as=new AddressService();
		int row =as.deleteAddress(addinfoid);
		if(row>0) {
			response.getWriter().write("1");
		}
	}

	private void getAddress(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user=(User) request.getSession().getAttribute("user");
		AddressService as=new AddressService();
		List<Address> addressList= as.getAddress(user.getId());
	
	request.setAttribute("addressList", addressList);
		request.getRequestDispatcher("/userInfomation.jsp").forward(request, response);
		
	}

	private void addAddress(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String name=request.getParameter("name");
		String phone=request.getParameter("phone");
		String address=request.getParameter("address");
		
		Address add=new Address();
		add.setName(name);
		add.setTelephone(phone);
		add.setAddress(address);
		String addressId=UUID.randomUUID().toString();
		add.setAddinfoid(addressId);
		User user=(User) request.getSession().getAttribute("user");
		add.setUid(user.getId());
		add.setIsdefault(0);
		AddressService as=new AddressService();
		int row=as.addAddress(add);
		Gson gson =new Gson();
		String json = gson.toJson(add);
		if(row>0) {
			response.getWriter().write(json);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
