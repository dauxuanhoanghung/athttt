package com.athttt.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.athttt.constant.DatabaseConstant;

public class ConnectionUtils {
	  private static Connection connection = null;

	    public static Connection getConnection() {
	        try {
	            if (connection == null || connection.isClosed()) {
	                connection = DriverManager.getConnection(DatabaseConstant.DB_URL, DatabaseConstant.USER, DatabaseConstant.PASS);
	            }
	            return connection;
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }

	        return null;
	    }

	    @SuppressWarnings("unused")
	    public static  void close(Connection conn, Statement stmt, ResultSet rs) {
	        try {
	            if (conn != null)
	                conn.close();
	            if (stmt != null)
	                stmt.close();
	            if (rs != null)
	                rs.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
}
