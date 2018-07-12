package it.gruppo2.ShopOnline.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import it.gruppo2.ShopOnline.model.Acquisto;
import it.gruppo2.ShopOnline.model.Categoria;
import it.gruppo2.ShopOnline.model.Prodotto;
import it.gruppo2.ShopOnline.model.TipoSpedizione;
import it.gruppo2.ShopOnline.model.Utente;
import it.gruppo2.ShopOnline.utilities.DBUtilityConnection;

public class AcquistoDaoImpl implements AcquistoDao {
	
	private Connection connection;
	private PreparedStatement prepared;
	private Statement statement;
	

	public AcquistoDaoImpl() {
		connection = DBUtilityConnection.getConnection();
	}

	@Override
	public void insertAcquisto(Acquisto acquisto) {
		String query = "insert into acquisto values("
				+ "acquisto_sequence.nextval, ?, ?, ?, ?, ?, ?, ?)";
		ResultSet rs = null;
		try {
			prepared = connection.prepareStatement(query);
			prepared.setString(1, acquisto.getTipoSpedizione().toString());
			Date dataInizio = Date.valueOf(acquisto.getDataInizio());
			prepared.setDate(2, dataInizio);
			Date dataFine = Date.valueOf(acquisto.getDataFine());
			prepared.setDate(3, dataFine);
			prepared.setDouble(4, acquisto.getPrezzoDiSpedizione());
			prepared.setInt(5, acquisto.getQuantitaAcquistata());
			prepared.setInt(6, acquisto.getIdUtente());
			prepared.setInt(7, acquisto.getIdProdotto());
			prepared.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (prepared != null) {
					prepared.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}		
	}

	@Override
	public List<Acquisto> getAllAcquisti(int idUtente, int idProdotto) {
		List<Acquisto> listaAcquisti = new ArrayList<>();
		String query = "select * from acquisto where id_utente = ? and id_prodotto = ?";
		ResultSet rs = null;
		try {
			prepared = connection.prepareStatement(query);
			prepared.setInt(1, idUtente);
			prepared.setInt(2, idProdotto);
			rs = prepared.executeQuery();
			while (rs.next()) {
				Acquisto acquisto = new Acquisto();
				TipoSpedizione tipoSpedizione = TipoSpedizione.valueOf(rs.getString(1));
				acquisto.setDataInizio(rs.getDate(2).toLocalDate());
				acquisto.setDataFine(rs.getDate(3).toLocalDate());
				acquisto.setPrezzoDiSpedizione(rs.getDouble(4));
				acquisto.setQuantitaAcquistata(rs.getInt(5));
				acquisto.setIdUtente(idUtente);
				acquisto.setIdProdotto(idProdotto);
				listaAcquisti.add(acquisto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (prepared != null) {
					prepared.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return listaAcquisti;
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
