package com.javaweb.serviceImpl;

import java.util.ArrayList;
import java.sql.*;
import com.javaweb.dao.IUserdateDaoable;
import com.javaweb.daoImpl.BaseDao;
import com.javaweb.daoImpl.UserdateDaoImpl;
import com.javaweb.model.Userdate;
import com.javaweb.service.Registable;

public class RegistImpl implements Registable{
    IUserdateDaoable ud=new UserdateDaoImpl();
    		
	@Override
	public int regist(Userdate userdate) {
		ud.addUserdate(userdate);
		return 1;		
	}

	@Override
	public ArrayList<Userdate> getUserName() {
		Connection conn = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		ArrayList<Userdate> userlist = new ArrayList<Userdate>();
		String sql = "select * from userdate";
		try {
			conn = BaseDao.getConnection();
			statement = conn.prepareStatement(sql);
			resultSet = statement.executeQuery();
			while (resultSet.next()) {
				Userdate userdate = new Userdate();
				userdate.setUser_name(resultSet.getString("user_name"));
				userlist.add(userdate);
			}
			return userlist;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			BaseDao.close(resultSet, statement, conn);
		}
	}

}
