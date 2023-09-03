package com.rs.fer.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {

	public static Connection getConnection() {
		Connection connection = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");

			// 2.get the connection

			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/spring_mvc_mar23?usessl=false", "root",
					"root");
		} catch (ClassNotFoundException cnfe) {
			cnfe.printStackTrace();
		} catch (SQLException se) {
			se.printStackTrace();
		}
		return connection;
	}
	
	public static void closeConnection(Connection connection) {
		try {
			// 5.close the connection object
			connection.close();
		} catch (SQLException se) {
			se.printStackTrace();
		}
	}

}

