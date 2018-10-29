package com.javaweb.serviceImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.javaweb.dao.IUserdateDaoable;
import com.javaweb.daoImpl.BaseDao;
import com.javaweb.daoImpl.UserdateDaoImpl;
import com.javaweb.model.Userdate;
import com.javaweb.service.Userdateable;

public class UserdateImpl implements Userdateable {
	IUserdateDaoable udd = new UserdateDaoImpl();

	@Override
	public void regist(Userdate userdate) {
		udd.addUserdate(userdate);

	}

	@Override
	public Userdate login(String username, String password) {
		String where = "and user_name = '" + username + "' and user_psd = '" + password + "'";
		Userdate userdate = udd.selectOneUserdate(where);
		if (userdate != null) {
			return userdate;// µÇÂ½³É¹¦
		} else {
			return null;// µÇÂ½Ê§°Ü
		}
	}

	@Override
	public String getUsername(int userid) {
		String username = "";
		Connection conn = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		String sql = "SELECT user_name FROM userdate WHERE user_id = '" + userid + "'";
		try {
			conn = BaseDao.getConnection();
			statement = conn.prepareStatement(sql);
			resultSet = statement.executeQuery();
			if (resultSet.next()) {
				username = resultSet.getString("user_name");
			}
			return username;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			BaseDao.close(resultSet, statement, conn);
		}
	}

	@Override
	public String getPostUserName(int postid) {
		String pusername = "";
		Connection conn = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		String sql = "SELECT user_name FROM userdate WHERE user_id IN (SELECT puserid FROM post WHERE pid = '" + postid
				+ "')";
		try {
			conn = BaseDao.getConnection();
			statement = conn.prepareStatement(sql);
			resultSet = statement.executeQuery();
			if (resultSet.next()) {
				pusername = resultSet.getString("user_name");
			}
			return pusername;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			BaseDao.close(resultSet, statement, conn);
		}
	}

}
