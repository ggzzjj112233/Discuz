package com.javaweb.model;

public class Reply {
	private int rid;
	private int postid;
	private String r_content;
	private int ruserid;
	private String rtime;
	public int getRid() {
		return rid;
	}
	public void setRid(int rid) {
		this.rid = rid;
	}
	public int getPostid() {
		return postid;
	}
	public void setPostid(int postid) {
		this.postid = postid;
	}
	public String getR_content() {
		return r_content;
	}
	public void setR_content(String r_content) {
		this.r_content = r_content;
	}
	public int getRuserid() {
		return ruserid;
	}
	public void setRuserid(int ruserid) {
		this.ruserid = ruserid;
	}
	public String getRtime() {
		return rtime;
	}
	public void setRtime(String rtime) {
		this.rtime = rtime;
	}
	
}
