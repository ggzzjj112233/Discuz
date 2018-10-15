package com.javaweb.daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.javaweb.dao.IPostDaoable;
import com.javaweb.model.Post;

public class PostDaoImpl implements IPostDaoable{

	@Override
	public int addPost(Post post) {
		Connection conn1 = null;
		PreparedStatement statement = null;
		String sql = "INSERT INTO post (smallid,cid,p_content,puserid,ptime,pname) VALUES (?,?,?,?,?,?);";
		try {
			conn1 = BaseDao.getConnection();
			statement = conn1.prepareStatement(sql);
			statement.setInt(1, post.getSmallid());
			statement.setInt(2, post.getCid());
			statement.setString(3, post.getP_content());
			statement.setInt(4, post.getPuserid());
			statement.setString(5, post.getPtime());
			statement.setString(6, post.getPname());
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
	public int updatePost(Post post) {
		Connection conn = null;
		PreparedStatement statement = null;
		String sql = "update post set smallid=?,cid=?,p_content=?,puserid=?,ptime=?,pname=? where pid=?";
		try {
			conn = BaseDao.getConnection();
			statement = conn.prepareStatement(sql);
			statement.setInt(1, post.getSmallid());
			statement.setInt(2, post.getCid());
			statement.setString(3, post.getP_content());
			statement.setInt(4, post.getPuserid());
			statement.setString(5, post.getPtime());
			statement.setString(6, post.getPname());
			statement.setInt(7, post.getPid());
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
	public int deletePost(int pid) {
		Connection conn = null;
		PreparedStatement statement = null;
		String sql = "delete from post where pid=?";
		try {
			conn = BaseDao.getConnection();
			statement = conn.prepareStatement(sql);
			statement.setInt(1, pid);
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
	public Post selectOnePost(String where) {
		Connection conn = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		Post post = new Post();
		String sql = "select * from post where 1=1" + where;
		try {
			conn = BaseDao.getConnection();
			statement = conn.prepareStatement(sql);
			resultSet = statement.executeQuery();
			if (resultSet.next()) {
				post.setPid(resultSet.getInt("pid"));				
				post.setSmallid(resultSet.getInt("smallid"));
				post.setCid(resultSet.getInt("cid"));
				post.setP_content(resultSet.getString("p_content"));
				post.setPuserid(resultSet.getInt("puserid"));
				post.setPtime(resultSet.getString("ptime"));
				post.setPname(resultSet.getString("pname"));
			}
			return post;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			BaseDao.close(resultSet, statement, conn);
		}
	}

	@Override
	public ArrayList<Post> selectPosts(String where) {
		Connection conn = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		ArrayList<Post> postlist = new ArrayList<Post>();
		String sql = "select * from post where 1=1" + where;
		try {
			conn = BaseDao.getConnection();
			statement = conn.prepareStatement(sql);
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
				postlist.add(post);
			}
			return postlist;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			BaseDao.close(resultSet, statement, conn);
		}
	}

	@Override
	public int getCount(int smallid) {
		int i=0;
		Connection conn = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		String sql = "select count(*) from post where smallid='"+smallid+"'";
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
	public Post getLastpost(int smallid) {
		Connection conn = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		Post post=new Post();
		String sql = "select pid,pname from post INNER JOIN reply on post.pid=reply.postid where smallid='"+smallid+"' ORDER BY rtime desc LIMIT 1";
		try {
			conn = BaseDao.getConnection();
			statement = conn.prepareStatement(sql);
			resultSet = statement.executeQuery();
			if (resultSet.next()) {	
				post.setPid(resultSet.getInt("pid"));	
				post.setPname(resultSet.getString("pname"));	
			}
			return post;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			BaseDao.close(resultSet, statement, conn);
		}
	}

}
