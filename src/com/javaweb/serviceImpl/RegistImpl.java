package com.javaweb.serviceImpl;

import com.javaweb.dao.IUserdateDaoable;
import com.javaweb.daoImpl.UserdateDaoImpl;
import com.javaweb.model.Userdate;
import com.javaweb.service.Registable;

public class RegistImpl implements Registable{
    IUserdateDaoable ud=new UserdateDaoImpl();
    		
	@Override
	public int regist(Userdate userdate) {
		ud.addUserdate(userdate);
		return 1;		
	}

}
