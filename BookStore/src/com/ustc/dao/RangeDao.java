package com.ustc.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.ustc.instance.Book;
import com.ustc.instance.BookBean;
import com.ustc.utils.c3p0Utils;

public class RangeDao {

	public BookBean getBookByRange(String cid, String priceLow, String priceHigh, String rangeType, int currentpage, int pageContent) throws SQLException {
		QueryRunner qr=new QueryRunner(c3p0Utils.getDataSource());
		String sql="";
		String sql1;
		List<Book> query=null;
		Long count=0l;
		BookBean bookBean=new BookBean();
		if(cid.equals("0")) {
			
			sql="select * from book where price between ? and ? order by "+rangeType+" desc  limit ?,?";
			sql1="select count(*) from book where price between ? and ? order by "+rangeType+" desc";
			count = qr.query(sql1, new ScalarHandler<>(),priceLow,priceHigh);
			query = qr.query(sql, new BeanListHandler<Book>(Book.class),priceLow,priceHigh,(currentpage-1)*pageContent,pageContent);
		}
		else {
			sql="select * from book where cid=? and price between ? and ? order by "+rangeType+" desc  limit ?,?";
			sql1="select count(*) from book where cid=? and price between ? and ? order by "+rangeType+" desc";
			count = qr.query(sql1, new ScalarHandler<>(),cid,priceLow,priceHigh);
			query = qr.query(sql, new BeanListHandler<Book>(Book.class),cid,priceLow,priceHigh,(currentpage-1)*pageContent,pageContent);
			
		}
		
		bookBean.setBookList(query);
		bookBean.setTotalCount(count);
		bookBean.setPageContent(pageContent);
		bookBean.setCurrentPage(currentpage);
		
		int totalPage=(int)Math.ceil(1.0*bookBean.getTotalCount()/bookBean.getPageContent());
		bookBean.setTotalPage(totalPage);
		return bookBean;
	}

}
