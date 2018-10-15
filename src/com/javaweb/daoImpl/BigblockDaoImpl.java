package com.javaweb.daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.javaweb.dao.IBigblockDaoable;
import com.javaweb.model.Bigblock;

public class BigblockDaoImpl implements IBigblockDaoable {

	@Override
	public int addBigblock(Bigblock bigblock) {
		Connection conn1 = null;
		PreparedStatement statement = null;
		String sql = "INSERT INTO bigblock (bb_name) VALUES (?);";
		try {
			conn1 = BaseDao.getConnection();
			statement = conn1.prepareStatement(sql);
			statement.setString(1, bigblock.getBb_name());
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
	public int updateBigblock(Bigblock bigblock) {
		Connection conn = null;
		PreparedStatement statement = null;
		String sql = "update bigblock set bb_name=? where bb_id=?";
		try {
			conn = BaseDao.getConnection();
			statement = conn.prepareStatement(sql);
			statement.setString(1, bigblock.getBb_name());
			statement.setInt(2, bigblock.getBb_id());
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
	public int deleteBigblock(int bb_id) {
		Connection conn = null;
		PreparedStatement statement = null;
		String sql = "delete from bigblock where bb_id=?";
		try {
			conn = BaseDao.getConnection();
			statement = conn.prepareStatement(sql);
			statement.setInt(1, bb_id);
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
	public Bigblock selectOneBigblock(String where) {
		Connection conn = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		Bigblock bigblock =new Bigblock();
		String sql = "select * from bigblock where 1=1" + where;
		try {
			conn = BaseDao.getConnection();
			statement = conn.prepareStatement(sql);
			resultSet = statement.executeQuery();
			if (resultSet.next()) {
				bigblock.setBb_id(resultSet.getInt("bb_id"));
				bigblock.setBb_name(resultSet.getString("bb_name"));
			}
			return bigblock;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			BaseDao.close(resultSet, statement, conn);
		}
	}

	@Override
	public ArrayList<Bigblock> selectBigblocks(String where) {
		Connection conn = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		ArrayList<Bigblock> bigblocklist = new ArrayList<Bigblock>();
		String sql = "select * from bigblock where 1=1" + where;
		try {
			conn = BaseDao.getConnection();
			statement = conn.prepareStatement(sql);
			resultSet = statement.executeQuery();
			while (resultSet.next()) {
				Bigblock bigblock = new Bigblock();
				bigblock.setBb_id(resultSet.getInt("bb_id"));
				bigblock.setBb_name(resultSet.getString("bb_name"));			
				bigblocklist.add(bigblock);
			}
			return bigblocklist;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			BaseDao.close(resultSet, statement, conn);
		}
	}

}
