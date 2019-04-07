package com.ustc.service;

import java.sql.SQLException;
import java.util.List;

import com.ustc.dao.BookDao;
import com.ustc.instance.Book;
import com.ustc.instance.BookBean;

public class BookService {

	
	public List<Book> findAllBooks() {
		//传递请求到Dao层
		BookDao dao=new BookDao();
		List<Book> books=dao.findAllBooks();
		return books;
	}

	public List<Object> findBookByWord(String word) throws SQLException {
		BookDao dao=new BookDao();
		return dao.findBookByWord(word);
	}

	public BookBean findBookByName(String bookName) throws SQLException {
		BookDao dao= new BookDao();
		return dao.findBookByname(bookName);
	}

	public Book findBookInfomation(String bid) throws SQLException {
		BookDao dao= new BookDao();
		return dao.findBookInfo(bid);
		
	}

	public List<Book> findHotBookofAll() {
		BookDao dao=new BookDao();
		List<Book> book=null;
		try { 
			book= dao.findHotBookofAll();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return book;
	}

	public List<Book> findHotBookByCatehory(int i, int j) {
		BookDao dao=new BookDao();
		List<Book> book=null;
		try {
			book=dao.findHotBookByCatehory(i,j);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return book;
	}

	public List<Book> findNewBookofAll() {
		BookDao dao=new BookDao();
		List<Book> book=null;
		try { 
			book= dao.findNewBookofAll();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return book;
	}

	public List<Book> findNewBookByCatehory(int i, int j) {
		BookDao dao=new BookDao();
		List<Book> book=null;
		try {
			book=dao.findNewBookByCatehory(i,j);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return book;
	}


}
