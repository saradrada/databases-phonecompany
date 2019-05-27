package model;

import java.security.Principal;
import java.sql.Connection;

public class phoneCompany {

	private String user;
	private String password;
	private Connection connection;
	
	private void creteConecction(String user, String password) throws Exception {
		this.connection = ConnectionDB.createConnection(user,password);
		this.password = password;
		this.user = user;
	}
	
	public void AddClient(String ivId,String ivContrasenha,String ivNombre ,String ivCedula ,String ivDireccion,String  ivFecha, String ivTelefono) throws Exception {
			Client.AddClient(this.connection, ivId, ivContrasenha, ivNombre, ivCedula, ivDireccion, ivFecha, ivTelefono);
	}
	
	public void DeletedClient(String ivCedula) throws Exception {
		Client.deletesClient(this.connection,ivCedula);
	}
	

	public void EditClient(String ivId,String ivContrasenha,String ivNombre ,String ivCedula ,String ivDireccion,String  ivFecha, String ivTelefono) throws Exception {
			Client.editClient(this.connection, ivId, ivContrasenha, ivNombre, ivCedula, ivDireccion, ivFecha, ivTelefono);
	}
	
	private String consultCLient(String ivCedula) throws Exception {
		return Client.consultClient(this.connection, ivCedula);
	}
	
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
		phoneCompany pc = new phoneCompany();
		
		try {
			pc.creteConecction("P09551_1_4", "P09551_1_4_20191");

			System.out.println(pc.consultCLient("1638052477599"));
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
}
