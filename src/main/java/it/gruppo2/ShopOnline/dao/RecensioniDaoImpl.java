package it.gruppo2.ShopOnline.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import it.gruppo2.ShopOnline.model.Recensioni;
import it.gruppo2.ShopOnline.utilities.DBUtilityConnection;

public class RecensioniDaoImpl implements RecensioniDao {

	private Connection connection;
	private PreparedStatement prepared;
	private Statement statement;
	
	public RecensioniDaoImpl(){
		connection = DBUtilityConnection.getConnection();
	}

	public void inserisciRecensione(Recensioni recensioni) {
		String query = "insert into recensioni values("
				+ "?, ?, ?, ?)";
		try {
			prepared = connection.prepareStatement(query);
			prepared.setInt(1, recensioni.getIdUtente());
			prepared.setInt(2, recensioni.getIdProdotto());
			prepared.setString(3, recensioni.getTitolo());
			prepared.setString(4, recensioni.getContenuto());
			prepared.executeUpdate();
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
	}

	@Override
	public List<Recensioni> getAllRecensioniByIdProdotto(int idProdotto) {
		List<Recensioni> listaRecensioni = new ArrayList<>();
		String query ="select * from recensioni where id_prodotto = ?";
		ResultSet resultSet = null;
		try {
			prepared = connection.prepareStatement(query);
			prepared.setInt(1, idProdotto);
			resultSet = prepared.executeQuery();
			while (resultSet.next()) {
				Recensioni recensione = new Recensioni();
				recensione.setIdUtente(resultSet.getInt(1));
				recensione.setIdProdotto(idProdotto);
				recensione.setTitolo(resultSet.getString(3));
				recensione.setContenuto(resultSet.getString(4));
				listaRecensioni.add(recensione);	
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}	finally {
			try {
				if (resultSet != null) {
					resultSet.close();
				}
				if (statement != null) {
					statement.close();
				}
			}	catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return listaRecensioni;	
	}
	
	@Override
	public void close() {
		if (connection != null) {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}		
	}
}
