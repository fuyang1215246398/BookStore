package com.ustc.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ustc.instance.Book;
import com.ustc.instance.BookBean;
import com.ustc.service.RangeService;

/**
 * Servlet implementation class RangeServlet
 */
public class RangeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RangeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cid=request.getParameter("cid");
		if(cid==null)cid="0";
		String priceLow=request.getParameter("priceLow");
		if(priceLow==null)priceLow="0";
		String priceHigh=request.getParameter("priceHigh");
		if(priceHigh==null)priceHigh="1000";
		String rangeType=request.getParameter("rangeType");
		if(rangeType==null)rangeType="hot";
		String currentPage=request.getParameter("currentPage");
		if(currentPage==null)currentPage="1";
		int pageContent=10;
		
		BookBean bookBean=null;
		int Cid=Integer.parseInt(cid);
		int currentpage=Integer.parseInt(currentPage);
		RangeService rs=new RangeService();
		
		bookBean=rs.getBookByRange(cid,priceLow,priceHigh,rangeType,currentpage,pageContent);
		bookBean.setCid(Cid);

		request.setAttribute("bookBean", bookBean);
		request.setAttribute("cid", cid);
		request.setAttribute("priceLow", priceLow);
		request.setAttribute("priceHigh", priceHigh);
		request.setAttribute("rangeType", rangeType);
		request.getRequestDispatcher("/BookRange.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
