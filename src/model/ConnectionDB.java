package model;

import java.sql.*;

public class ConnectionDB {
	
	public static void send(Connection con,String Statament) throws Exception {
		PreparedStatement stmt = con.prepareStatement(Statament);
		stmt.execute();
	}
	
	public static Connection createConnection(String username, String password) throws Exception{
		Connection c  = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			c = DriverManager.getConnection("jdbc:Oracle:thin:@//200.3.193.24:1522/ESTUD", username, password);
		} catch (Exception e) {
//			throw new Exception("Oracle JDBC Driver no encontrado");
			e.printStackTrace();
		}
		
		System.out.println("Successful connection");
		return c;
	}
}
