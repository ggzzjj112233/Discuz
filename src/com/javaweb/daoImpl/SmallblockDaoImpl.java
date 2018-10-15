package com.javaweb.daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.javaweb.dao.ISmallblockDaoable;
import com.javaweb.model.Smallblock;

public class SmallblockDaoImpl implements ISmallblockDaoable{

	@Override
	public int addSmallblock(Smallblock smallblock) {
		Connection conn1 = null;
		PreparedStatement statement = null;
		String sql = "INSERT INTO smallblock (bigid,sb_name,count) VALUES (?,?,?);";
		try {
			conn1 = BaseDao.getConnection();
			statement = conn1.prepareStatement(sql);
			statement.setInt(1, smallblock.getBigid());
			statement.setString(2, smallblock.getSb_name());
			statement.setInt(3, smallblock.getCount());
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
	public int updateSmallblock(Smallblock smallblock) {
		Connection conn = null;
		PreparedStatement statement = null;
		String sql = "update smallblock set bigid=? sb_name=? count=? where sb_id=?";
		try {
			conn = BaseDao.getConnection();
			statement = conn.prepareStatement(sql);
			statement.setInt(1, smallblock.getBigid());
			statement.setString(2, smallblock.getSb_name());
			statement.setInt(3, smallblock.getCount());
			statement.setInt(4, smallblock.getSb_id());
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
	public int deleteSmallblock(int sb_id) {
		Connection conn = null;
		PreparedStatement statement = null;
		String sql = "delete from smallblock where sb_id=?";
		try {
			conn = BaseDao.getConnection();
			statement = conn.prepareStatement(sql);
			statement.setInt(1, sb_id);
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
	public Smallblock selectOneSmallblock(String where) {
		Connection conn = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		Smallblock smallblock = new Smallblock();
		String sql = "select * from smallblock where 1=1" + where;
		try {
			conn = BaseDao.getConnection();
			statement = conn.prepareStatement(sql);
			resultSet = statement.executeQuery();
			if (resultSet.next()) {
				smallblock.setSb_id(resultSet.getInt("sb_id"));
				smallblock.setBigid(resultSet.getInt("bigid"));
				smallblock.setSb_name(resultSet.getString("sb_name"));
				smallblock.setCount(resultSet.getInt("count"));
			}
			return smallblock;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			BaseDao.close(resultSet, statement, conn);
		}
	}

	@Override
	public ArrayList<Smallblock> selectSmallblocks(String where) {
		Connection conn = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		ArrayList<Smallblock> smallblocklist = new ArrayList<Smallblock>();
		String sql = "select * from smallblock where 1=1" + where;
		try {
			conn = BaseDao.getConnection();
			statement = conn.prepareStatement(sql);
			resultSet = statement.executeQuery();
			while (resultSet.next()) {
				Smallblock smallblock = new Smallblock();
				smallblock.setSb_id(resultSet.getInt("sb_id"));
				smallblock.setBigid(resultSet.getInt("bigid"));
				smallblock.setSb_name(resultSet.getString("sb_name"));	
				smallblock.setCount(resultSet.getInt("count"));
				smallblocklist.add(smallblock);
			}
			return smallblocklist;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			BaseDao.close(resultSet, statement, conn);
		}
	}

}
