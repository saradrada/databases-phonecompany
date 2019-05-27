/**
 * 
 */
package ui;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;
import model.PhoneCompany;

/**
 * @author Sara Ortiz Drada
 *
 */
public class Main extends Application {

	public static PhoneCompany pc;

	public static void main(String[] args) {
		pc = new PhoneCompany();
		try {
			pc.createConection("P09551_1_1", "P09551_1_1_20191");

		} catch (Exception e) {
			e.printStackTrace();
		}
		launch(args);

	}

	@Override
	public void start(Stage primaryStage) throws Exception {
		Parent root = FXMLLoader.load(getClass().getResource("login.fxml"));
		Scene scene = new Scene(root);
		scene.getStylesheets().add(getClass().getResource("style.css").toExternalForm());
		primaryStage.setTitle("Phone Company - Database");
		primaryStage.setScene(scene);
		primaryStage.setResizable(false);
		primaryStage.show();
	}

}
