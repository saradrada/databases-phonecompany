package model;

import java.sql.Connection;

public class Funcionario {

	/**
	 * Agrega un Funcionario en la base de datos
	 * 
	 * @param connection SQL.connection object
	 * @throws Exception Error enviado desde la base de datos
	 */
	public static void AddFuncionario(Connection connection, String ivId, String ivContrasenha, String ivNombre,
			String ivCedula, String ivDireccion, String ivFecha, String ivTelefono) throws Exception {

		String Statament = "pkRegistro.pRegistrarFuncionario('" + ivId + "','" + ivContrasenha + "','" + ivNombre
				+ "','" + ivCedula + "','" + ivDireccion + "','" + ivFecha + "','" + ivTelefono + "');";

		ConnectionDB.send(connection, Statament);
	}

	/**
	 * Elimina el Funcionario con la cedula ingresada por parametro
	 * 
	 * @param connection SQL.connection object
	 * @throws Exception Error enviado desde la base de datos
	 */
	public static void deletedFuncionario(Connection connection, String ivCedula) throws Exception {
		String Statament = "pkEliminar.pEliminarFuncionario('" + ivCedula + "');";
		ConnectionDB.send(connection, Statament);
	}

	/**
	 * Modifica los campos del Funcionario con la cedula ingresada por parametro
	 * 
	 * @param connection SQL.connection object
	 * @throws Exception Error enviado desde la base de datos
	 */
	public static void editFuncionario(Connection connection, String ivId, String ivContrasenha, String ivNombre,
			String ivCedula, String ivDireccion, String ivFecha, String ivTelefono) throws Exception {
		String Statament = "pkModificar.pModificarFuncionario('" + ivId + "','" + ivContrasenha + "','" + ivNombre
				+ "','" + ivCedula + "','" + ivDireccion + "','" + ivFecha + "','" + ivTelefono + "');";
		ConnectionDB.send(connection, Statament);
	}

	/**
	 * Consulta los datos de un Funcionario
	 * 
	 * @param connection SQL.connection object
	 * @return String con toda la informacion del usuario
	 * @throws Exception Error enviado desde la base de datos
	 */
	public static String consultFuncionario(Connection connection, String ivCedula) throws Exception {
		String Statament = "pkConsulta.fConsultarFuncionario('" + ivCedula + "')";
		return ConnectionDB.recive(connection, Statament);
	}
}
