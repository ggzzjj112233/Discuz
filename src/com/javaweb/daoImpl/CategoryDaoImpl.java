package com.javaweb.daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.javaweb.dao.ICategoryDaoable;

public class CategoryDaoImpl implements ICategoryDaoable{

	@Override
	public int getCatecount1() {
		int i=0;
		Connection conn = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		String sql = "SELECT COUNT(*) FROM post where cid = 1";
		try {
			conn = BaseDao.getConnection();
			statement = conn.prepareStatement(sql);
			resultSet = statement.executeQuery();
			if (resultSet.next()) {
				i=resultSet.getInt("count(*)");
			}
			return i;
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		} finally {
			BaseDao.close(resultSet, statement, conn);
		}
	}

	@Override
	public int getCatecount2() {
		int i=0;
		Connection conn = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		String sql = "SELECT COUNT(*) FROM post where cid = 2";
		try {
			conn = BaseDao.getConnection();
			statement = conn.prepareStatement(sql);
			resultSet = statement.executeQuery();
			if (resultSet.next()) {
				i=resultSet.getInt("count(*)");
			}
			return i;
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		} finally {
			BaseDao.close(resultSet, statement, conn);
		}
	}

	@Override
	public int getCatecount3() {
		int i=0;
		Connection conn = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		String sql = "SELECT COUNT(*) FROM post where cid = 3";
		try {
			conn = BaseDao.getConnection();
			statement = conn.prepareStatement(sql);
			resultSet = statement.executeQuery();
			if (resultSet.next()) {
				i=resultSet.getInt("count(*)");
			}
			return i;
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		} finally {
			BaseDao.close(resultSet, statement, conn);
		}
	}

	@Override
	public int getCatecount4() {
		int i=0;
		Connection conn = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		String sql = "SELECT COUNT(*) FROM post where cid = 4";
		try {
			conn = BaseDao.getConnection();
			statement = conn.prepareStatement(sql);
			resultSet = statement.executeQuery();
			if (resultSet.next()) {
				i=resultSet.getInt("count(*)");
			}
			return i;
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		} finally {
			BaseDao.close(resultSet, statement, conn);
		}
	}

	@Override
	public int getCatecount5() {
		int i=0;
		Connection conn = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		String sql = "SELECT COUNT(*) FROM post where cid = 5";
		try {
			conn = BaseDao.getConnection();
			statement = conn.prepareStatement(sql);
			resultSet = statement.executeQuery();
			if (resultSet.next()) {
				i=resultSet.getInt("count(*)");
			}
			return i;
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		} finally {
			BaseDao.close(resultSet, statement, conn);
		}
	}

}
