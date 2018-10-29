package com.javaweb.serviceImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.javaweb.dao.IPostDaoable;
import com.javaweb.dao.IReplyDaoable;
import com.javaweb.dao.ISmallblockDaoable;
import com.javaweb.daoImpl.BaseDao;
import com.javaweb.daoImpl.PostDaoImpl;
import com.javaweb.daoImpl.ReplyDaoImpl;
import com.javaweb.daoImpl.SmallblockDaoImpl;
import com.javaweb.model.Smallblock;
import com.javaweb.service.Smallblockable;

public class SmallblockImpl implements Smallblockable{

	@Override
	public String getSbname(int postid) {
		String sbname = "";
		Connection conn = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		String sql = "SELECT sb_name FROM smallblock WHERE sb_id IN (SELECT smallid FROM post WHERE pid = '"+ postid +"')";
		try {
			conn = BaseDao.getConnection();
			statement = conn.prepareStatement(sql);
			resultSet = statement.executeQuery();
			if (resultSet.next()) {
				sbname = resultSet.getString("sb_name");
			}
			return sbname;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			BaseDao.close(resultSet, statement, conn);
		}
	}

	@Override
	public List<Smallblock> getAll() {
		String where="";
		ISmallblockDaoable sbd=new SmallblockDaoImpl();
		List<Smallblock> smallblocks=sbd.selectSmallblocks(where);
		Smallblock smallblock=new Smallblock();
		IPostDaoable psd=new PostDaoImpl();
		IReplyDaoable rpd=new ReplyDaoImpl();
		for(int i=0;i<smallblocks.size();i++) {
			int sid=smallblocks.get(i).getSb_id();
			int bigid=smallblocks.get(i).getBigid();
			String sbname=smallblocks.get(i).getSb_name();
			String lastpostname=psd.getPnamebyptime(smallblocks.get(i).getSb_id());
			String ptime=psd.getPtimebyptime(smallblocks.get(i).getSb_id());
			String pusername=psd.getPusernamebyptime(smallblocks.get(i).getSb_id());
			int postcount=psd.getAll(smallblocks.get(i).getSb_id());
			int allcount=rpd.getRcount(smallblocks.get(i).getSb_id());
			smallblock.setSb_id(sid);
			smallblock.setBigid(bigid);
			smallblock.setSb_name(sbname);
			smallblock.setLastpostname(lastpostname);
			smallblock.setPtime(ptime);
			smallblock.setPusername(pusername);
			smallblock.setPostcount(postcount);
			smallblock.setAllcount(allcount);
		}	
		return smallblocks;
	}

}
