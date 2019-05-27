package model;

import java.sql.Connection;

public class Funcionario {
	
	public static void AddFuncionario(Connection connection, String ivId, String ivContrasenha, String ivNombre,
			String ivCedula, String ivDireccion, String ivFecha, String ivTelefono) throws Exception {

		String Statament = "pkRegistro.pRegistrarFuncionario('" + ivId + "','" + ivContrasenha + "','" + ivNombre + "','"
				+ ivCedula + "','" + ivDireccion + "','" + ivFecha + "','" + ivTelefono + "');";

		ConnectionDB.send(connection, Statament);
	}

	public static void deletedFuncionario(Connection connection, String ivCedula) throws Exception {
		String Statament = "pkEliminar.pEliminarFuncionario('" + ivCedula + "');";
		ConnectionDB.send(connection, Statament);
	}

	public static void editFuncionario(Connection connection, String ivId, String ivContrasenha, String ivNombre,
			String ivCedula, String ivDireccion, String ivFecha, String ivTelefono) throws Exception {
		String Statament = "pkModificar.pModificarFuncionario('" + ivId + "','" + ivContrasenha + "','" + ivNombre + "','"
				+ ivCedula + "','" + ivDireccion + "','" + ivFecha + "','" + ivTelefono + "');";
		ConnectionDB.send(connection, Statament);
	}

	public static String consultFuncionario(Connection connection, String ivCedula) throws Exception {
		String Statament = "pkConsulta.fConsultarFuncionario('" + ivCedula + "')";
		return ConnectionDB.recive(connection, Statament);
	}
}
