package com.javaweb.service;

public interface Replyable {
	public String getLastRname(int postid);
	public String getSecond(int postid);
	public String getReplyName(int postid);
	public String getReplyTime(int postid);
	public String getRName(int userid);
	public String getRTime(int userid);
	public int getCount(int postid);
}
