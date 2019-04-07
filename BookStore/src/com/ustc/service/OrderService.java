package com.ustc.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ustc.dao.OrderDao;
import com.ustc.instance.Order;
import com.ustc.instance.OrderItem;
import com.ustc.utils.c3p0Utils;

public class OrderService {

	public void submitOrder(Order order) {
		OrderDao dao =new OrderDao();
		try {
			//1开启事务
			c3p0Utils.startTransaction();
			//调用dao存储order表数据的方法
			dao.addOrders(order);
			//调用dao存储orderitem数据的方法
			dao.addOrderItem(order);
		} catch (SQLException e) {
		try {
			c3p0Utils.rollback();
		} catch (SQLException e1) {
			
			e1.printStackTrace();
		}
			e.printStackTrace();
		}finally {
			try {
				c3p0Utils.commit();
			} catch (SQLException e) {
			
				e.printStackTrace();
			}
		}
		
	}

	public void updateInfo(String address, String name, String telephone, String oid) {
		OrderDao dao=new OrderDao();
		dao.updateInfo(address,name,telephone,oid);
	}

	public List<Order> findAllOrders(int id) {
		OrderDao dao= new OrderDao();
		List<Order> orders=null;
		try {
			orders=dao.findAllOrders(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return orders;
	}

	public List<Map<String, Object>> findAllOrderItemByOid(String oid) {
		OrderDao dao=new OrderDao();
		List<Map<String, Object>> list=null;
		try {
			list= dao.findAllOrderItemByOid(oid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public Order findOrdersByOid(String oid) {
		OrderDao dao= new OrderDao();
		Order order=null;
		try {
			order=dao.findOrderByOid(oid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return order;
	}

	public int deleteOrder(String oid) {
		OrderDao dao=new OrderDao();
		int row=0;
		try {
			c3p0Utils.startTransaction();
			row=dao.deleteOrder(oid);
		} catch (SQLException e) {
			try {
				c3p0Utils.rollback();
			} catch (SQLException e1) {
				
				e1.printStackTrace();
			}
			
			e.printStackTrace();
		}finally {
			try {
				c3p0Utils.commit();
			} catch (SQLException e) {
			
				e.printStackTrace();
			}
		}
		
		return row;
	}

	public void updateBookInfo(String bid, int count) {
		OrderDao dao=new OrderDao();
		dao.updateBookInfo(bid,count);
	}

}
