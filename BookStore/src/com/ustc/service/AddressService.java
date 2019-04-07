package com.ustc.service;

import java.sql.SQLException;
import java.util.List;

import com.ustc.dao.AddressDao;
import com.ustc.instance.Address;

public class AddressService {

	public int addAddress(Address add) {
		AddressDao dao=new AddressDao();
		try {
			return dao.addAddress(add);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return 0;
	}

	public List<Address> getAddress(int id) {
		AddressDao dao=new AddressDao();
		try {
			return dao.getAddress(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public int deleteAddress(String addinfoid) {
		AddressDao dao=new AddressDao();
		try {
			return dao.deleteAddress(addinfoid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return 0;
	}

	public int changeDefaultAddress(String addinfoid, int i) {
		AddressDao dao=new AddressDao();
		try {
			return dao.changeDefaultAddress(addinfoid,i);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return 0;
	}

}
