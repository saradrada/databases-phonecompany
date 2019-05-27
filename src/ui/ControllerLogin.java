package ui;

import java.io.IOException;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.control.Button;
import javafx.scene.control.PasswordField;
import javafx.scene.control.TextField;
import javafx.stage.Stage;

public class ControllerLogin {

	@FXML
	private TextField txtUser;

	@FXML
	private PasswordField txtPassword;

	@FXML
	void cancelar(ActionEvent event) {
		System.exit(0);
	}

	@FXML
	void ingresar(ActionEvent event) {

		Alert alert = new Alert(AlertType.ERROR);
		alert.setTitle("Error");
		boolean flag = true;
		String user = "", password = "";
		if (txtUser.getText() == null || txtUser.getText().equals("")) {
			flag = false;
			alert.setHeaderText("Error en el usuario.");
			alert.setContentText("El usuario no puede estar vacío.");
			alert.showAndWait();

		} else {
			user = txtUser.getText();
		}
		if (txtPassword.getText() == null || txtPassword.getText().equals("")) {
			flag = false;
			alert.setHeaderText("Error en la contraseña.");
			alert.setContentText("La contraseña no puede estar vacía.");
			alert.showAndWait();

		} else {
			password = txtPassword.getText();
		}

		if (flag) {
			Parent root;
			try {
				root = FXMLLoader.load(getClass().getResource("menu.fxml"));
				Stage stage = new Stage();
				stage.setScene(new Scene(root));
				stage.show();

			} catch (IOException e) {
				e.printStackTrace();
			}

			((Stage) (((Button) event.getSource()).getScene().getWindow())).close();
		}

	}

}
