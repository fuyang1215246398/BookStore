package com.ustc.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.ustc.instance.Category;
import com.ustc.service.CategoryService;


public class getCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public getCategory() {
        super();
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			CategoryService category=new CategoryService();
			List<Category> categoryList=null;
			try {
				//[{"cid":,"name":},{}...]
				categoryList	=category.getAllCategory();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			Gson gson=new Gson();
			String json = gson.toJson(categoryList);
//			request.setAttribute("categoryList", categoryList);
//			request.getRequestDispatcher("/showBooks.jsp").forward(request, response);
			response.setContentType("text/html;charset=UTF-8");
			response.getWriter().write(json);
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
