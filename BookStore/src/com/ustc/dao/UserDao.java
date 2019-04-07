package com.ustc.dao;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.ustc.instance.User;
import com.ustc.utils.c3p0Utils;

public class UserDao {

	public User login(String username, String password) {
		User user=null;
		QueryRunner qr=new QueryRunner(c3p0Utils.getDataSource());
		String sql ="select * from user where username=? and password=?";
		
		try {
			user=qr.query(sql, new BeanHandler<User>(User.class),username,password);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}

	public int register(User user) throws SQLException {
		QueryRunner qr= new QueryRunner(c3p0Utils.getDataSource());
		String sql= "insert into user values(null,?,?,?,?,?,?,?)";
		int update = qr.update(sql,user.getUsername(),user.getPassword(),user.getName(),user.getEmail(),user.getTelephone(),user.getState(),user.getActiveCode());
		
		return update;
	}

	public Long checkUsernameExist(String username) throws SQLException {
		QueryRunner qr=new QueryRunner(c3p0Utils.getDataSource());
		String sql="select count(*) from user where username=?";
		Long query = qr.query(sql, new ScalarHandler<>(),username);
		return query;
	}

	public int changePassword(String username, String newpassword) throws SQLException {
		QueryRunner qr=new QueryRunner(c3p0Utils.getDataSource());
		String sql="update user set password=? where username=?";
		int update = qr.update(sql, newpassword,username);
		return update ;
	}

}
