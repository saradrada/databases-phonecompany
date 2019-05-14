package ui;

import java.io.IOException;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.layout.GridPane;
import javafx.stage.Stage;

public class Controller {

	@FXML
	private GridPane gridBaseDatos;

	@FXML
	private GridPane gridMenu;

	@FXML
	private GridPane gridSolicitud;
	
	@FXML
	void agregarPersona(ActionEvent event) {
		Parent root;
		try {
			root = FXMLLoader.load(getClass().getResource("form-person.fxml"));
			Stage stage = new Stage();
			stage.setScene(new Scene(root));
			stage.show();

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@FXML
	void asignarSolicitud(ActionEvent event) {

	}

	@FXML
	void atenderSolicitud(ActionEvent event) {

	}

	@FXML
	void consultarBD(ActionEvent event) {

	}

	@FXML
	void consultarSolicitud(ActionEvent event) {

	}

	@FXML
	void eliminarBD(ActionEvent event) {

	}

	@FXML
	void gestionarBaseDatos(ActionEvent event) {
		setVisibleGrid(gridMenu, false);
		setVisibleGrid(gridBaseDatos, true);
	}

	@FXML
	void gestionarSolicitud(ActionEvent event) {
		setVisibleGrid(gridMenu, false);
		setVisibleGrid(gridSolicitud, true);
	}

	@FXML
	void insertarBD(ActionEvent event) {

	}

	@FXML
	void menu(ActionEvent event) {
		setVisibleGrid(gridBaseDatos, false);
		setVisibleGrid(gridSolicitud, false);
		setVisibleGrid(gridMenu, true);
	}

	@FXML
	void modificarBD(ActionEvent event) {

	}

	@FXML
	void registrarSolicitud(ActionEvent event) {

	}

	@FXML
	void initialize() {
		setVisibleGrid(gridBaseDatos, false);
		setVisibleGrid(gridSolicitud, false);
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

}
