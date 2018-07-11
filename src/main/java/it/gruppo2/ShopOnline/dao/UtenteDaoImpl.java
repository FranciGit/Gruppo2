package it.gruppo2.ShopOnline.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import it.gruppo2.ShopOnline.model.Utente;

public class UtenteDaoImpl implements UtenteDao {
	
	private Connection connection;
	private PreparedStatement prepared;
	private Statement statement;
	

	public void insertUtente(Utente utente) {
		String query = "insert into utente values("
				+ "utente_sequence.nextval, ?, ?, ?, ?, ?)";
		try {
			prepared = connection.prepareStatement(query);
			prepared.setString(1, utente.getNome());
			prepared.setString(2, utente.getCognome());			
			prepared.setString(3, utente.getUsername());
			prepared.setString(4, utente.getPassword());
			prepared.setString(5, utente.getIndirizzo());
			prepared.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (prepared != null){
				try {
					prepared.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}

	public Utente getUtenteByUsernameAndPassword(String username, String password) {
		Utente utente = null;
		String query = "select * from  utente where username = ?"
				+ "and password = ?";
		ResultSet resultSet = null;
		try {
			prepared = connection.prepareStatement(query);
			prepared.setString(1, username);
			prepared.setString(2, password);
			resultSet = prepared.executeQuery();
			if (resultSet.next()){
				utente = new Utente();
				utente.setIdUtente(resultSet.getInt(1));
				utente.setNome(resultSet.getString(2));
				utente.setCognome(resultSet.getString(3));
				utente.setUsername(username);
				utente.setPassword(password);
				utente.setIndirizzo(resultSet.getString(6));
				// posso gi� settare come username e password quelli
				// In entrata (la query deve selezionare proprio username
				// e password)

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (prepared != null) {
				try {
					prepared.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return utente;
	}

	public void close() {
		if (connection != null){
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
