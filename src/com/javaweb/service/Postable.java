package com.javaweb.service;

import java.util.*;

import com.javaweb.model.Post;

public interface Postable {
	public ArrayList<Post> selectposts(int smallid,int page);
	public String getSecond(int postid);
	public int getCount(int smallid);
	public String getPname(int postid);
	public String getPtime(int postid);
	public String getPcontent(int postid);
	public String getPusername(int postid);
	
}
