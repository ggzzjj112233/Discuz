package com.javaweb.daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.javaweb.dao.IPostDaoable;
import com.javaweb.model.Post;

public class PostDaoImpl implements IPostDaoable {

	@Override
	public int getAll(int smallid) {
		int i = 0;
		Connection conn = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		String sql = "select count(*) from post where smallid='" + smallid + "'+1";
		try {
			conn = BaseDao.getConnection();
			statement = conn.prepareStatement(sql);
			resultSet = statement.executeQuery();
			if (resultSet.next()) {
				i = resultSet.getInt("count(*)");
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
	public String getPname(int smallid) {
		String pname = "";
		Connection conn = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		String sql = "SELECT pname FROM reply LEFT JOIN post ON reply.postid = post.pid LEFT JOIN smallblock ON post.smallid = smallblock.sb_id WHERE smallblock.sb_id = '"
				+ smallid + "'+1 ORDER BY reply.rtime desc LIMIT 1";
		try {
			conn = BaseDao.getConnection();
			statement = conn.prepareStatement(sql);
			resultSet = statement.executeQuery();
			if (resultSet.next()) {
				pname = resultSet.getString("pname");
			}
			return pname;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			BaseDao.close(resultSet, statement, conn);
		}
	}
	
	@Override
	public String getPnamebyptime(int smallid) {
		String pname = "";
		Connection conn = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		String sql = "SELECT pname from post WHERE smallid = '"+smallid+"'+1 order by ptime desc limit 1";
		try {
			conn = BaseDao.getConnection();
			statement = conn.prepareStatement(sql);
			resultSet = statement.executeQuery();
			if (resultSet.next()) {
				pname = resultSet.getString("pname");
			}
			return pname;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			BaseDao.close(resultSet, statement, conn);
		}
	}
	
	@Override
	public String getPtimebyptime(int smallid) {
		String ptime = "";
		Connection conn = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		String sql = "SELECT ptime from post WHERE smallid = '"+smallid+"'+1 order by ptime desc limit 1";
		try {
			conn = BaseDao.getConnection();
			statement = conn.prepareStatement(sql);
			resultSet = statement.executeQuery();
			if (resultSet.next()) {
				ptime = resultSet.getString("ptime");
			}
			return ptime;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			BaseDao.close(resultSet, statement, conn);
		}
	}

	@Override
	public String getPusernamebyptime(int smallid) {
		String pusername = "";
		Connection conn = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		String sql = "SELECT user_name from userdate inner join post on userdate.user_id=post.puserid WHERE smallid = '"+smallid+"'+1 order by ptime desc limit 1";
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
	
	@Override
	public String getLastrtime(int smallid) {
		String lastrtime = "";
		Connection conn = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		String sql = "SELECT rtime FROM reply WHERE postid = (SELECT pid FROM post WHERE smallid ='" + smallid
				+ "'+1 ORDER BY pid DESC LIMIT 1) ORDER BY rid DESC LIMIT 1 ";
		try {
			conn = BaseDao.getConnection();
			statement = conn.prepareStatement(sql);
			resultSet = statement.executeQuery();
			if (resultSet.next()) {
				lastrtime = resultSet.getString("rtime");
			}
			return lastrtime;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			BaseDao.close(resultSet, statement, conn);
		}
	}

	@Override
	public String getRusername(int smallid) {
		String rusername = "";
		Connection conn = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		String sql = "SELECT user_name FROM userdate WHERE user_id = (SELECT ruserid FROM reply WHERE postid = (SELECT pid FROM post WHERE smallid = '"
				+ smallid + "'+1 ORDER BY pid DESC LIMIT 1) ORDER BY rid DESC LIMIT 1)";
		try {
			conn = BaseDao.getConnection();
			statement = conn.prepareStatement(sql);
			resultSet = statement.executeQuery();
			if (resultSet.next()) {
				rusername = resultSet.getString("user_name");
			}
			return rusername;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			BaseDao.close(resultSet, statement, conn);
		}
	}

	@Override
	public int getTodayCount() {
		int i = 0;
		Connection conn = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		String sql = "SELECT COUNT(*) FROM post WHERE DATEDIFF(ptime,NOW())=0";
		try {
			conn = BaseDao.getConnection();
			statement = conn.prepareStatement(sql);
			resultSet = statement.executeQuery();
			if (resultSet.next()) {
				i = resultSet.getInt("count(*)");
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
	public int getYesterdayCount() {
		int i = 0;
		Connection conn = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		String sql = "SELECT COUNT(*) FROM post WHERE DATEDIFF(ptime,NOW())=-1";
		try {
			conn = BaseDao.getConnection();
			statement = conn.prepareStatement(sql);
			resultSet = statement.executeQuery();
			if (resultSet.next()) {
				i = resultSet.getInt("count(*)");
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
	public int getcount() {
		int i = 0;
		Connection conn = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		String sql = "SELECT COUNT(*) FROM post";
		try {
			conn = BaseDao.getConnection();
			statement = conn.prepareStatement(sql);
			resultSet = statement.executeQuery();
			if (resultSet.next()) {
				i = resultSet.getInt("count(*)");
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
	public int addPost(Post post) {
		Connection conn1 = null;
		PreparedStatement statement = null;
		String sql = "INSERT INTO post (smallid,cid,p_content,puserid,ptime,pname) VALUES (?,?,?,?,default,?);";
		try {
			conn1 = BaseDao.getConnection();
			statement = conn1.prepareStatement(sql);
			statement.setInt(1, post.getSmallid());
			statement.setInt(2, post.getCid());
			statement.setString(3, post.getP_content());
			statement.setInt(4, post.getPuserid());
			statement.setString(5, post.getPname());
			int count = statement.executeUpdate();
			return count;
		} catch (SQLException e) {
			e.printStackTrace();
			return -1;
		} finally {
			BaseDao.close(statement, conn1);
		}
	}

	

	
	

}
