package com.ustc.instance;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Order {
		private String oid;//订单号
		private Date ordertime;//下单时间
		private int totalprice;//该订单的总金额
		private int state;//订单的状态 1代表已付款，0代表为付款
		private String address;//收货人地址
		private String name;//收货人姓名
		private String telephone;//收货人电话
		
		private User user;//该订单属于哪个用户
		
		private List<OrderItem> orderItems =new ArrayList<OrderItem>();
		
		public List<OrderItem> getOrderItems() {
			return orderItems;
		}

		public void setOrderItems(List<OrderItem> orderItems) {
			this.orderItems = orderItems;
		}

		public String getOid() {
			return oid;
		}

		public void setOid(String oid) {
			this.oid = oid;
		}

		public Date getOrdertime() {
			return ordertime;
		}

		public void setOrdertime(Date ordertime) {
			this.ordertime = ordertime;
		}

		public int getTotalprice() {
			return totalprice;
		}

		public void setTotalprice(int totalprice) {
			this.totalprice = totalprice;
		}

		public int getState() {
			return state;
		}

		public void setState(int state) {
			this.state = state;
		}

		public String getAddress() {
			return address;
		}

		public void setAddress(String address) {
			this.address = address;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public String getTelephone() {
			return telephone;
		}

		public void setTelephone(String telephone) {
			this.telephone = telephone;
		}

		public User getUser() {
			return user;
		}

		public void setUser(User user) {
			this.user = user;
		}
		
			
}
