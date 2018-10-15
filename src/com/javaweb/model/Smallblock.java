package com.javaweb.model;

public class Smallblock {
	private int sb_id;
	private int bigid;
	private String sb_name;
	private int count;
	private int rcount;
	private Post post;
	private Reply reply;
	private Userdate userdate;

	
	public int getRcount() {
		return rcount;
	}

	public void setRcount(int rcount) {
		this.rcount = rcount;
	}

	public Reply getReply() {
		return reply;
	}

	public void setReply(Reply reply) {
		this.reply = reply;
	}

	public Userdate getUserdate() {
		return userdate;
	}

	public void setUserdate(Userdate userdate) {
		this.userdate = userdate;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public Post getPost() {
		return post;
	}

	public void setPost(Post post) {
		this.post = post;
	}

	public int getSb_id() {
		return sb_id;
	}

	public void setSb_id(int sb_id) {
		this.sb_id = sb_id;
	}

	public int getBigid() {
		return bigid;
	}

	public void setBigid(int bigid) {
		this.bigid = bigid;
	}

	public String getSb_name() {
		return sb_name;
	}

	public void setSb_name(String sb_name) {
		this.sb_name = sb_name;
	}

}
