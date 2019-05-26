package model;

import java.sql.Connection;

public class Client {
	
	public static void AddClient(Connection connection, String ivId,String ivContrasenha,String ivNombre ,String ivCedula ,String ivDireccion,String  ivFecha, String ivTelefono) throws Exception {
		String Statament = "BEGIN "; 
		Statament += "pkRegistro.pRegistrarCliente(";
		Statament += "'"+ivId + "','" + ivContrasenha + "','" + ivNombre + "','" +ivCedula + "','" + ivDireccion + "','" +  ivFecha + "','" +  ivTelefono+"');";
		Statament += " END;";
		ConnectionDB.send(connection, Statament);
		System.out.println("Se agrego un registro");
	}
}
