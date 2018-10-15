package com.javaweb.dao;
import java.util.ArrayList;
import com.javaweb.model.Userdate;

public interface IUserdateDaoable {
	/**
	 * �����û�
	 * 
	 * @param userdate Userdateģ��
	 * @return 1-�ɹ� 0-ʧ�� -1-�쳣
	 */
	public int addUserdate(Userdate userdate);

	/**
	 * �����û�
	 * 
	 * @param userdate Userdateģ��
	 * @return 1-�ɹ� 0-ʧ�� -1-�쳣
	 */
	public int updateUserdate(Userdate userdate);

	/**
	 * ����idɾ���û�
	 * 
	 * @param id �û�id
	 * @return 1-�ɹ� 0-ʧ�� -1-�쳣
	 */
	public int deleteUserdate(int user_id);

	/**
	 * ���������鿴�û���Ϣ
	 * 
	 * @param where
	 * @return
	 */
	public Userdate selectOneUserdate(String where);

	/**
	 * ���������鿴�û�����Ϣ����
	 * 
	 * @param where
	 * @return
	 */
	public ArrayList<Userdate> selectUserdates(String where);
	
	public Userdate getLastReplyUser(int pid);
}
