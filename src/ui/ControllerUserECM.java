package ui;

import java.time.LocalDateTime;
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
	private ChoiceBox<String> cbTipo;

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

		int cant = 0;
		String[] datosImprimir = new String[6];
		String tipoConsulta = cbTipo.getSelectionModel().getSelectedItem().toString();

		String cliente = "";
		String funcionario = "";
		System.out.println(tipoConsulta);
		if (flag) {
			try {

				if (tipoConsulta.equals("Cliente")) {
					// System.out.println(Main.pc.consultClient(cedula) + " sin");
					String cliente1 = Main.pc.consultClient(cedula);
					// System.out.println(cliente + "----------");
					String[] datosC = cliente1.split(",");
					for (int i = 0; i < datosC.length; i++) {
						System.out.println(datosC[i]);

					}
					cant = datosC.length;
					datosImprimir = new String[] { "Cliente", datosC[1], datosC[0], datosC[2], datosC[3], datosC[4] };

				} else {
					funcionario = Main.pc.consultaFuncionario(cedula);
					String[] datosF = funcionario.split(",");
					for (int i = 0; i < datosF.length; i++) {
						System.out.println(datosF[i]);
					}
					cant = datosF.length;
					datosImprimir = new String[] { "Funcionario", datosF[0], datosF[1], datosF[4], datosF[5],
							datosF[6] };

				}

			} catch (Exception e) {
			}

			boolean condicion = cant > 0 ? true : false;

			if (condicion) {
				setDisable(false);
				System.out.println("ecm : " + ControllerMenu.ecm);
				if (ControllerMenu.ecm == 2) {

				} else {
					changeLabels(datosImprimir);
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
		String tipoConsulta = cbTipo.getSelectionModel().getSelectedItem().toString();
		boolean condicion = false;

		if (tipoConsulta.equals("Cliente")) {

			try {
				Main.pc.DeletedClient(txtCedula.getText());
				condicion = true;
			} catch (Exception e) {
				System.out.println(e.getMessage());

				condicion = false;
			}
		} else {
			try {
				Main.pc.DeletedFuncionario(txtCedula.getText());
				condicion = true;
			} catch (Exception e) {
				condicion = false;
			}
		}

		if (condicion) {

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
			alert.setContentText("El usuario con la cédula " + txtCedula.getText()
					+ " no se puede eliminar debido a que tiene varias solicitudes asociadas.");
			alert.showAndWait();
		}

	}

	@FXML
	void modificarUsuario(ActionEvent event) {

		Alert alert = new Alert(AlertType.ERROR);
		alert.setTitle("Error");
		// Cambiar condición por el método que verifica si existe.
		boolean flag = true;

		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-YY");
		LocalDateTime date = fecha.getValue().atStartOfDay();
		String fechaFormato = date.format(formatter);

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

			boolean condicion = false;
			if (tipo.equals("Cliente")) {

				String contrasena;
				try {
					contrasena = Main.pc.consultaFuncionario(txtCedula.getText());
					String[] datos = contrasena.split(",");
					Main.pc.EditClient(id, datos[5], nombre, txtCedula.getText(), direccion, fechaFormato, telefono);
					condicion = true;

					txtId.setText(id);
					txtNombre.setText(nombre);
					txtDireccion.setText(direccion);
					txtTelefono.setText(telefono);

				} catch (Exception e1) {

				}

			} else {

				try {
					String c = Main.pc.consultaFuncionario(txtCedula.getText());
					String[] datos = c.split(",");
					String contrasena = datos[2];
					txtId.setText(id);
					txtNombre.setText(nombre);
					txtDireccion.setText(direccion);
					txtTelefono.setText(telefono);
					condicion = true;
				} catch (Exception e1) {

				}

			}

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

		cbTipo.getItems().add("Cliente");
		cbTipo.getItems().add("Funcionario");

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
