package com.ustc.service;

import java.sql.SQLException;

import com.ustc.dao.UserDao;
import com.ustc.instance.User;

public class UserService {

	public User login(String username, String password) {
		UserDao dao=new UserDao();
		return dao.login(username,password);
		
	}

	public boolean register(User user) {
		UserDao dao= new UserDao();
	int row=0;
	try {
		row = dao.register(user);
	} catch (SQLException e) {
		
		e.printStackTrace();
	}
		return row>0?true:false;
	}

	public boolean checkUsernameExist(String username) {
		UserDao dao=new UserDao();
		Long row=0L;
		try {
			row = dao.checkUsernameExist(username);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return row>0?true:false;
	}

	public int changePassword(String username, String newpassword) {
		UserDao dao=new UserDao();
		int row=0;
		try {
			row=dao.changePassword(username,newpassword);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return row;
	}

}
