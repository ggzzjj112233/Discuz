package com.javaweb.daoImpl;

import java.util.ArrayList;
import com.javaweb.dao.IUserdateDaoable;
import com.javaweb.model.Userdate;
import java.sql.*;

public class UserdateDaoImpl implements IUserdateDaoable {

	@Override
	public int addUserdate(Userdate userdate) {
		Connection conn1 = null;
		PreparedStatement statement = null;
		String sql = "INSERT INTO userdate (user_name,user_psd,user_email,img) VALUES (?,?,?,?);";
		try {
			conn1 = BaseDao.getConnection();
			statement = conn1.prepareStatement(sql);
			statement.setString(1, userdate.getUser_name());
			statement.setString(2, userdate.getUser_psd());
			statement.setString(3, userdate.getUser_email());
			statement.setString(4, userdate.getImg());
			int count = statement.executeUpdate();
			return count;
		} catch (SQLException e) {
			e.printStackTrace();
			return -1;
		} finally {
			BaseDao.close(statement, conn1);
		}
	}

	@Override
	public int updateUserdate(Userdate userdate) {
		Connection conn = null;
		PreparedStatement statement = null;
		String sql = "update userdate set user_name=?,user_psd=?,user_email=?,img=? where user_id=?";
		try {
			conn = BaseDao.getConnection();
			statement = conn.prepareStatement(sql);
			statement.setString(1, userdate.getUser_name());
			statement.setString(2, userdate.getUser_psd());
			statement.setString(3, userdate.getUser_email());
			statement.setString(4, userdate.getImg());
			statement.setInt(5, userdate.getUser_id());
			int count = statement.executeUpdate();
			return count;
		} catch (SQLException e) {
			e.printStackTrace();
			return -1;
		} finally {
			BaseDao.close(statement, conn);
		}
	}

	@Override
	public int deleteUserdate(int user_id) {
		Connection conn = null;
		PreparedStatement statement = null;
		String sql = "delete from userdate where user_id=?";
		try {
			conn = BaseDao.getConnection();
			statement = conn.prepareStatement(sql);
			statement.setInt(1, user_id);
			int count = statement.executeUpdate();
			return count;
		} catch (SQLException e) {
			e.printStackTrace();
			return -1;
		} finally {
			BaseDao.close(statement, conn);
		}
	}

	@Override
	public Userdate selectOneUserdate(String where) {
		Connection conn = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		Userdate userdate = new Userdate();
		String sql = "select * from userdate where 1=1" + where;
		try {
			conn = BaseDao.getConnection();
			statement = conn.prepareStatement(sql);
			resultSet = statement.executeQuery();
			if (resultSet.next()) {
				userdate.setUser_id(resultSet.getInt("user_id"));
				userdate.setUser_name(resultSet.getString("user_name"));
				userdate.setUser_psd(resultSet.getString("user_psd"));
				userdate.setUser_email(resultSet.getString("user_email"));
				userdate.setImg(resultSet.getString("img"));
			}
			return userdate;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			BaseDao.close(resultSet, statement, conn);
		}
	}

	@Override
	public ArrayList<Userdate> selectUserdates(String where) {
		Connection conn = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		ArrayList<Userdate> userlist = new ArrayList<Userdate>();
		String sql = "select * from userdate where 1=1" + where;
		try {
			conn = BaseDao.getConnection();
			statement = conn.prepareStatement(sql);
			resultSet = statement.executeQuery();
			while (resultSet.next()) {
				Userdate userdate = new Userdate();
				userdate.setUser_id(resultSet.getInt("user_id"));
				userdate.setUser_name(resultSet.getString("user_name"));
				userdate.setUser_psd(resultSet.getString("user_psd"));
				userdate.setUser_email(resultSet.getString("user_email"));
				userdate.setImg(resultSet.getString("img"));				
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

	@Override
	public Userdate getLastReplyUser(int pid) {
		Connection conn = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		Userdate userdate=new Userdate();
		String sql = "SELECT user_name from userdate INNER JOIN reply on userdate.user_id=reply.ruserid WHERE postid='"+pid+"' ORDER BY rtime desc LIMIT 1";
		try {
			conn = BaseDao.getConnection();
			statement = conn.prepareStatement(sql);
			resultSet = statement.executeQuery();
			if (resultSet.next()) {	
				userdate.setUser_name(resultSet.getString("user_name"));	
			}
			return userdate;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			BaseDao.close(resultSet, statement, conn);
		}
	}

}
