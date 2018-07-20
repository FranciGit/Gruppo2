package it.gruppo2.ShopOnline.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import it.gruppo2.ShopOnline.model.Prodotto;
import it.gruppo2.ShopOnline.model.Utente;
import it.gruppo2.ShopOnline.utilities.DBUtilityConnection;

public class CarrelloDaoImpl implements CarrelloDao {
	
	private Connection connection;
	private PreparedStatement prepared;
	private Statement statement;
	
	public CarrelloDaoImpl(){
		connection = DBUtilityConnection.getConnection();
	}
	
	
	//VERIFICARE CORRETTEZZA
	@Override
	public void insertProdottoIntoCarrello(Utente utente, Prodotto prodotto) {
		String query = "insert into carrello values("
				+ "carrello_sequence.nextval, ?, ?)";
		try {
			prepared = connection.prepareStatement(query);
			prepared.setInt(1, utente.getIdUtente());
			prepared.setInt(2, prodotto.getIdProdotto());			
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

	@Override
	public List<Prodotto> getAllCarrelloByUtente (int idUtente) {
		List<Prodotto> listaProdottiCarrello = new ArrayList<>();
		String query = "select * from carrello where id_utente = ?";
		ResultSet resultSet = null;
		try {
			prepared = connection.prepareStatement(query);
			prepared.setInt(1, idUtente);
			resultSet = prepared.executeQuery();
			while (resultSet.next()) {
				Prodotto prodotto = new Prodotto();
				prodotto.setIdProdotto(resultSet.getInt(1));
				prodotto.setNome(resultSet.getString(2));
				prodotto.setMarca(resultSet.getString(3));
				prodotto.setPrezzo(resultSet.getDouble(4));
				prodotto.setOfferta(resultSet.getBoolean(5));
				prodotto.setSconto(resultSet.getInt(6));
				prodotto.setQuantitaDisponibile(resultSet.getInt(7));
				prodotto.setImmagine(resultSet.getString(8));
				prodotto.setParoleChiave(resultSet.getString(9));
				listaProdottiCarrello.add(prodotto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (resultSet != null) {
					resultSet.close();
				}
				if (prepared != null) {
					prepared.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}	
		return listaProdottiCarrello;
	}

	@Override
	public void deleteProdottoFromCarrello(int idProdotto) {		
	}

}
