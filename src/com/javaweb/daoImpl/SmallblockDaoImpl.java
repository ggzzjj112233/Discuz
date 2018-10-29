package com.javaweb.daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.javaweb.dao.ISmallblockDaoable;
import com.javaweb.model.Smallblock;

public class SmallblockDaoImpl implements ISmallblockDaoable {

	@Override
	public ArrayList<Smallblock> selectSmallblocks(String where) {
		Connection conn = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		ArrayList<Smallblock> smallblocklist = new ArrayList<Smallblock>();
		String sql = "select * from smallblock where 1=1" + where;
		try {
			conn = BaseDao.getConnection();
			statement = conn.prepareStatement(sql);
			resultSet = statement.executeQuery();
			while (resultSet.next()) {
				Smallblock smallblock = new Smallblock();
				smallblock.setSb_id(resultSet.getInt("sb_id"));
				smallblock.setBigid(resultSet.getInt("bigid"));
				smallblock.setSb_name(resultSet.getString("sb_name"));
				smallblock.setCount(resultSet.getInt("count"));
				smallblock.setLastpostname(resultSet.getString("lastpostname"));
				smallblock.setPtime(resultSet.getString("ptime"));
				smallblock.setPusername(resultSet.getString("pusername"));
				smallblock.setPostcount(resultSet.getInt("postcount"));
				smallblock.setAllcount(resultSet.getInt("allcount"));
				smallblocklist.add(smallblock);
			}
			return smallblocklist;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			BaseDao.close(resultSet, statement, conn);
		}
	}

}
