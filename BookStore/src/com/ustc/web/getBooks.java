package com.ustc.web;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.google.gson.Gson;
import com.ustc.instance.Book;
import com.ustc.instance.BookBean;
import com.ustc.instance.Category;
import com.ustc.service.BookService;
import com.ustc.service.CategoryService;
import com.ustc.utils.c3p0Utils;


public class getBooks extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public getBooks() {
        super();
       
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String method=request.getParameter("method");
			
			if(method==null)method="category";
			switch (method) {
			case "category":
				getBookByCategory(request,response);
				break;
			case "bookName":
				getBookByName(request,response);
				break;
			case "word":
				getBookNameByWord(request,response);
				break;
			case "infomation":
				getBookInfomation(request,response);
				break;
			case "bookofHotandNew":
				getBookofHotandNew(request,response);
			default:
				break;
			}
	}
	/**
	 * 
	 * 主页面的热门书籍和新上架书籍的推荐
	 * */
private void getBookofHotandNew(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			CategoryService category=new CategoryService();
				List<Category> categoryList=null;
				try {
					categoryList	=category.getAllCategory();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				request.setAttribute("categoryList", categoryList);
				int categoryListSize=categoryList.size();
				BookService bs=new BookService();
		
		
		//热门书籍的推荐 
		List<Book> bookListOfHot=bs.findHotBookofAll();
		List<List<Book>> hotBookListofCategory=new  ArrayList<>();
		for(int i=1;i<=categoryListSize;i++) {
			if(i%2==1) {
				hotBookListofCategory.add(bs.findHotBookByCatehory(i,i+1));
			}
		}
		//新上架书籍的推荐
		List<Book> bookListOfNew=bs.findNewBookofAll();
		List<List<Book>> newBookListofCategory=new  ArrayList<>();
		for(int i=1;i<=categoryListSize;i++) {
			if(i%2==1) {
				newBookListofCategory.add(bs.findNewBookByCatehory(i,i+1));
			}
		}
		
		request.setAttribute("bookofAllHot", bookListOfHot);
		request.setAttribute("hotBookListofCategory", hotBookListofCategory);
		request.setAttribute("bookListOfNew", bookListOfNew);
		request.setAttribute("newBookListofCategory", newBookListofCategory);
		request.getRequestDispatcher("/index.jsp").forward(request, response);
	}


private void getBookInfomation(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		String bid=request.getParameter("bid");
		BookService bs=new BookService();
		Book book=null;
		try {
			 book=bs.findBookInfomation(bid);
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		QueryRunner qr=new QueryRunner(c3p0Utils.getDataSource());
		String sql="select * from category where cid=?";
		Category category=null;
		
		try {
			category=qr.query(sql, new BeanHandler<Category>(Category.class),book.getCid());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		List<Book> sameCateGoryBook=null;
			sql="select * from book where cid=? and Bid!=? limit 0,3";
		try {
			sameCateGoryBook=	qr.query(sql, new BeanListHandler<Book>(Book.class),book.getCid(),book.getBid());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		request.setAttribute("book", book);
	request.setAttribute("category", category);

		request.setAttribute("sameCateGoryBook",sameCateGoryBook);
		request.getRequestDispatcher("/comment?method=getComment&bid="+bid).forward(request, response);
	}

/**
 * 使用ajax异步 
 * 根据用户传来的词语对数据库进行模糊查询，将查到的书名返回给用户
 * 
 * */
	private void getBookNameByWord(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String word=request.getParameter("word");
		
		
		BookService bservice=new BookService();
		List<Object> book=null;
		try {
			book=bservice.findBookByWord(word);
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		Gson gson=new Gson();
		String json=gson.toJson(book);
//		System.out.println(json);
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().write(json);
		
	}
/**
 * 根据用户的查询表单提交的书名进行模糊查询书籍，将查到的书籍返回给用户
 * */
	private void getBookByName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cid=request.getParameter("cid");
		String currentPageStr=request.getParameter("currentPage");
		if(cid==null)cid="0";
		if(currentPageStr==null)currentPageStr="1";
		int currentPage=Integer.parseInt(currentPageStr);
		String bookName=request.getParameter("bookname");
		bookName=new String(bookName.getBytes("ISO8859-1"),"UTF-8");
		BookBean bookBean=new BookBean();
		BookService bs=new BookService();
		List<Book> bookList=null;
		try {
			bookBean=bs.findBookByName(bookName);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		bookBean.setCurrentPage(currentPage);
		bookBean.setPageContent(8);
		int totalPage=(int)Math.ceil(1.0*bookBean.getTotalCount()/bookBean.getPageContent());
		bookBean.setTotalPage(totalPage);
		request.setAttribute("cid", cid);
		request.setAttribute("bookBean", bookBean);
		request.getRequestDispatcher("/showBooks.jsp").forward(request, response);
		
	}
/*
 * 根据用户传来的类别进行查询书籍，并返回给用户
 * */
	private void getBookByCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cid=request.getParameter("cid");
		String currentPageStr=request.getParameter("currentPage");
		if(cid==null)cid="0";
		if(currentPageStr==null)currentPageStr="1";
		int currentPage=Integer.parseInt(currentPageStr);
		int pageContent=8;
		CategoryService cs=new CategoryService();
		BookBean bookBean= null;
		try {
			bookBean=cs.getBooksByCategory(cid,currentPage,pageContent);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String way=request.getParameter("way");	
		bookBean.setCid(Integer.parseInt(cid));
		if(way!=null&&way.equals("yibu")) {
			response.setContentType("text/html;charset=UTF-8");
			Gson gson=new Gson();
			String json = gson.toJson(bookBean);
			
			response.getWriter().write(json);
			return;
		}
		if(way==null) {
		request.setAttribute("cid", cid);
		request.setAttribute("bookBean", bookBean);
		request.getRequestDispatcher("/showBooks.jsp").forward(request, response);
		//request.getRequestDispatcher("/getCategory").forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
