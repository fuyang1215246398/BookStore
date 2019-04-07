package com.ustc.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.ustc.instance.Address;
import com.ustc.utils.c3p0Utils;

public class AddressDao {

	public int addAddress(Address add) throws SQLException {
		QueryRunner qr=new QueryRunner(c3p0Utils.getDataSource());
		String sql="insert into addressinfo values(?,?,?,?,?,?)";
	int row=qr.update(sql, add.getAddinfoid(),add.getUid(),add.getAddress(),add.getName(),add.getTelephone(),add.getIsdefault());
		
		return row;
	}

	
	public int deleteAddress(String addinfoid) throws SQLException {
		QueryRunner qr=new QueryRunner(c3p0Utils.getDataSource());
		String sql="delete from addressinfo where addinfoid=? ";
	int row=qr.update(sql,addinfoid);
		
		return row;
	}

	public int changeDefaultAddress(String addinfoid, int i) throws SQLException {
		QueryRunner qr=new QueryRunner(c3p0Utils.getDataSource());
	String sql="update addressinfo set isdefault=0 where isdefault=1 and uid=? ";
		qr.update(sql,i);
		String sql1="update addressinfo set isdefault=1 where addinfoid=?";
	int row=qr.update(sql1,addinfoid);
		
		return row;
	}

	public List<Address> getAddress(int id) throws SQLException {
		QueryRunner qr=new QueryRunner(c3p0Utils.getDataSource());
		String sql="select * from addressinfo where uid=? order by isdefault desc";
		List<Address> query = qr.query(sql, new BeanListHandler<Address>(Address.class),id);
		return query;
	}

}
