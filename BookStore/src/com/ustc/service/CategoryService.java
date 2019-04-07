package com.ustc.service;

import java.sql.SQLException;
import java.util.List;

import com.ustc.dao.CategoryDao;
import com.ustc.instance.Book;
import com.ustc.instance.BookBean;
import com.ustc.instance.Category;


public class CategoryService {

	public List<Category> getAllCategory() throws SQLException {
		CategoryDao dao= new CategoryDao();
		return dao.getAllCategory();
		
	}

	public BookBean getBooksByCategory(String cid,int currentPage,int pageContent) throws SQLException {
		CategoryDao dao= new CategoryDao();

		BookBean bookBean=dao.getBooksByCategory(cid,currentPage,pageContent);
		bookBean.setCurrentPage(currentPage);
		bookBean.setPageContent(pageContent);
		int totalPage=(int)Math.ceil(1.0*bookBean.getTotalCount()/bookBean.getPageContent());
		bookBean.setTotalPage(totalPage);
		return bookBean;
		
	}

}
