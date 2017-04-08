package com.db;

import com.mysql.jdbc.jdbc2.optional.MysqlDataSource;

import java.sql.Connection;
import java.sql.SQLException;

/**
 * @author Isaev Maxim
 *         date: 4/7/2017
 */
public class Connector {
	public static Connection getConnection() throws SQLException {
		MysqlDataSource dataSource = new MysqlDataSource();
		dataSource.setDatabaseName("lab_5_2016");
		dataSource.setUser("empathic");
		dataSource.setPassword("open");
		return dataSource.getConnection();
	}
}
