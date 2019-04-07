package com.ustc.instance;

public class OrderItem {
		private String itemid;//订单项的id
		private int count;//订单项内购买的数量
		private int subtotal;//订单项的小计
		private Book book;//订单项内部的商品
		private Order order;//订单项所属的订单
		
		
		public String getItemid() {
			return itemid;
		}
		public void setItemid(String itemid) {
			this.itemid = itemid;
		}
		public int getCount() {
			return count;
		}
		public void setCount(int count) {
			this.count = count;
		}
		public int getSubtotal() {
			return subtotal;
		}
		public void setSubtotal(int subtotal) {
			this.subtotal = subtotal;
		}
		public Book getBook() {
			return book;
		}
		public void setBook(Book book) {
			this.book = book;
		}
		public Order getOrder() {
			return order;
		}
		public void setOrder(Order order) {
			this.order = order;
		}
		
}
