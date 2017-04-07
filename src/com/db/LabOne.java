package com.db;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * @author Isaev Maxim
 *         date: 4/7/2017
 */
public class LabOne {

	public static final String TASK_1_SQL = "CREATE OR REPLACE VIEW S1 AS SELECT COUNT(z_number) AS C1 FROM students GROUP BY numgroup;";
	public static final String TASK_FORMAT_1 = "%-10s %n";
	public static final String TASK_1_HEADER = "C1";
	public static final String TASK_1_SELECT_SQL = "SELECT * FROM S1;";

	public static final String TASK_2_SQL = "CREATE OR REPLACE VIEW S2 AS SELECT MAX(C1) AS MAX, MIN(C1) AS MIN, AVG(C1) AS AVG FROM S1;";
	public static final String TASK_2_SELECT_SQL = "SELECT * FROM S2;";
	public static final String TASK_2_FORMAT = "%-5s %-5s %-5s %n";
	public static final Object[] TASK_2_HEADER = {"MAX", "MIN", "AVG"};

	public static final String TASK_3_SQL = "CREATE OR REPLACE VIEW S3 AS SELECT MAX(C1) FROM S1;";
	public static final String TASK_3_SELECT_SQL = "SELECT * FROM S3;";
	public static final String TASK_3_FORMAT = "%-5s %n";
	public static final Object[] TASK_3_HEADER = {"MAX(C1)"};

	public static final String TASK_4_SQL = "CREATE OR REPLACE  VIEW S4 AS SELECT numgroup FROM students GROUP BY numgroup HAVING COUNT(z_number) = (SELECT * FROM S3);";
	public static final String TASK_4_SELECT_SQL = "SELECT * FROM S4;";
	public static final String TASK_4_FORMAT = "%-5s %n";
	public static final Object[] TASK_4_HEADER = {"numgroup"};

	public static final String TASK_5_SQL = "CREATE OR REPLACE  VIEW S5 AS SELECT * FROM students WHERE z_number < 120052 WITH LOCAL CHECK OPTION;";
	public static final String TASK_5_SELECT_SQL = "SELECT * FROM S5;";
	public static final String TASK_5_FORMAT = "%-15s %-15s %-15s %-15s %-7s %-7s %n";
	public static final Object[] TASK_5_HEADER = {"z_number", "surname", "firstname", "secondname", "numgroup", "phone"};
/*
INSERT INTO S5 VALUES (120035, "Представление", "Игорь", "Махмудович", 11, 51455);
INSERT INTO S5 VALUES (120057, "Нарушитель", "Анотолий", "Гиенович", 11, 51456);
DELETE FROM S5 WHERE z_number = 120035;
* */

	public static void task1(Connection connection) throws SQLException {
		Statement statement = connection.createStatement();
		statement.execute(TASK_1_SQL);
		ResultSet resultSet = statement.executeQuery(TASK_1_SELECT_SQL);
		System.out.printf(TASK_FORMAT_1, TASK_1_HEADER);
		while (resultSet.next()) {
			System.out.printf(TASK_FORMAT_1, resultSet.getString("C1"));
		}
	}

	public static void task2(Connection connection) throws SQLException {
		Statement statement = connection.createStatement();
		statement.execute(TASK_2_SQL);
		ResultSet resultSet = statement.executeQuery(TASK_2_SELECT_SQL);
		System.out.printf(TASK_2_FORMAT, TASK_2_HEADER);
		while (resultSet.next()) {
			System.out.printf(TASK_2_FORMAT, resultSet.getString("MAX"), resultSet.getString("MIN"), resultSet.getString("AVG"));
		}
	}

	public static void task3(Connection connection) throws SQLException {
		Statement statement = connection.createStatement();
		statement.execute(TASK_3_SQL);
		ResultSet resultSet = statement.executeQuery(TASK_3_SELECT_SQL);
		System.out.printf(TASK_3_FORMAT, TASK_3_HEADER);
		while (resultSet.next()) {
			System.out.printf(TASK_3_FORMAT, resultSet.getString("MAX(C1)"));
		}
	}

	public static void task4(Connection connection) throws SQLException {
		Statement statement = connection.createStatement();
		statement.execute(TASK_4_SQL);
		ResultSet resultSet = statement.executeQuery(TASK_4_SELECT_SQL);
		System.out.printf(TASK_4_FORMAT, TASK_4_HEADER);
		while (resultSet.next()) {
			System.out.printf(TASK_4_FORMAT, resultSet.getString("numgroup"));
		}
	}

	public static void task5(Connection connection) throws SQLException {
		Statement statement = connection.createStatement();
		statement.execute(TASK_5_SQL);
		ResultSet resultSet = statement.executeQuery(TASK_5_SELECT_SQL);
		System.out.printf(TASK_5_FORMAT, TASK_5_HEADER);
		while (resultSet.next()) {
			System.out.printf(TASK_5_FORMAT,
					resultSet.getString("z_number"),
					resultSet.getString("surname"),
					resultSet.getString("firstname"),
					resultSet.getString("secondname"),
					resultSet.getString("numgroup"),
					resultSet.getString("phone"));
		}
	}
}
