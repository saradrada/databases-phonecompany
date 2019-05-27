package model;

import java.sql.*;

public class ConnectionDB {

	/**
	 * Ejecuta un procedimiento en la base de datos
	 * 
	 * @param con       SQL connection
	 * @param Statament Sentencia que se desea ejcutar
	 * @throws Exception Mensaje de error de la base de datos
	 */
	public static void send(Connection con, String Statament) throws Exception {
		try {
			String text = "BEGIN ";
			text += Statament;
			text += " END;";
			PreparedStatement stmt = con.prepareStatement(text);
			stmt.execute();

		} catch (Exception e) {
			throw new Exception(e.getMessage().split("\n")[0].split(":")[1]);
		}
	}

	/**
	 * Ejecuta una funcion en la base de datos
	 * 
	 * @param con       SQL connection
	 * @param Statament Sentencia que se desea ejcutar
	 * @return String con la respuesta de la consulta
	 * @throws Exception Mensaje de error de la base de datos
	 */
	public static String recive(Connection con, String Statament) throws Exception {
		try {
			String text = "SELECT ";
			text += Statament;
			text += " FROM dual";

			PreparedStatement stmt = con.prepareStatement(text);
			ResultSet rs = stmt.executeQuery(text);
			rs.next();
			return rs.getString(1);

		} catch (Exception e) {
			throw new Exception(e.getMessage());

		}
	}

	/**
	 * Establece la conexion con la base de datos
	 * 
	 * @param username usuario de la base de datos
	 * @param password contraseña de la base de datos
	 * @return SQL.Connection object
	 * @throws Exception No es posible conectarse con la base de datos
	 */
	public static Connection createConnection(String username, String password) throws Exception {
		Connection c = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			c = DriverManager.getConnection("jdbc:Oracle:thin:@//200.3.193.24:1522/ESTUD", username, password);
		} catch (Exception e) {
			e.printStackTrace();
		}

		System.out.println("Successful connection");
		return c;
	}
}
