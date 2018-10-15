package com.javaweb.dao;

import java.util.ArrayList;

import com.javaweb.model.Post;

public interface IPostDaoable {
	public int addPost(Post post);

	public int updatePost(Post post);

	public int deletePost(int pid);

	public Post selectOnePost(String where);

	public ArrayList<Post> selectPosts(String where);
	
	public int getCount(int smallid);
	
	public Post getLastpost(int smallid);
}
