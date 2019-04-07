package com.ustc.web.filter;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import com.ustc.instance.Address;
import com.ustc.instance.Category;
import com.ustc.instance.User;
import com.ustc.service.AddressService;
import com.ustc.service.CategoryService;
import com.ustc.utils.c3p0Utils;

/**
 * Servlet Filter implementation class AutoLoginFilter
 */
public class AutoLoginFilter implements Filter {

    /**
     * Default constructor. 
     */
    public AutoLoginFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		//获得cookie
		HttpServletRequest req=(HttpServletRequest) request;
		HttpServletResponse resp=(HttpServletResponse) response;
		String cookie_username=null;
		String cookie_password=null;
		QueryRunner qr=new QueryRunner(c3p0Utils.getDataSource());
		Cookie[] cookies = req.getCookies();
		if(cookies!=null) {
			for(Cookie cookie:cookies) {
				if("cookie_username".equals(cookie.getName())) {
					cookie_username=cookie.getValue();
				}
				if("cookie_password".equals(cookie.getName())) {
					cookie_password=cookie.getValue();
				}
			}
		}
		if(cookie_username!=null&&cookie_password!=null) {
			String sql ="select * from user where username=? and password=?";
			User user=null;
			try {
				user=qr.query(sql, new BeanHandler<User>(User.class),cookie_username,cookie_password);
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			req.getSession().setAttribute("user", user);
		}
		
		//解决全局乱码问题
		HttpSession session = req.getSession();
		CategoryService category=new CategoryService();
		List<Category> categoryList=null;
		try {
			//[{"cid":,"name":},{}...]
			categoryList	=category.getAllCategory();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		session.setAttribute("categoryList", categoryList);
		
		
		User user=(User) session.getAttribute("user");
		if(user!=null) {
		
		AddressService as=new AddressService();
		List<Address> addressList= as.getAddress(user.getId());
	
	session.setAttribute("addressList", addressList);
		}
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
class EnhencedRequest extends HttpServletRequestWrapper{
	private HttpServletRequest request;
	public EnhencedRequest(HttpServletRequest request) {
		super(request);
		this.request=request;
	}
	@Override
	public String getParameter(String name) {
		String parameter = request.getParameter(name);
		try {
			if(parameter!=null)
			parameter=new String(parameter.getBytes("ISO8859-1"),"UTF-8");
		} catch (UnsupportedEncodingException e) {
			
			e.printStackTrace();
		}
		return parameter;
	}
}
