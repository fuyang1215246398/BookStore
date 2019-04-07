package com.ustc.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;

import com.ustc.instance.Order;
import com.ustc.instance.OrderItem;
import com.ustc.utils.c3p0Utils;

public class OrderDao {

	//向Order表插入数据
	public void addOrders(Order order) throws SQLException {
		QueryRunner qr=new QueryRunner();
		Connection con=null;
		try {
			 con=c3p0Utils.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		String sql="insert into orders values(?,?,?,?,?,?,?,?)";
		qr.update(con, sql,order.getOid(),order.getOrdertime(),order.getTotalprice(),
				order.getState(),order.getAddress(),order.getName(),order.getTelephone(),order.getUser().getId());
	}
	//向OrderItem表插入数据
	public void addOrderItem(Order order) throws SQLException {
		QueryRunner qr=new QueryRunner();
		Connection con=null;
		try {
			 con=c3p0Utils.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		String sql="insert into orderitem values(?,?,?,?,?)";
		List<OrderItem> orderItems = order.getOrderItems();
		for(OrderItem item:orderItems) {
			qr.update(con, sql, item.getItemid(),item.getCount(),item.getSubtotal(),item.getBook().getBid(),item.getOrder().getOid());
		}
		
	}
	public void updateInfo(String address, String name, String telephone, String oid) {
		QueryRunner qr=new QueryRunner(c3p0Utils.getDataSource());
		String sql="update orders set address=? , name=? , telephone=? , state=1 where oid=?";
		try {
			qr.update(sql,address,name,telephone,oid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public List<Order> findAllOrders(int id) throws SQLException {
		QueryRunner qr=new QueryRunner(c3p0Utils.getDataSource());
		String sql="select * from orders where uid=? order by ordertime desc";
		return qr.query(sql, new BeanListHandler<Order>(Order.class),id);
		
	}
	public List<Map<String, Object>> findAllOrderItemByOid(String oid) throws SQLException {
		QueryRunner qr=new QueryRunner(c3p0Utils.getDataSource());
		String sql="select * from  orderitem i,book b where i.bid=b.Bid and oid=?";
		List<Map<String, Object>> mapList = qr.query(sql, new MapListHandler(),oid);
		return mapList;
	}
	public Order findOrderByOid(String oid) throws SQLException {
		QueryRunner qr=new QueryRunner(c3p0Utils.getDataSource());
		String sql="select * from orders where oid=?";
		return qr.query(sql, new BeanHandler<Order>(Order.class),oid);
	
	}
	public int deleteOrder(String oid) throws SQLException {
		QueryRunner qr=new QueryRunner();
		Connection con=c3p0Utils.getConnection();
		String sql1="delete from orderitem where oid=?";
		String sql2="delete from orders where oid=?";
		int row1=qr.update(con, sql1,oid);
		int row2=qr.update(con,sql2,oid);
		return row1+row2;
	}
	public void updateBookInfo(String bid, int count) {
		QueryRunner qr=new QueryRunner(c3p0Utils.getDataSource());
		String sql="update book set storage=storage-? , soldout=soldout+? where bid=?";
		try {
			qr.update(sql,count,count,bid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
