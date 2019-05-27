package ui;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;
import javafx.stage.Stage;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;

public class ControllerUserElimination {

	@FXML
	private TextField txtCedula;

	@FXML
	private Label labId1;

	@FXML
	private Label labNombre1;

	@FXML
	private Label labDireccion1;

	@FXML
	private Label labFecha1;

	@FXML
	private Label labTelefono1;

	@FXML
	private Label labTipo1;

	@FXML
	private Label labTipo;

	@FXML
	private Label labId;

	@FXML
	private Label labNombre;

	@FXML
	private Label labDireccion;

	@FXML
	private Label labFecha;

	@FXML
	private Label labTelefono;

	@FXML
	private Button btnEliminar;

	private boolean existeUsuario;

	@FXML
	void cancelar(ActionEvent event) {
		((Stage) (((Button) event.getSource()).getScene().getWindow())).close();
	}

	@FXML
	void consultarUsuario(ActionEvent event) {

		String cedula = txtCedula.getText();
		boolean flag = true;

		if (cedula == null || cedula.equals("")) {
			Alert alert = new Alert(AlertType.ERROR);
			alert.setTitle("Error");
			flag = false;
			alert.setHeaderText("Error en la cédula.");
			alert.setContentText("La cédula no puede estar vacía.");
			alert.showAndWait();
		}

		if (flag) {
			// Cambiar condición por el método que verifica si existe.
			boolean condicion = false;

			if (condicion) {
				existeUsuario = true;
			}

			if (existeUsuario) {
				setDisable(false);

				// Cambiar valores de los labels
				labTipo.setText("TIPO");
				labId.setText("ID");
				labNombre.setText("NOMBRE");
				labDireccion.setText("DIRECCIÓN");
				labFecha.setText("FECHA");
				labTelefono.setText("TELEFONO");

			}
		}

	}

	@FXML
	void eliminarUsuario(ActionEvent event) {

		boolean condicion = false;
		if (condicion) {
			// Cambiar condición por el método que verifica si eliminó al usuario.
			Alert alert = new Alert(AlertType.INFORMATION);
			alert.setTitle("Información");
			alert.setHeaderText("Proceso de eliminación.");
			alert.setContentText("El usuario con la cédula " + txtCedula.getText() + " ha sido eliminado.");
			alert.showAndWait();
			((Stage) (((Button) event.getSource()).getScene().getWindow())).close();
		} else {
			Alert alert = new Alert(AlertType.ERROR);
			alert.setTitle("Error");
			alert.setHeaderText("Proceso de eliminación.");
			alert.setContentText("El usuario con la cédula " + txtCedula.getText() + " no ha sido eliminado.");
			alert.showAndWait();
		}
	}

	@FXML
	void initialize() {
		setDisable(true);
	}

	private void setDisable(boolean isDisable) {
		btnEliminar.setDisable(isDisable);
		labId1.setDisable(isDisable);
		labNombre1.setDisable(isDisable);
		labDireccion1.setDisable(isDisable);
		labFecha1.setDisable(isDisable);
		labTelefono1.setDisable(isDisable);
		labTipo1.setDisable(isDisable);
		labTipo.setDisable(isDisable);
		labId.setDisable(isDisable);
		labNombre.setDisable(isDisable);
		labDireccion.setDisable(isDisable);
		labFecha.setDisable(isDisable);
		labTelefono.setDisable(isDisable);
	}

}
