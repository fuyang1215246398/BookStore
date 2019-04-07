package com.ustc.instance;
import java.util.*;
public class BookBean {
	private  List<Book> bookList;
	private Long  totalCount;
	private int currentPage;
	private int totalPage;
	private int pageContent;
	private int cid;
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public List<Book> getBookList() {
		return bookList;
	}
	public void setBookList(List<Book> bookList) {
		this.bookList = bookList;
	}
	public Long getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(Long totalCount) {
		this.totalCount = totalCount;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getPageContent() {
		return pageContent;
	}
	public void setPageContent(int pageContent) {
		this.pageContent = pageContent;
	}
	
}
