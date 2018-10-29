package com.javaweb.dao;

import java.util.ArrayList;
import com.javaweb.model.Userdate;

public interface IUserdateDaoable {

	public int addUserdate(Userdate userdate);

	public int updateUserdate(Userdate userdate);

	public int deleteUserdate(int user_id);

	public Userdate selectOneUserdate(String where);

	public ArrayList<Userdate> selectUserdates(String where);

	public String getUsername();

	public int getUserid();
}
