package com.javaweb.model;

public class Smallblock {
	private int sb_id;
	private int bigid;
	private String sb_name;
	private int count;
	private String lastpostname;
	private String ptime;
	private String pusername;
	private int postcount;
	private int allcount;

	public String getLastpostname() {
		return lastpostname;
	}

	public void setLastpostname(String lastpostname) {
		this.lastpostname = lastpostname;
	}

	public String getPtime() {
		return ptime;
	}

	public void setPtime(String ptime) {
		this.ptime = ptime;
	}

	public String getPusername() {
		return pusername;
	}

	public void setPusername(String pusername) {
		this.pusername = pusername;
	}

	public int getPostcount() {
		return postcount;
	}

	public void setPostcount(int postcount) {
		this.postcount = postcount;
	}

	public int getAllcount() {
		return allcount;
	}

	public void setAllcount(int allcount) {
		this.allcount = allcount;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
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
