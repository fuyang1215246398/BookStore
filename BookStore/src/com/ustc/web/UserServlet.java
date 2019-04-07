package com.ustc.web;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.dbutils.QueryRunner;

import com.mchange.v2.codegen.bean.BeangenUtils;
import com.ustc.instance.User;
import com.ustc.service.UserService;
import com.ustc.utils.c3p0Utils;
import com.ustc.utils.md5Utils;


public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public UserServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String method=request.getParameter("method");
		
		switch (method) {
		case "login":
			login(request,response);
			break;
		case "logout":
			logout(request,response);
			break;
		case "register":
			register(request,response);
			break;
		case "checkUsername":
			isUsernameExist(request,response);
			break;
		case "changePassword":
			changePassword(request,response);
			break;
		case "changeInformation":
			changeInformation(request,response);
			break;
		default:
			break;
		}
	}

private void changeInformation(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	String name=request.getParameter("name");
	name=new String(name.getBytes("ISO8859-1"),"UTF-8");
	
	String email=request.getParameter("email");
	String telephone=request.getParameter("telephone");
	User user =(User) request.getSession().getAttribute("user");
	QueryRunner qr=new QueryRunner(c3p0Utils.getDataSource());
	String sql="update user set name=? , email=? , telephone=? where id=?";
	try {
		qr.update(sql,name,email,telephone,user.getId());
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	request.getRequestDispatcher("/address?method=getAddress").forward(request, response);

	
		
	}


private void changePassword(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String newpassword=request.getParameter("newpassword");
		newpassword=md5Utils.toMD5(newpassword);
		HttpSession session = request.getSession();
		User user=(User) session.getAttribute("user");
		String username=user.getUsername();
		UserService us=new UserService();
	int row=	us.changePassword(username,newpassword);
		if(row>0)
		{
			user.setPassword(newpassword);
			Cookie cookie_username=new Cookie("cookie_username",user.getUsername());
			Cookie cookie_password=new Cookie("cookie_password",user.getPassword());
			//设置cookie的持久化时间
			cookie_password.setMaxAge(60*60*12);
			cookie_username.setMaxAge(60*60*12);
			cookie_username.setPath(request.getContextPath());
			cookie_password.setPath(request.getContextPath());
			response.addCookie(cookie_username);
			response.addCookie(cookie_password);
			session.setAttribute("user", user);
			response.getWriter().write("1");
		}
		else {
			response.getWriter().write("0");
		}
	}


private void isUsernameExist(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String username=request.getParameter("username");
		UserService us=new UserService();
		boolean isExist=us.checkUsernameExist(username);
		String json="{\"isExist\":"+isExist+"}";
		
		response.getWriter().write(json);
	
	}

private void register(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		User user= new User();
//		try {
//			BeanUtils.populate(user, parameterMap);
//		} catch (IllegalAccessException e) {			
//			e.printStackTrace();
//		} catch (InvocationTargetException e) {
//			e.printStackTrace();
//		}
		
		String name=request.getParameter("name");
		name=new String(name.getBytes("ISO8859-1"),"UTF-8");
		String username=request.getParameter("username");
		username=new String(username.getBytes("ISO8859-1"),"UTF-8");
		user.setUsername(username);
		user.setName(name);
		String password=md5Utils.toMD5(request.getParameter("password"));
		user.setPassword(password);
		user.setTelephone(request.getParameter("telephone"));
		user.setEmail(request.getParameter("email"));
		
		user.setState(0);
		user.setActiveCode(UUID.randomUUID().toString());
		UserService us=new UserService();
		boolean isRegistered=us.register(user);
		if(isRegistered)response.sendRedirect("/BookStore/login.jsp");
		else System.out.println("注册失败");
		
	}

//注销登录功能
	private void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		session.removeAttribute("user");
		Cookie[] cookies = request.getCookies();
		if(cookies!=null)
		for(Cookie cookie:cookies) {
			if("cookie_username".equals(cookie.getName())) {
				cookie.setMaxAge(0);
				cookie.setPath(request.getContextPath());
				response.addCookie(cookie);
			}
			if("cookie_password".equals(cookie.getName())) {
				cookie.setMaxAge(0);
				cookie.setPath(request.getContextPath());
				response.addCookie(cookie);
			}
		}
		response.sendRedirect("/BookStore/getBooks?method=bookofHotandNew");
	}

	private void login(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		request.setCharacterEncoding("UTF-8");
		String username=request.getParameter("username");
		
		String password=md5Utils.toMD5(request.getParameter("password"));
		UserService us=new UserService();
		//username=new String(username.getBytes("ISO8859-1"),"UTF-8");
		
		User user=us.login(username,password);
		
		if(user!=null) {
			
			String autoLogin=request.getParameter("autoLogin");
			if(autoLogin!=null) {
				Cookie cookie_username=new Cookie("cookie_username",user.getUsername());
				Cookie cookie_password=new Cookie("cookie_password",user.getPassword());
				//设置cookie的持久化时间
				cookie_password.setMaxAge(60*60*12);
				cookie_username.setMaxAge(60*60*12);
				cookie_username.setPath(request.getContextPath());
				cookie_password.setPath(request.getContextPath());
				response.addCookie(cookie_username);
				response.addCookie(cookie_password);
			}
			request.getSession().setAttribute("user", user);
//			response.sendRedirect("/BookStore/index.jsp");
			response.getWriter().write("1");
			
		}else
		{
//			request.setAttribute("login_message", "用户名或者密码不正确！");
//			request.getRequestDispatcher("/login.jsp").forward(request, response);
			response.getWriter().write("no");
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
