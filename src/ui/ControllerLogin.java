package ui;

import java.io.IOException;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.TextField;
import javafx.stage.Stage;

public class ControllerLogin {

    @FXML
    private TextField txtUser;

    @FXML
    private TextField txtPassword;

    @FXML
    void cancelar(ActionEvent event) {
    }

    @FXML
    void ingresar(ActionEvent event) {

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
