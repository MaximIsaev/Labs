package com.db;


import java.sql.Connection;
import java.sql.SQLException;

public class Main {


	public static void main(String[] args) throws SQLException {
		Connection connection = Connector.getConnection();
		System.out.println("task_1");
		LabOne.task1(connection);
		System.out.println();
		System.out.println("-------------------------------------------------");
		System.out.println("task_2");
		LabOne.task2(connection);
		System.out.println();
		System.out.println("-------------------------------------------------");
		System.out.println("task_3");
		LabOne.task3(connection);
		System.out.println();
		System.out.println("-------------------------------------------------");
		System.out.println("task_4");
		LabOne.task4(connection);
		System.out.println();
		System.out.println("-------------------------------------------------");
		System.out.println("task_5");
		LabOne.task5(connection);
		System.out.println();
		System.out.println("task_6");
		System.out.println("-------------------------------------------------");
		LabOne.task6(connection);
		System.out.println();
		System.out.println("task_7");
		System.out.println("-------------------------------------------------");
		LabOne.task7(connection);
		System.out.println();
		System.out.println("task_8");
		System.out.println("-------------------------------------------------");
		LabOne.task8(connection);
		System.out.println();
	}
}
