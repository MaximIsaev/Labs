package com.db;


import java.sql.Connection;
import java.sql.SQLException;

public class Main {


	public static void main(String[] args) throws SQLException {
		Connection connection = Connector.getConnection();
		LabOne.task1(connection);
		System.out.println("-------------------------------------------------");
		LabOne.task2(connection);
		System.out.println("-------------------------------------------------");
		LabOne.task3(connection);
		System.out.println("-------------------------------------------------");
		LabOne.task4(connection);
		System.out.println("-------------------------------------------------");
		LabOne.task5(connection);
	}
}
