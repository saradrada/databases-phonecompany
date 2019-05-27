package model;

import java.sql.Connection;

public class PhoneCompany {

	private  String user;
	private  String password;
	private  Connection connection;

	public void createConection(String viUser, String viPassword) throws Exception {
		connection = ConnectionDB.createConnection(viUser, viPassword);
		password = viPassword;
		user = viUser;
	}

	// *******************************************************************************************************
	// ********************************************* CLIENTE
	// *************************************************
	// *******************************************************************************************************

	public void AddClient(String ivId, String ivContrasenha, String ivNombre, String ivCedula, String ivDireccion,
			String ivFecha, String ivTelefono) throws Exception {
		Client.AddClient(this.connection, ivId, ivContrasenha, ivNombre, ivCedula, ivDireccion, ivFecha, ivTelefono);
	}

	public void DeletedClient(String ivCedula) throws Exception {
		Client.deletesClient(this.connection, ivCedula);
	}

	public void EditClient(String ivId, String ivContrasenha, String ivNombre, String ivCedula, String ivDireccion,
			String ivFecha, String ivTelefono) throws Exception {
		Client.editClient(this.connection, ivId, ivContrasenha, ivNombre, ivCedula, ivDireccion, ivFecha, ivTelefono);
	}

	public String consultClient(String ivCedula) throws Exception {
		return Client.consultClient(this.connection, ivCedula);
	}

	// *******************************************************************************************************
	// ******************************************* FUNCIONARIO
	// ***********************************************
	// *******************************************************************************************************

	public void AddFuncionario(String ivId, String ivContrasenha, String ivNombre, String ivCedula, String ivDireccion,
			String ivFecha, String ivTelefono) throws Exception {
		Funcionario.AddFuncionario(this.connection, ivId, ivContrasenha, ivNombre, ivCedula, ivDireccion, ivFecha,
				ivTelefono);
	}

	public void DeletedFuncionario(String ivCedula) throws Exception {
		Funcionario.deletedFuncionario(this.connection, ivCedula);
	}

	public void EditFuncionario(String ivId, String ivContrasenha, String ivNombre, String ivCedula, String ivDireccion,
			String ivFecha, String ivTelefono) throws Exception {
		Funcionario.editFuncionario(this.connection, ivId, ivContrasenha, ivNombre, ivCedula, ivDireccion, ivFecha,
				ivTelefono);
	}

	public String consultFuncionario(String ivCedula) throws Exception {
		return Funcionario.consultFuncionario(this.connection, ivCedula);
	}

	// *******************************************************************************************************
	// ********************************************* SOLICITUD
	// *******************************************************************************************************
	// *******************************************************************************************************

	public void deletedSolicitud(String ivNumeroSolicitud) throws Exception {
		Solicitud.deletedSolicitud(this.connection, ivNumeroSolicitud);
	}

	public void editSolicitud(String ivNumeroSolicitud, String ivObservacion, String ivEstado, String ivProductoCodigo,
			String ivCedulaCliente, String ivTipoCodigo) throws Exception {
		Solicitud.editSolicitud(this.connection, ivNumeroSolicitud, ivObservacion, ivEstado, ivProductoCodigo,
				ivCedulaCliente, ivTipoCodigo);
	}

	public void AddSolicitudCreacion(String ivObservacion, String ivProductoCodigo, String ivCedulaCliente)
			throws Exception {
		Solicitud.AddSolicitudCreacion(this.connection, ivObservacion, ivProductoCodigo, ivCedulaCliente);
	}

	public void AddSolicitudModificacion(String ivObservacion, String ivProductoCodigo, String ivCedulaCliente)
			throws Exception {
		Solicitud.AddModificacion(this.connection, ivObservacion, ivProductoCodigo, ivCedulaCliente);
	}

	public void AddSolicitudCancelacion(String ivObservacion, String ivProductoCodigo, String ivCedulaCliente)
			throws Exception {
		Solicitud.AddCancelacion(this.connection, ivObservacion, ivProductoCodigo, ivCedulaCliente);
	}

	public void AddSolicitudReclamo(String ivObservacion, String ivProductoCodigo, String ivCedulaCliente)
			throws Exception {
		Solicitud.AddReclamo(this.connection, ivObservacion, ivProductoCodigo, ivCedulaCliente);
	}

	public String ConsultarSolicitud_Cliente(String ivCedulaCliente) throws Exception {
		return Solicitud.ConsultarSolicitud_Cliente(this.connection, ivCedulaCliente);
	}

	public String ConsultarSolicitud_Funcionario(String ivCedulaFuncionario) throws Exception {
		return Solicitud.ConsultarSolicitud_Funcionario(this.connection, ivCedulaFuncionario);
	}

	public String ConsultarSolicitud_Estado(String ivEstado) throws Exception {
		return Solicitud.ConsultarSolicitud_Estado(this.connection, ivEstado);
	}

	public String ConsultarSolicitud_Tipo(String ivTipo) throws Exception {
		return Solicitud.ConsultarSolicitud_Tipo(this.connection, ivTipo);
	}

	// *******************************************************************************************************
	// **************************************** GETERS AND SETERS*********************************************
	// *******************************************************************************************************
	// *******************************************************************************************************

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Connection getConnection() {
		return connection;
	}

	public static void main(String[] args) {
		PhoneCompany pc = new PhoneCompany();

		try {
			pc.createConection("P09551_1_4", "P09551_1_4_20191");
			System.out.println(pc.consultClient("1638052477599"));
			String s = pc.consultClient("1638052477599");

		} catch (Exception e) {
			
			System.out.println(e.getMessage());
		}
	}

}
