package com.ustc.utils;

import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class c3p0Utils {
	private static ComboPooledDataSource ds=new ComboPooledDataSource();
	//将connection存到线程中，保证service层和dao层的独立，也就是service层中不出现connection也能执行事务
	private static ThreadLocal<Connection> tl =new ThreadLocal<Connection>();
	
	public static DataSource getDataSource() {
		return ds;
	}

	/**
	 * 开启事务
	 * @throws SQLException 
	 * 
	 * */
	public static void startTransaction() throws SQLException {
		Connection con=getConnection();
		if(con!=null)
		con.setAutoCommit(false);
	}
	/**
	 *回滚事务
	 * @throws SQLException 
	 * 
	 * */
	public static void rollback() throws SQLException {
		Connection con=getConnection();
		if(con!=null)
		con.rollback();
	}
	/**
	 *提交事务
	 * @throws SQLException 
	 * 
	 * */
	public static void commit() throws SQLException {
		Connection con=getConnection();
		if(con!=null) {
			//提交 关闭资源 并且从绑定线程中移除
		con.commit();
		tl.remove();
		con.close();
		}
		
	}
	/**
	 * 获取当前线程中的connection
	 * */
	public static Connection getConnection() throws SQLException {
		Connection con=tl.get();
		if(con==null) {
			con=ds.getConnection();
			tl.set(con);
		}

		return con;
	}
	
	
}
