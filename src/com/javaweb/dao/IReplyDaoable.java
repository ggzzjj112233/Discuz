package com.javaweb.dao;

import java.util.ArrayList;

import com.javaweb.model.Reply;

public interface IReplyDaoable {
	public int addReply(Reply reply);
	
	public ArrayList<Reply> selectReplys(int postid);
	
	public int getRcount(int sb_id);
	
	public int getRallcount();
}
