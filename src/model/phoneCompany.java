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
		Client.deletesCLient(this.connection,ivCedula);
	}
	

	public void EditClient(String ivId,String ivContrasenha,String ivNombre ,String ivCedula ,String ivDireccion,String  ivFecha, String ivTelefono) throws Exception {
			Client.editClient(this.connection, ivId, ivContrasenha, ivNombre, ivCedula, ivDireccion, ivFecha, ivTelefono);
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
			pc.EditClient("567890", "456789", "Klan", "4567890", "tierra", "26-05-2019", "456789");
			pc.AddClient("567890", "456789", "Klan", "4567890", "aqui", "26-05-2019", "456789");
//			pc.DeletedClient("4567890");

		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
}
