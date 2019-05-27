package model;

import java.sql.Connection;

public class Solicitud {

	/**
	 * Asigna la solicitud con el numero de solicitud del parametro
	 * 
	 * @param connection SQL.connection object
	 * @throws Exception Error enviado desde la base de datos
	 */
	public static void asignarSolicitud(Connection connection, String ivNumeroSolicitud) throws Exception {
		String Statament = "pkAsignacionNivel2.pAsignarSolicitud('" + ivNumeroSolicitud + "');";
		ConnectionDB.send(connection, Statament);
	}
	
	/**
	 * Atiende la solicitud con el numero de solicitud del parametro
	 * 
	 * @param connection SQL.connection object
	 * @throws Exception Error enviado desde la base de datos
	 */
	public static void atiendeSolicitud(Connection connection, String ivNumeroSolicitud) throws Exception {
		String Statament = "pkAtention.pAtencion('" + ivNumeroSolicitud + "');";
		ConnectionDB.send(connection, Statament);
	}
	
	/**
	 * Elimina la solicitud con el numero de solicitud del parametro
	 * 
	 * @param connection SQL.connection object
	 * @throws Exception Error enviado desde la base de datos
	 */
	public static void deletedSolicitud(Connection connection, String ivNumeroSolicitud) throws Exception {
		String Statament = "pkEliminar.pEliminarSolicitud('" + ivNumeroSolicitud + "');";
		ConnectionDB.send(connection, Statament);
	}

	/**
	 * Modifica los campos de una solicitud
	 * 
	 * @param connection SQL.connection object
	 * @throws Exception Error enviado desde la base de datos
	 */
	public static void editSolicitud(Connection connection, String ivNumeroSolicitud, String ivObservacion,
			String ivEstado, String ivProductoCodigo, String ivCedulaCliente, String ivTipoCodigo) throws Exception {
		String Statament = "pkModificar.pModificarSolicitud('" + ivNumeroSolicitud + "','" + ivObservacion + "','"
				+ ivEstado + "','" + ivProductoCodigo + "','" + ivCedulaCliente + "','" + ivTipoCodigo + "');";
		ConnectionDB.send(connection, Statament);
	}

	/**
	 * Agrega una solicitud de tipo Creacion
	 * 
	 * @param connection SQL.connection object
	 * @throws Exception Error enviado desde la base de datos
	 */
	public static void AddSolicitudCreacion(Connection connection, String ivObservacion, String ivProductoCodigo,
			String ivCedulaCliente) throws Exception {
		String Statament = "pkRegistro.pRegistrarSolicitudCreacion('" + ivProductoCodigo + "','" + ivCedulaCliente
				+ "','" + ivObservacion + "');";
		ConnectionDB.send(connection, Statament);
	}

	/**
	 * Agrega una solicitud de tipo Modificaion
	 * 
	 * @param connection SQL.connection object
	 * @throws Exception Error enviado desde la base de datos
	 */
	public static void AddModificacion(Connection connection, String ivObservacion, String ivProductoCodigo,
			String ivCedulaCliente) throws Exception {
		String Statament = "pkRegistro.pRegistrarSolicitudModificacion('" + ivProductoCodigo + "','" + ivCedulaCliente
				+ "','" + ivObservacion + "');";
		ConnectionDB.send(connection, Statament);
	}

	/**
	 * Agrega una solicitud de tipo Cancelacion
	 * 
	 * @param connection SQL.connection object
	 * @throws Exception Error enviado desde la base de datos
	 */
	public static void AddCancelacion(Connection connection, String ivObservacion, String ivProductoCodigo,
			String ivCedulaCliente) throws Exception {
		String Statament = "pkRegistro.pRegistrarSolicitudCancelacion('" + ivProductoCodigo + "','" + ivCedulaCliente
				+ "','" + ivObservacion + "');";
		ConnectionDB.send(connection, Statament);
	}

	/**
	 * Agrega una solicitud de tipo Reclamo
	 * 
	 * @param connection SQL.connection object
	 * @throws Exception Error enviado desde la base de datos
	 */
	public static void AddReclamo(Connection connection, String ivObservacion, String ivProductoCodigo,
			String ivCedulaCliente) throws Exception {
		String Statament = "pkRegistro.pRegistrarSolicitudReclamo('" + ivProductoCodigo + "','" + ivCedulaCliente
				+ "','" + ivObservacion + "');";
		ConnectionDB.send(connection, Statament);
	}

	/**
	 * Consulta todas las solicitudes de un cliente
	 * 
	 * @param connection SQL.connection object
	 * @return String con los resultados de la consulta
	 * @throws Exception Error enviado desde la base de datos
	 */
	public static String ConsultarSolicitud_Cliente(Connection connection, String ivCedulaCliente) throws Exception {
		String Statament = "PKCONSULTA.fConsultarSolicitud_Cliente('" + ivCedulaCliente + "')";
		return ConnectionDB.recive(connection, Statament);
	}

	/**
	 * Consulta todas las solicitudes de un Funcionario
	 * 
	 * @param connection SQL.connection object
	 * @return String con los resultados de la consulta
	 * @throws Exception Error enviado desde la base de datos
	 */
	public static String ConsultarSolicitud_Funcionario(Connection connection, String ivCedulaFuncionario)
			throws Exception {
		String Statament = "PKCONSULTA.fConsultarSolicitud_Funcionario('" + ivCedulaFuncionario + "')";
		return ConnectionDB.recive(connection, Statament);
	}

	/**
	 * Consulta todas las solicitudes con el estado ingresado por parametro
	 * 
	 * @param connection SQL.connection object
	 * @return String con los resultados de la consulta
	 * @throws Exception Error enviado desde la base de datos
	 */
	public static String ConsultarSolicitud_Estado(Connection connection, String ivEstado) throws Exception {
		String Statament = "PKCONSULTA.fConsultarSolicitud_Estado('" + ivEstado + "')";
		return ConnectionDB.recive(connection, Statament);
	}

	/**
	 * Consulta todas las solicitudes con el tipo indicado en el parametro
	 * 
	 * @param connection SQL.connection object
	 * @return String con los resultados de la consulta
	 * @throws Exception Error enviado desde la base de datos
	 */
	public static String ConsultarSolicitud_Tipo(Connection connection, String ivTipo) throws Exception {
		String Statament = "PKCONSULTA.fConsultarSolicitud_Tipo('" + ivTipo + "')";
		return ConnectionDB.recive(connection, Statament);
	}
}
