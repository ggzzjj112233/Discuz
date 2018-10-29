package com.javaweb.serviceImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.javaweb.daoImpl.BaseDao;
import com.javaweb.service.Bigblockable;

public class BigblockImpl implements Bigblockable {

	@Override
	public String getBigblockname(int postid) {
		String bigblockname = "";
		Connection conn = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		String sql = "SELECT bb_name FROM bigblock WHERE bb_id IN (SELECT bigid FROM smallblock WHERE sb_id IN (SELECT smallid FROM post WHERE pid = '"
				+ postid + "'))";
		try {
			conn = BaseDao.getConnection();
			statement = conn.prepareStatement(sql);
			resultSet = statement.executeQuery();
			if (resultSet.next()) {
				bigblockname = resultSet.getString("bb_name");
			}
			return bigblockname;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			BaseDao.close(resultSet, statement, conn);
		}
	}
}
