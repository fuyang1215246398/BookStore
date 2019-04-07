package com.ustc.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.ColumnHandler;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ColumnListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.ustc.instance.Book;
import com.ustc.instance.BookBean;
import com.ustc.utils.c3p0Utils;

public class BookDao {

	public List<Book> findAllBooks() {
		
		QueryRunner qr=new QueryRunner(c3p0Utils.getDataSource());
		 String sql="select * from book";
		 try {
			List<Book> bookList = qr.query(sql, new BeanListHandler<Book>(Book.class));
			if(bookList!=null) {
			 return bookList;
			}
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		 return null;
	}
//使用ajax异步查询数据库 来查询书籍
	public List<Object> findBookByWord(String word) throws SQLException {
		QueryRunner qr=new QueryRunner(c3p0Utils.getDataSource());
		String sql="select * from book where name like ? limit 0,5";
		List<Object> query =  qr.query(sql, new ColumnListHandler<>("name"),"%"+word+"%");
		return query;
	}

	public BookBean findBookByname(String bookName) throws SQLException {
		BookBean bookBean=new BookBean();
		QueryRunner qr =new QueryRunner(c3p0Utils.getDataSource());
		String sql="select * from book where name like ? limit 0,8";
		String sql1="select count(*) from book where name like ?";
		Long totalCount =qr.query(sql1, new ScalarHandler<Long>(),"%"+bookName+"%");
		
		bookBean.setTotalCount(totalCount);
//		System.out.println(bookName);
		List<Book> query = qr.query(sql, new BeanListHandler<Book>(Book.class),"%"+bookName+"%");
		bookBean.setBookList(query);
//		System.out.println(query.size());
		return bookBean;
	}
	public Book findBookInfo(String bid) throws SQLException {
		Book book=null;
		QueryRunner qr=new QueryRunner(c3p0Utils.getDataSource());
		String sql1="update book set hot=hot+1 where Bid=?";
		qr.update(sql1, bid);
		String sql="select * from book where Bid=?";
		 book = qr.query(sql, new BeanHandler<Book>(Book.class),bid);
		 
		return book;
	}
	///找到所有的热门书籍
	public List<Book> findHotBookofAll() throws SQLException {
		
		QueryRunner qr=new QueryRunner(c3p0Utils.getDataSource());
		String sql="select * from book order by hot desc limit 0,10";
		List<Book> query = qr.query(sql, new BeanListHandler<Book>(Book.class));
		return query;
	}
	///找到热门书籍，但是是通过分类
	public List<Book> findHotBookByCatehory(int i, int j) throws SQLException {
		QueryRunner qr=new QueryRunner(c3p0Utils.getDataSource());
		String sql="select * from book where cid=? or cid=? order by hot desc limit 0,6";
		List<Book> query = qr.query(sql, new BeanListHandler<Book>(Book.class),i,j);
		return query;
	}
	///找到所有的新上架书籍
	public List<Book> findNewBookofAll() throws SQLException {
		QueryRunner qr=new QueryRunner(c3p0Utils.getDataSource());
		String sql="select * from book order by Bid desc limit 0,10";
		List<Book> query = qr.query(sql, new BeanListHandler<Book>(Book.class));
		return query;
	}
	///找到新上架的书籍，但是通过分类
	public List<Book> findNewBookByCatehory(int i, int j) throws SQLException {
		QueryRunner qr=new QueryRunner(c3p0Utils.getDataSource());
		String sql="select * from book where cid=? or cid=? order by Bid desc limit 0,6";
		List<Book> query = qr.query(sql, new BeanListHandler<Book>(Book.class),i,j);
		return query;
	}

}
