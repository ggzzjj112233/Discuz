package com.javaweb.dao;
import java.util.ArrayList;
import com.javaweb.model.Userdate;

public interface IUserdateDaoable {
	/**
	 * 增加用户
	 * 
	 * @param userdate Userdate模型
	 * @return 1-成功 0-失败 -1-异常
	 */
	public int addUserdate(Userdate userdate);

	/**
	 * 更新用户
	 * 
	 * @param userdate Userdate模型
	 * @return 1-成功 0-失败 -1-异常
	 */
	public int updateUserdate(Userdate userdate);

	/**
	 * 根据id删除用户
	 * 
	 * @param id 用户id
	 * @return 1-成功 0-失败 -1-异常
	 */
	public int deleteUserdate(int user_id);

	/**
	 * 根据条件查看用户信息
	 * 
	 * @param where
	 * @return
	 */
	public Userdate selectOneUserdate(String where);

	/**
	 * 根据条件查看用户的信息集合
	 * 
	 * @param where
	 * @return
	 */
	public ArrayList<Userdate> selectUserdates(String where);
	
	public Userdate getLastReplyUser(int pid);
}
