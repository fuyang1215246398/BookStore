package com.ustc.service;

import java.sql.SQLException;
import java.util.List;

import com.ustc.dao.RangeDao;
import com.ustc.instance.Book;
import com.ustc.instance.BookBean;

public class RangeService {

	public BookBean getBookByRange(String cid, String priceLow, String priceHigh, String rangeType, int currentpage, int pageContent) {
		RangeDao dao=new RangeDao();
		
		try {
			return dao.getBookByRange(cid,priceLow,priceHigh,rangeType,currentpage,pageContent);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	return null;
	}

}
