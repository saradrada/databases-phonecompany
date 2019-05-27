package model;

import java.sql.Connection;

public class Client {

	public static void AddClient(Connection connection, String ivId, String ivContrasenha, String ivNombre,
			String ivCedula, String ivDireccion, String ivFecha, String ivTelefono) throws Exception {

		String Statament = "pkRegistro.pRegistrarCliente('" + ivId + "','" + ivContrasenha + "','" + ivNombre + "','"
				+ ivCedula + "','" + ivDireccion + "','" + ivFecha + "','" + ivTelefono + "');";

		ConnectionDB.send(connection, Statament);
	}

	public static void deletesCLient(Connection connection, String ivCedula) throws Exception {
		String Statament = "pkEliminar.pEliminarCliente('" + ivCedula + "');";
		ConnectionDB.send(connection, Statament);
	}

	public static void editClient(Connection connection, String ivId, String ivContrasenha, String ivNombre,
			String ivCedula, String ivDireccion, String ivFecha, String ivTelefono) throws Exception {
		String Statament = "pkModificar.pModificarCliente('" + ivId + "','" + ivContrasenha + "','" + ivNombre + "','"
				+ ivCedula + "','" + ivDireccion + "','" + ivFecha + "','" + ivTelefono + "');";
		ConnectionDB.send(connection, Statament);
	}
}
