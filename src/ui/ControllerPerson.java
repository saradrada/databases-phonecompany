package ui;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.ChoiceBox;
import javafx.scene.control.DatePicker;
import javafx.scene.control.TextField;
import javafx.scene.control.Button;
import javafx.scene.Scene;
import javafx.stage.Stage;

public class ControllerPerson {

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
    void agregar(ActionEvent event) {

    }

    @FXML
    void cancelar(ActionEvent event) {
    	((Stage) (((Button) event.getSource()).getScene().getWindow())).close();
    }


}
