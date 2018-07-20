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
			prepared.setInt(4, acquisto.getQuantitaAcquistata());
			prepared.setInt(5, acquisto.getIdUtente());
			prepared.setInt(6, acquisto.getIdProdotto());
			prepared.setDouble(7, acquisto.getPrezzoAcquisto());
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
	public List<Acquisto> getAllAcquistiByUtente(int idUtente) {
		List<Acquisto> listaAcquisti = new ArrayList<>();
		String query = "select * from acquisto where id_utente = ?"
				+ "and sysdate > data_fine";
		ResultSet rs = null;
		try {
			prepared = connection.prepareStatement(query);
			prepared.setInt(1, idUtente);
			rs = prepared.executeQuery();
			while (rs.next()) {
				Acquisto acquisto = new Acquisto();
				acquisto.setIdAcquisto(rs.getInt(1));
				TipoSpedizione tipoSpedizione = TipoSpedizione.valueOf(rs.getString(2));
				acquisto.setDataInizio(rs.getDate(3).toLocalDate());
				acquisto.setDataFine(rs.getDate(4).toLocalDate());
				acquisto.setQuantitaAcquistata(rs.getInt(5));
				acquisto.setIdUtente(rs.getInt(6));
				acquisto.setIdProdotto(rs.getInt(7));
				acquisto.setPrezzoAcquisto(rs.getDouble(8));
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
	public List<Acquisto> getAllOrdiniByUtente(int idUtente) {
		List<Acquisto> listaOrdini = new ArrayList<>();
		String query = "select * from acquisto where id_utente = ?"
				+ " and sysdate < data_fine";
		ResultSet rs = null;
		try {
			prepared = connection.prepareStatement(query);
			prepared.setInt(1, idUtente);
			rs = prepared.executeQuery();
			while (rs.next()) {
				Acquisto acquisto = new Acquisto();
				acquisto.setIdAcquisto(rs.getInt(1));
				TipoSpedizione tipoSpedizione = TipoSpedizione.valueOf(rs.getString(2));
				acquisto.setDataInizio(rs.getDate(3).toLocalDate());
				acquisto.setDataFine(rs.getDate(4).toLocalDate());
				acquisto.setQuantitaAcquistata(rs.getInt(5));
				acquisto.setIdUtente(rs.getInt(6));
				acquisto.setIdProdotto(rs.getInt(7));
				acquisto.setPrezzoAcquisto(rs.getDouble(8));
				listaOrdini.add(acquisto);
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
		return listaOrdini;
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
