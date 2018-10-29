package com.javaweb.model;

public class Post {
	private int pid;
	private int smallid;
	private int cid;
	private String p_content;
	private int puserid;
	private String ptime;
	private String pname;
	private int count;

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public int getSmallid() {
		return smallid;
	}

	public void setSmallid(int smallid) {
		this.smallid = smallid;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public String getP_content() {
		return p_content;
	}

	public void setP_content(String p_content) {
		this.p_content = p_content;
	}

	public int getPuserid() {
		return puserid;
	}

	public void setPuserid(int puserid) {
		this.puserid = puserid;
	}

	public String getPtime() {
		return ptime;
	}

	public void setPtime(String ptime) {
		this.ptime = ptime;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

}
