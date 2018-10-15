package com.javaweb.daoImpl;

import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.Properties;

public class BaseDao {
	public final static String DRIVER;
	public final static String DB_URL;
	public final static String DB_USER;
	public final static String DB_PWD;

	static {
		Properties props = new Properties();
		InputStream is = BaseDao.class.getClassLoader().getResourceAsStream("jdbc.properties");
		try {
			props.load(is);
		} catch (IOException e) {
			e.printStackTrace();
		}
		DRIVER = props.getProperty("DRIVER");
		DB_URL = props.getProperty("DB_URL");
		DB_USER = props.getProperty("DB_USER");
		DB_PWD = props.getProperty("DB_PWD");
	}

	/**
	 * 
	 * @return
	 */
	public static Connection getConnection() {
		Connection conn = null;
		try {
			Class.forName(BaseDao.DRIVER);
			conn = DriverManager.getConnection(BaseDao.DB_URL, BaseDao.DB_USER, BaseDao.DB_PWD);
			return conn;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return null;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * 
	 * @param statement
	 * @param conn
	 */
	public static void close(Statement statement, Connection conn) {
		if (statement != null) {
			try {
				statement.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			statement = null;
		}

		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			conn = null;
		}
	}

	/**
	 * 
	 * @param resultSet
	 * @param statement
	 * @param conn
	 */
	public static void close(ResultSet resultSet, Statement statement, Connection conn) {
		if (resultSet != null) {
			try {
				resultSet.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			resultSet = null;
		}

		if (statement != null) {
			try {
				statement.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			statement = null;
		}

		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			conn = null;
		}
	}

}
