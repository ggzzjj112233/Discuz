package com.javaweb.serviceImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.javaweb.daoImpl.BaseDao;
import com.javaweb.model.Post;
import com.javaweb.service.Postable;

public class PostImpl implements Postable {

	@Override
	public ArrayList<Post> selectposts(int smallid, int page) {
		Connection conn = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		ArrayList<Post> posts = new ArrayList<Post>();
		String sql = "SELECT * FROM post WHERE smallid = ? ORDER BY ptime desc LIMIT ?,3";
		try {
			conn = BaseDao.getConnection();
			statement = conn.prepareStatement(sql);
			statement.setInt(1, smallid);
			statement.setInt(2, page);
			resultSet = statement.executeQuery();
			while (resultSet.next()) {
				Post post = new Post();
				post.setPid(resultSet.getInt("pid"));				
				post.setSmallid(resultSet.getInt("smallid"));
				post.setCid(resultSet.getInt("cid"));
				post.setP_content(resultSet.getString("p_content"));
				post.setPuserid(resultSet.getInt("puserid"));
				post.setPtime(resultSet.getString("ptime"));
				post.setPname(resultSet.getString("pname"));				
				posts.add(post);
			}
			return posts;
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
		String sql = "SELECT ptime,TIMESTAMPDIFF(SECOND,ptime,NOW()) as second FROM post WHERE pid ='"+postid+"'";
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
	public int getCount(int smallid) {
		int count = 0;
		Connection conn = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		String sql = "SELECT COUNT(*) FROM post where smallid ='"+smallid+"'";
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
	public String getPname(int postid) {
		String pname = "";
		Connection conn = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		String sql = "SELECT pname FROM post WHERE pid = '"+ postid +"'";
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
	public String getPtime(int postid) {
		String ptime = "";
		Connection conn = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		String sql = "SELECT ptime FROM post WHERE pid = '"+ postid +"'";
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
	public String getPcontent(int postid) {
		String pcontent = "";
		Connection conn = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		String sql = "SELECT p_content FROM post WHERE pid = '"+ postid +"'";
		try {
			conn = BaseDao.getConnection();
			statement = conn.prepareStatement(sql);
			resultSet = statement.executeQuery();
			if (resultSet.next()) {
				pcontent = resultSet.getString("p_content");
			}
			return pcontent;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			BaseDao.close(resultSet, statement, conn);
		}
	}

	@Override
	public String getPusername(int postid) {
		String pusername = "";
		Connection conn = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		String sql = "SELECT user_name from userdate inner join post on userdate.user_id=post.puserid WHERE post.pid = '"+ postid +"'";
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
