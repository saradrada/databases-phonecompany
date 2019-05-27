package model;

import java.sql.Connection;

public class Solicitud {

	public static void deletedSolicitud(Connection connection, String ivNumeroSolicitud) throws Exception {
		String Statament = "pkEliminar.pEliminarSolicitud('" + ivNumeroSolicitud + "');";
		ConnectionDB.send(connection, Statament);
	}

	public static void editSolicitud(Connection connection,String ivNumeroSolicitud ,String ivObservacion  ,String ivEstado  ,String ivProductoCodigo ,String ivCedulaCliente ,String ivTipoCodigo ) throws Exception {
		String Statament = "pkModificar.pModificarSolicitud('" + ivNumeroSolicitud + "','" + ivObservacion + "','" + ivEstado + "','"
				+ ivProductoCodigo + "','" + ivCedulaCliente + "','" + ivTipoCodigo + "');";
		ConnectionDB.send(connection, Statament);
	}
	
	public static void AddSolicitudCreacion(Connection connection,String ivObservacion  ,String ivProductoCodigo ,String ivCedulaCliente ) throws Exception {
		String Statament = "pkRegistro.pRegistrarSolicitudCreacion('"  + ivProductoCodigo + "','" + ivCedulaCliente + "','"+ ivObservacion + "');";
		ConnectionDB.send(connection, Statament);
	}
	
	public static void AddModificacion(Connection connection,String ivObservacion  ,String ivProductoCodigo ,String ivCedulaCliente ) throws Exception {
		String Statament = "pkRegistro.pRegistrarSolicitudModificacion('"  + ivProductoCodigo + "','" + ivCedulaCliente + "','"+ ivObservacion + "');";
		ConnectionDB.send(connection, Statament);
	}
	
	public static void AddCancelacion(Connection connection,String ivObservacion  ,String ivProductoCodigo ,String ivCedulaCliente ) throws Exception {
		String Statament = "pkRegistro.pRegistrarSolicitudCancelacion('"  + ivProductoCodigo + "','" + ivCedulaCliente + "','"+ ivObservacion + "');";
		ConnectionDB.send(connection, Statament);
	}
	
	public static void AddReclamo(Connection connection,String ivObservacion  ,String ivProductoCodigo ,String ivCedulaCliente ) throws Exception {
		String Statament = "pkRegistro.pRegistrarSolicitudReclamo('"  + ivProductoCodigo + "','" + ivCedulaCliente + "','"+ ivObservacion + "');";
		ConnectionDB.send(connection, Statament);
	}
	
	public static String ConsultarSolicitud_Cliente(Connection connection,String ivCedulaCliente ) throws Exception {
		String Statament = "PKCONSULTA.fConsultarSolicitud_Cliente('"  + ivCedulaCliente+ "')";
		return ConnectionDB.recive(connection, Statament);
	}
	
	public static String ConsultarSolicitud_Funcionario(Connection connection,String ivCedulaFuncionario ) throws Exception {
		String Statament = "PKCONSULTA.fConsultarSolicitud_Funcionario('"  + ivCedulaFuncionario+ "')";
		return ConnectionDB.recive(connection, Statament);
	}
	
}
