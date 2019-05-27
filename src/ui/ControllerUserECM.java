package ui;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;
import javafx.stage.Stage;
import javafx.scene.control.Button;
import javafx.scene.control.ChoiceBox;
import javafx.scene.control.DatePicker;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.scene.layout.GridPane;

public class ControllerUserECM {

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
	private Label labTitulo;

	@FXML
	private Button btnEliminar;

	@FXML
	private Button btnModificar;

	@FXML
	private GridPane gridModificarUsuario;

	@FXML
	private TextField txtId;

	@FXML
	private TextField txtNombre;

	@FXML
	private TextField txtDireccion;

	@FXML
	private TextField txtTelefono;

	@FXML
	private DatePicker fecha;

	@FXML
	private ChoiceBox<String> cbTipoUsuario;

	@FXML
	void cancelar(ActionEvent event) {
		((Stage) (((Button) event.getSource()).getScene().getWindow())).close();
	}

	@FXML
	void consultarUsuario(ActionEvent event) {

		String[] datosUsuario;
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

			try {
				String cliente = Main.pc.consultClient(cedula);
				String funcionario = Main.pc.consultFuncionario(cedula);

				if (cliente != null) {

					System.out.println(cliente);
					datosUsuario = cliente.split(",");
				} else {
					System.out.println(funcionario);
					datosUsuario = cliente.split(","); 

				}

			} catch (Exception e) {
				Alert alert = new Alert(AlertType.ERROR);
				alert.setTitle("Error");
				flag = false;
				alert.setHeaderText("Consulta de usuarios.");
				alert.setContentText("El usuario con la cédula: " + cedula + " no se encuentra.");
				alert.showAndWait();
			}

			boolean condicion = false;

			if (condicion) {
				setDisable(false);
				if (ControllerMenu.ecm == 2) {

				} else {
					// Cambiar valores de los labels
					changeLabels(new String[] { "TIPO", "ID", "NOMBRE", "DIRECCIÓN", "FECHA", "TELÉFONO" });
				}
			} else {

				Alert alert = new Alert(AlertType.INFORMATION);
				alert.setTitle("Información");
				alert.setHeaderText("Consulta del usuario.");
				alert.setContentText("El usuario con la cédula " + txtCedula.getText() + " no existe.");
				alert.showAndWait();

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
	void modificarUsuario(ActionEvent event) {

		Alert alert = new Alert(AlertType.ERROR);
		alert.setTitle("Error");
		// Cambiar condición por el método que verifica si existe.
		boolean flag = true;

		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yy");
		LocalDate date = fecha.getValue();

		String tipo = cbTipoUsuario.getSelectionModel().getSelectedItem();
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

		if (fecha.getValue() == null) {
			flag = false;
			alert.setHeaderText("Error en la fecha.");
			alert.setContentText("La fecha no puede estar vacía. Por favor seleccione una.");
			alert.showAndWait();

		}
		if (flag) {

			String id = txtId.getText();
			String nombre = txtNombre.getText();
			String direccion = txtDireccion.getText();
			String telefono = txtTelefono.getText();

			alert = new Alert(AlertType.CONFIRMATION);
			alert.setTitle("Confirmación");
			alert.setHeaderText("Modificación de usuario.");
			alert.setContentText(
					"El usuario con la cédula: " + txtCedula.getText() + " ha sido modificado exitosamente.");
			alert.showAndWait();

			((Stage) (((Button) event.getSource()).getScene().getWindow())).close();
		}

	}

	@FXML
	void initialize() {
		setDisable(true);
		btnEliminar.setVisible(false);
		btnModificar.setVisible(false);
		gridModificarUsuario.setVisible(false);
		cbTipoUsuario.getItems().add("Cliente");
		cbTipoUsuario.getItems().add("Funcionario");

		if (ControllerMenu.ecm == 0) {
			// Eliminar
			labTitulo.setText("Formulario Eliminación Usuario");
			btnEliminar.setVisible(true);

		} else if (ControllerMenu.ecm == 1) {
			// Consultar
			labTitulo.setText("Formulario Consulta de Usuarios");

		} else {
			// Modificar
			labTitulo.setText("Formulario Modificación Usuario");
			btnModificar.setVisible(true);
			gridModificarUsuario.setVisible(true);
		}

	}

	private void setDisable(boolean isDisable) {
		btnEliminar.setDisable(isDisable);
		btnModificar.setDisable(isDisable);
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

	private void changeLabels(String[] datosUsuario) {
		labTipo.setText(datosUsuario[0]);
		labId.setText(datosUsuario[1]);
		labNombre.setText(datosUsuario[2]);
		labDireccion.setText(datosUsuario[3]);
		labFecha.setText(datosUsuario[4]);
		labTelefono.setText(datosUsuario[5]);
	}

}
