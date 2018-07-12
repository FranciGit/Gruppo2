package it.gruppo2.ShopOnline.utilities;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtilityConnection {
	
	public static Connection getConnection(){
		Connection connection = null;
		try {
			Class.forName(CostantiConnessione.DB_DRIVER);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		 try {
			connection = DriverManager.getConnection(CostantiConnessione.DB_URL,
					CostantiConnessione.DB_USERNAME, CostantiConnessione.DB_PASSWORD);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return connection;
	}
}
