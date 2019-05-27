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
		
		launch(args);

	}
	
	@Override
	public void start(Stage primaryStage) throws Exception {
		pc = new PhoneCompany();
		try {
			pc.createConection("P09551_1_4", "P09551_1_4_20191");

		} catch (Exception e) {
			e.printStackTrace();
		}
		Parent root = FXMLLoader.load(getClass().getResource("login.fxml"));
		Scene scene = new Scene(root);
		scene.getStylesheets().add(getClass().getResource("style.css").toExternalForm());
		primaryStage.setTitle("Phone Company - Database");
		primaryStage.setScene(scene);
		primaryStage.setResizable(false);
		primaryStage.show();
	}
	
	public PhoneCompany getPc() {
		return pc;
	}



	public  void setPc(PhoneCompany pc) {
		this.pc = pc;
	}


}
