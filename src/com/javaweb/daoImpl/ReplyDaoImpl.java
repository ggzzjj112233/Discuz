package com.javaweb.daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.javaweb.dao.IReplyDaoable;
import com.javaweb.model.Reply;

public class ReplyDaoImpl implements IReplyDaoable{

	@Override
	public int addReply(Reply reply) {
		Connection conn1 = null;
		PreparedStatement statement = null;
		String sql = "INSERT INTO reply (postid,r_content,ruserid,rtime) VALUES (?,?,?,?);";
		try {
			conn1 = BaseDao.getConnection();
			statement = conn1.prepareStatement(sql);
			statement.setInt(1, reply.getPostid());
			statement.setString(2, reply.getR_content());
			statement.setInt(3, reply.getRuserid());
			statement.setString(4, reply.getRtime());
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
	public int updateReply(Reply reply) {
		Connection conn = null;
		PreparedStatement statement = null;
		String sql = "update reply set postid=?,r_content=?,ruserid=?,rtime=? where rid=?";
		try {
			conn = BaseDao.getConnection();
			statement = conn.prepareStatement(sql);
			statement.setInt(1, reply.getPostid());
			statement.setString(2, reply.getR_content());
			statement.setInt(3, reply.getRuserid());
			statement.setString(4, reply.getRtime());
			statement.setInt(5, reply.getRid());
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
	public int deleteReply(int rid) {
		Connection conn = null;
		PreparedStatement statement = null;
		String sql = "delete from reply where rid=?";
		try {
			conn = BaseDao.getConnection();
			statement = conn.prepareStatement(sql);
			statement.setInt(1, rid);
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
	public Reply selectOneReply(String where) {
		Connection conn = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		Reply reply = new Reply();
		String sql = "select * from reply where 1=1" + where;
		try {
			conn = BaseDao.getConnection();
			statement = conn.prepareStatement(sql);
			resultSet = statement.executeQuery();
			if (resultSet.next()) {
				reply.setRid(resultSet.getInt("rid"));				
				reply.setPostid(resultSet.getInt("postid"));
				reply.setR_content(resultSet.getString("r_content"));
				reply.setRuserid(resultSet.getInt("ruserid"));
				reply.setRtime(resultSet.getString("rtime"));
			}
			return reply;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			BaseDao.close(resultSet, statement, conn);
		}
	}

	@Override
	public ArrayList<Reply> selectReplys(String where) {
		Connection conn = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		ArrayList<Reply> replylist = new ArrayList<Reply>();
		String sql = "select * from reply where 1=1" + where;
		try {
			conn = BaseDao.getConnection();
			statement = conn.prepareStatement(sql);
			resultSet = statement.executeQuery();
			while (resultSet.next()) {
				Reply reply = new Reply();
				reply.setRid(resultSet.getInt("rid"));				
				reply.setPostid(resultSet.getInt("postid"));
				reply.setR_content(resultSet.getString("r_content"));
				reply.setRuserid(resultSet.getInt("ruserid"));
				reply.setRtime(resultSet.getString("rtime"));				
				replylist.add(reply);
			}
			return replylist;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			BaseDao.close(resultSet, statement, conn);
		}
	}

	@Override
	public Reply getLastReplyTime(int pid) {
		Connection conn = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		Reply reply=new Reply();
		String sql = "SELECT rtime from reply WHERE postid='"+pid+"' ORDER BY rtime desc LIMIT 1";
		try {
			conn = BaseDao.getConnection();
			statement = conn.prepareStatement(sql);
			resultSet = statement.executeQuery();
			if (resultSet.next()) {	
				reply.setRtime(resultSet.getString("rtime"));	
			}
			return reply;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			BaseDao.close(resultSet, statement, conn);
		}
	}

	@Override
	public int getRcount(int sb_id) {
		int i=0;
		Connection conn = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		String sql = "SELECT COUNT(*) FROM reply INNER JOIN post on reply.postid=post.pid WHERE smallid='"+sb_id+"'";
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
