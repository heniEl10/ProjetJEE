package dataLayer;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;
import java.io.FileInputStream;
import java.io.IOException;

public class ConnectionDB {
	private static Connection connection;
	private static final String CONFIG_FILE = "database.properties";
	private static final String DEFAULT_URL = "jdbc:mysql://localhost:3306/DB_Projet";
	private static final String DEFAULT_USER = "root";
	private static final String DEFAULT_PASSWORD = "";
	
	static {
		initializeConnection();
	}
	
	/**
	 * Initialize database connection
	 */
	private static void initializeConnection() {
		try {
			// Load MySQL driver
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			// Load configuration from properties file
			Properties props = loadDatabaseProperties();
			
			String url = props.getProperty("db.url", DEFAULT_URL);
			String user = props.getProperty("db.user", DEFAULT_USER);
			String password = props.getProperty("db.password", DEFAULT_PASSWORD);
			
			// Create connection
			connection = DriverManager.getConnection(url, user, password);
			
			// Test connection
			if (connection != null && !connection.isClosed()) {
				System.out.println("✅ Database connection established successfully");
			}
			
		} catch (ClassNotFoundException e) {
			System.err.println("❌ MySQL JDBC Driver not found: " + e.getMessage());
			e.printStackTrace();
		} catch (SQLException e) {
			System.err.println("❌ Database connection failed: " + e.getMessage());
			e.printStackTrace();
		} catch (Exception e) {
			System.err.println("❌ Unexpected error during connection: " + e.getMessage());
			e.printStackTrace();
		}
	}
	
	/**
	 * Load database configuration from properties file
	 */
	private static Properties loadDatabaseProperties() {
		Properties props = new Properties();
		
		try {
			// Try to load from classpath first
			FileInputStream fis = new FileInputStream(CONFIG_FILE);
			props.load(fis);
			fis.close();
			System.out.println("📁 Database configuration loaded from: " + CONFIG_FILE);
		} catch (IOException e) {
			System.out.println("ℹ️ Using default database configuration");
			// Set default properties
			props.setProperty("db.url", DEFAULT_URL);
			props.setProperty("db.user", DEFAULT_USER);
			props.setProperty("db.password", DEFAULT_PASSWORD);
		}
		
		return props;
	}
	
	/**
	 * Get database connection
	 */
	public static Connection getConnection() {
		try {
			// Check if connection is valid and not closed
			if (connection == null || connection.isClosed()) {
				System.out.println("🔄 Reconnecting to database...");
				initializeConnection();
			}
			
			// Test if connection is still valid
			if (connection != null && connection.isValid(5)) {
				return connection;
			} else {
				System.out.println("⚠️ Connection invalid, reconnecting...");
				initializeConnection();
				return connection;
			}
			
		} catch (SQLException e) {
			System.err.println("❌ Error checking connection: " + e.getMessage());
			// Try to reconnect
			initializeConnection();
			return connection;
		}
	}
	
	/**
	 * Close database connection
	 */
	public static void closeConnection() {
		try {
			if (connection != null && !connection.isClosed()) {
				connection.close();
				System.out.println("🔒 Database connection closed");
			}
		} catch (SQLException e) {
			System.err.println("❌ Error closing connection: " + e.getMessage());
		}
	}
	
	/**
	 * Test database connectivity
	 */
	public static boolean testConnection() {
		try {
			Connection conn = getConnection();
			return conn != null && !conn.isClosed() && conn.isValid(5);
		} catch (SQLException e) {
			System.err.println("❌ Connection test failed: " + e.getMessage());
			return false;
		}
	}
}
