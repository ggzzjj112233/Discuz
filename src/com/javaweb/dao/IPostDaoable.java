package com.javaweb.dao;

import com.javaweb.model.Post;

public interface IPostDaoable {
	public int addPost(Post post);

	public int getAll(int smallid);

	public String getPname(int smallid);
	
	public String getPnamebyptime(int smallid);
	
	public String getPtimebyptime(int smallid);
	
	public String getPusernamebyptime(int smallid);

	public String getLastrtime(int smallid);

	public String getRusername(int smallid);

	public int getTodayCount();

	public int getYesterdayCount();

	public int getcount();

}
