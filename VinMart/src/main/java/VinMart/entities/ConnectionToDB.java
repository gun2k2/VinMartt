package VinMart.entities;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ConnectionToDB {

	public ConnectionToDB() {
		
	}
	public static Connection getConnect() {
		Connection connection = null;
		
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			
			
			connection =  DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=VinMart; user=sa ; password=12345");
		
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
		
		return connection;
	}
	
	
	
	
	
	public void excuteSql(String sql) throws Exception{ // thực thi câu lệnh sql
		Connection connect = getConnect();
		 Statement stmt =   connect.createStatement();
		
	 stmt.executeUpdate(sql);
	}
	
	public ResultSet selectData(String sql) throws Exception{ // lấy dữ liệu từ database
		Connection connect = getConnect();
		Statement stmt =  connect.createStatement();
		ResultSet rs =   stmt.executeQuery(sql);
		return rs;
			
	}
	
	
}
