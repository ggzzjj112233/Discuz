package com.javaweb.service;

import com.javaweb.model.Userdate;

public interface Userdateable {
	public void regist(Userdate userdate);
	public Userdate login(String username,String password);
	public String getUsername(int userid);
	public String getPostUserName(int postid);
}
