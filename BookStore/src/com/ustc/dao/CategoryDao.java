package com.ustc.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.ustc.instance.Book;
import com.ustc.instance.BookBean;
import com.ustc.instance.Category;
import com.ustc.utils.c3p0Utils;

public class CategoryDao {

	public List<Category> getAllCategory() throws SQLException {
		
		QueryRunner qr=new QueryRunner(c3p0Utils.getDataSource());
		String sql="select * from category";
		List<Category> categoryList = qr.query(sql, new BeanListHandler<Category>(Category.class));
		return categoryList;
	}

	public BookBean getBooksByCategory(String cid, int currentPage, int pageCotent) throws SQLException {
		QueryRunner qr=new QueryRunner(c3p0Utils.getDataSource());
		String sql="";
		List<Book> categoryList=null;
		BookBean bookBean=new BookBean();
		Long TotalCount;	
		if(cid.equals("0")) {sql="select * from book limit ?,?";
		String sql1="select count(*) from book";
		TotalCount=qr.query(sql1, new ScalarHandler<Long>());
		categoryList=qr.query(sql, new BeanListHandler<Book>(Book.class),(currentPage-1)*pageCotent,pageCotent);
		}
		else {sql="select * from book where cid=? limit ?,?";
		categoryList = qr.query(sql, new BeanListHandler<Book>(Book.class),cid,(currentPage-1)*pageCotent,pageCotent);
		String sql1="select count(*) from book where cid=?";
		TotalCount=qr.query(sql1, new ScalarHandler<Long>(),cid);
		}
		bookBean.setBookList(categoryList);
		bookBean.setTotalCount(TotalCount);
		return bookBean;
	}
	
}
