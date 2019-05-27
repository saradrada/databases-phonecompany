package ui;

import java.io.IOException;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Label;
import javafx.scene.layout.GridPane;
import javafx.stage.Stage;

public class ControllerMenu {

	@FXML
	private GridPane gridBaseDatos;

	@FXML
	private GridPane gridMenu;

	@FXML
	private GridPane gridSolicitud;

	@FXML
	private GridPane gridUsuarios;

    @FXML
    private Label labTitulo;
	

    /**
     * Variable para designar si se está gestionando la eliminacion (0), consulta(1) o modificación(2) de un usuario
     */
	public static int ecm;

	/**
	 * Método que asigna una solicitud a un funcionario
	 * @param event
	 */
	@FXML
	void asignarSolicitud(ActionEvent event) {

	}

	/**
	 * Método que atiende una solicitud
	 * @param event
	 */
	@FXML
	void atenderSolicitud(ActionEvent event) {

	}
	
	
	/**
	 * Método que consulta los datos de la base de datos
	 * @param event
	 */
	@FXML
	void consultarBD(ActionEvent event) {

	}

	@FXML
	void consultarSolicitud(ActionEvent event) {

	}

	@FXML
	void consultarUsuario(ActionEvent event) {
		ecm = 1;
		openNewWindow("user-ecm.fxml");

	}

	@FXML
	void eliminarBD(ActionEvent event) {
	}

	@FXML
	void eliminarUsuario(ActionEvent event) {
		ecm = 0;
		openNewWindow("user-ecm.fxml");
	}

	@FXML
	void gestionarBaseDatos(ActionEvent event) {
		setVisibleGrid(gridMenu, false);
		setVisibleGrid(gridBaseDatos, true);
		labTitulo.setText("GESTIÓN DE BASE DATOS");
		labTitulo.setVisible(true);
	}

	@FXML
	void gestionarSolicitud(ActionEvent event) {
		setVisibleGrid(gridMenu, false);
		setVisibleGrid(gridSolicitud, true);
		labTitulo.setText("GESTIÓN DE SOLICITUDES");
		labTitulo.setVisible(true);
	}

	@FXML
	void gestionarUsuario(ActionEvent event) {
		ecm = -1;
		setVisibleGrid(gridMenu, false);
		setVisibleGrid(gridUsuarios, true);
		labTitulo.setVisible(true);
	}

	@FXML
	void insertarBD(ActionEvent event) {

	}

	@FXML
	void menu(ActionEvent event) {
		setVisibleGrid(gridUsuarios, false);
		setVisibleGrid(gridBaseDatos, false);
		setVisibleGrid(gridSolicitud, false);
		setVisibleGrid(gridMenu, true);
		labTitulo.setVisible(false);
	}

	@FXML
	void modificarBD(ActionEvent event) {

	}

	@FXML
	void modificarUsuario(ActionEvent event) {
		ecm = 2;
		openNewWindow("user-ecm.fxml");
	}

	@FXML
	void registrarSolicitud(ActionEvent event) {

	}

	@FXML
	void registrarUsuario(ActionEvent event) {
		openNewWindow("user-register.fxml");
	}

	@FXML
	void initialize() {
		setVisibleGrid(gridUsuarios, false);
		setVisibleGrid(gridBaseDatos, false);
		setVisibleGrid(gridSolicitud, false);
		labTitulo.setVisible(false);
	}

	private void setVisibleGrid(GridPane grid, boolean b) {
		for (int i = 0; i < grid.getChildren().size(); i++) {
			grid.getChildren().get(i).setVisible(b);
		}
		if (b) {
			grid.toFront();
		} else {
			grid.toBack();
		}
	}

	private void openNewWindow(String fxmlPath) {
		Parent root;
		try {
			root = FXMLLoader.load(getClass().getResource(fxmlPath));
			Stage stage = new Stage();
			stage.setScene(new Scene(root));
			stage.show();

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
