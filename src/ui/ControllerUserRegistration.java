package ui;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.ChoiceBox;
import javafx.scene.control.DatePicker;
import javafx.scene.control.TextField;
import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.control.Button;
import javafx.stage.Stage;

public class ControllerUserRegistration {

	@FXML
	private TextField txtId;

	@FXML
	private TextField txtNombre;

	@FXML
	private TextField txtContrasena;

	@FXML
	private TextField txtCedula;

	@FXML
	private TextField txtDireccion;

	@FXML
	private DatePicker dpFechaNacimiento;

	@FXML
	private TextField txtTelefono;

	@FXML
	private ChoiceBox<String> cbTipo;

	@FXML
	void initialize() {
		cbTipo.getItems().add("Cliente");
		cbTipo.getItems().add("Funcionario");
	}

	@FXML
	void agregar(ActionEvent event) {

		Alert alert = new Alert(AlertType.ERROR);
		alert.setTitle("Error");
		boolean flag = true;

		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-mm-yy");
		LocalDate date = dpFechaNacimiento.getValue();

		String tipo = cbTipo.getSelectionModel().getSelectedItem();
		if (txtId.getText() == null || txtId.getText().equals("")) {
			flag = false;
			alert.setHeaderText("Error en el Id.");
			alert.setContentText("El Id no puede estar vacío.");
			alert.showAndWait();

		} else if (txtNombre.getText() == null || txtNombre.getText().equals("")) {
			flag = false;
			alert.setHeaderText("Error en el nombre.");
			alert.setContentText("El nombre no puede estar vacío.");
			alert.showAndWait();
		} else if (txtContrasena.getText() == null || txtContrasena.getText().equals("")) {
			flag = false;
			alert.setHeaderText("Error en la contraseña.");
			alert.setContentText("La contraseña no puede estar vacía.");
			alert.showAndWait();

		} else if (txtCedula.getText() == null || txtCedula.getText().equals("")) {
			flag = false;
			alert.setHeaderText("Error en la cédula.");
			alert.setContentText("La cédula no puede estar vacía.");
			alert.showAndWait();

		} else if (txtCedula.getText() != null) {
			try {
				int cedula = Integer.parseInt(txtCedula.getText());
			} catch (Exception e) {
				flag = false;
				alert.setHeaderText("Error en la cédula.");
				alert.setContentText("La cédula sólo debe contener caracters numéricos.");
				alert.showAndWait();
			}

		} else if (txtDireccion.getText() == null || txtDireccion.getText().equals("")) {
			flag = false;
			alert.setHeaderText("Error en la dirección.");
			alert.setContentText("La dirección no puede estar vacía.");
			alert.showAndWait();

		} else if (txtTelefono.getText() == null || txtTelefono.getText().equals("")) {
			flag = false;
			alert.setHeaderText("Error en el teléfono.");
			alert.setContentText("El teléfono no puede estar vacío.");
			alert.showAndWait();

		} else if (txtTelefono.getText() != null) {
			try {
				int telefono = Integer.parseInt(txtTelefono.getText());
			} catch (Exception e) {
				flag = false;
				alert.setHeaderText("Error en el teléfono.");
				alert.setContentText("El teléfono sólo debe contener caracters numéricos.");
				alert.showAndWait();
			}

		} else if (tipo == null || tipo.equals("")) {
			flag = false;
			alert.setHeaderText("Error en el tipo.");
			alert.setContentText("El tipo no puede estar vacío. Por favor seleccione uno.");
			alert.showAndWait();
		}

		if (dpFechaNacimiento.getValue() == null) {
			flag = false;
			alert.setHeaderText("Error en la fecha.");
			alert.setContentText("La fecha no puede estar vacía. Por favor seleccione una.");
			alert.showAndWait();

		}

		if (flag) {

			String id = txtId.getText();
			String nombre = txtNombre.getText();
			String contrasena = txtContrasena.getText();
			String cedula = txtCedula.getText();
			String direccion = txtDireccion.getText();
			String telefono = txtTelefono.getText();

			System.out.println(tipo + " " + id + " " + nombre + " " + contrasena + " " + cedula + " " + direccion + " "
					+ date + " " + telefono);

			((Stage) (((Button) event.getSource()).getScene().getWindow())).close();
		}
	}

	@FXML
	void cancelar(ActionEvent event) {
		((Stage) (((Button) event.getSource()).getScene().getWindow())).close();
	}

}
