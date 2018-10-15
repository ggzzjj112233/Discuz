package com.javaweb.dao;

import java.util.ArrayList;

import com.javaweb.model.Reply;

public interface IReplyDaoable {
	public int addReply(Reply reply);

	public int updateReply(Reply reply);

	public int deleteReply(int reply);

	public Reply selectOneReply(String where);

	public ArrayList<Reply> selectReplys(String where);
	
	public int getRcount(int sb_id);
	
	public Reply getLastReplyTime(int pid);
}
