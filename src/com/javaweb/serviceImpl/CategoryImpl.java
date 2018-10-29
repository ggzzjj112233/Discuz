package com.javaweb.serviceImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.javaweb.daoImpl.BaseDao;
import com.javaweb.service.Categoryable;

public class CategoryImpl implements Categoryable {

	@Override
	public String getCategoryname(int cid) {
		String categoryname = "";
		Connection conn = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		String sql = "SELECT cgname FROM category WHERE cgid = '"+ cid +"'";
		try {
			conn = BaseDao.getConnection();
			statement = conn.prepareStatement(sql);
			resultSet = statement.executeQuery();
			if (resultSet.next()) {
				categoryname = resultSet.getString("cgname");
			}
			return categoryname;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			BaseDao.close(resultSet, statement, conn);
		}
	}

	@Override
	public String getCatename(int postid) {
		String catename = "";
		Connection conn = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		String sql = "SELECT cgname FROM category WHERE cgid = (SELECT cid FROM post WHERE pid = '"+ postid +"')";
		try {
			conn = BaseDao.getConnection();
			statement = conn.prepareStatement(sql);
			resultSet = statement.executeQuery();
			if (resultSet.next()) {
				catename = resultSet.getString("cgname");
			}
			return catename;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			BaseDao.close(resultSet, statement, conn);
		}
	}

}
