package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    
    // Change these according to your MySQL setup
    private static final String URL = "jdbc:mysql://localhost:3306/hostel_db"; 
    private static final String USER = "root";      
    private static final String PASSWORD = "jebastin";
    // Method to get database connection
    public static Connection getConnection() {
        Connection conn = null;
        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");
         // Establish connection
            conn = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("✅ Database connected!");
        } catch (ClassNotFoundException e) {
            System.out.println("❌ MySQL Driver not found!");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("❌ Cannot connect to database!");
            e.printStackTrace();
        }
        return conn;
    }
    
    // Optional: Test main method
    public static void main(String[] args) {
        getConnection();
        
    }
}




