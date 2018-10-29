package com.javaweb.serviceImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.javaweb.daoImpl.BaseDao;
import com.javaweb.service.Replyable;

public class ReplyImpl implements Replyable{

	@Override
	public String getLastRname(int postid) {
		String lastRname = "";
		Connection conn = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		String sql = "SELECT user_name FROM userdate WHERE user_id = (SELECT ruserid FROM reply LEFT JOIN post ON reply.postid = post.pid WHERE pid = '"+ postid +"' ORDER BY rtime DESC LIMIT 1)";
		try {
			conn = BaseDao.getConnection();
			statement = conn.prepareStatement(sql);
			resultSet = statement.executeQuery();
			if (resultSet.next()) {
				lastRname = resultSet.getString("user_name");
			}
			return lastRname;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			BaseDao.close(resultSet, statement, conn);
		}
	}

	@Override
	public String getSecond(int postid) {
		String second = "";
		Connection conn = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		String sql = "SELECT rtime,TIMESTAMPDIFF(second,rtime,NOW()) AS second FROM reply WHERE postid = '"+ postid +"' ORDER BY rtime desc LIMIT 1";
		try {
			conn = BaseDao.getConnection();
			statement = conn.prepareStatement(sql);
			resultSet = statement.executeQuery();
			if (resultSet.next()) {
				second = resultSet.getString("second");
			}
			return second;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			BaseDao.close(resultSet, statement, conn);
		}
	}

	@Override
	public String getReplyName(int postid) {
		String replyname = "";
		Connection conn = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		String sql = "SELECT user_name FROM userdate WHERE user_id = (select ruserid from reply where postid='"+postid+"' order by rtime desc limit 1)";
		try {
			conn = BaseDao.getConnection();
			statement = conn.prepareStatement(sql);
			resultSet = statement.executeQuery();
			if (resultSet.next()) {
				replyname = resultSet.getString("user_name");
			}
			return replyname;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			BaseDao.close(resultSet, statement, conn);
		}
	}

	@Override
	public String getReplyTime(int postid) {
		String replytime = "";
		Connection conn = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		String sql = "select rtime from reply where postid='"+postid+"' order by rtime desc limit 1";
		try {
			conn = BaseDao.getConnection();
			statement = conn.prepareStatement(sql);
			resultSet = statement.executeQuery();
			if (resultSet.next()) {
				replytime = resultSet.getString("rtime");
			}
			return replytime;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			BaseDao.close(resultSet, statement, conn);
		}
	}

	@Override
	public int getCount(int postid) {
		int count = 0;
		Connection conn = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		String sql = "SELECT COUNT(*) FROM reply WHERE postid = '"+ postid +"'";
		try {
			conn = BaseDao.getConnection();
			statement = conn.prepareStatement(sql);
			resultSet = statement.executeQuery();
			if (resultSet.next()) {
				count = resultSet.getInt("COUNT(*)");
			}
			return count;
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		} finally {
			BaseDao.close(resultSet, statement, conn);
		}
	}

	@Override
	public String getRName(int userid) {
		String replyname = "";
		Connection conn = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		String sql = "SELECT user_name FROM userdate WHERE user_id in (select ruserid from reply where ruserid='"+userid+"')";
		try {
			conn = BaseDao.getConnection();
			statement = conn.prepareStatement(sql);
			resultSet = statement.executeQuery();
			if (resultSet.next()) {
				replyname = resultSet.getString("user_name");
			}
			return replyname;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			BaseDao.close(resultSet, statement, conn);
		}
	}

	@Override
	public String getRTime(int userid) {
		String replytime = "";
		Connection conn = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		String sql = "select rtime from reply where ruserid='"+userid+"'";
		try {
			conn = BaseDao.getConnection();
			statement = conn.prepareStatement(sql);
			resultSet = statement.executeQuery();
			if (resultSet.next()) {
				replytime = resultSet.getString("user_name");
			}
			return replytime;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			BaseDao.close(resultSet, statement, conn);
		}
	}

}
