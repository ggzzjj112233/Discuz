package com.javaweb.daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.javaweb.dao.IBigblockDaoable;
import com.javaweb.model.Bigblock;

public class BigblockDaoImpl implements IBigblockDaoable {
	@Override
	public ArrayList<Bigblock> selectBigblocks(String where) {
		Connection conn = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		ArrayList<Bigblock> bigblocklist = new ArrayList<Bigblock>();
		String sql = "select * from bigblock where 1=1" + where;
		try {
			conn = BaseDao.getConnection();
			statement = conn.prepareStatement(sql);
			resultSet = statement.executeQuery();
			while (resultSet.next()) {
				Bigblock bigblock = new Bigblock();
				bigblock.setBb_id(resultSet.getInt("bb_id"));
				bigblock.setBb_name(resultSet.getString("bb_name"));
				bigblocklist.add(bigblock);
			}
			return bigblocklist;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			BaseDao.close(resultSet, statement, conn);
		}
	}

}
