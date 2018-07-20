package it.gruppo2.ShopOnline.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import it.gruppo2.ShopOnline.model.Categoria;
import it.gruppo2.ShopOnline.model.Prodotto;
import it.gruppo2.ShopOnline.utilities.DBUtilityConnection;

public class ProdottoDaoImpl implements ProdottoDao{
	
	private Connection connection;
	private PreparedStatement prepared;
	private Statement statement;
	
	public ProdottoDaoImpl(){
		connection = DBUtilityConnection.getConnection();
	}

	@Override
	public Prodotto getProdottoById(int idProdotto) {
		Prodotto prodotto = null;
		String query = "select * from prodotto where id_prodotto = ?";
		ResultSet rs = null;
		try {
			prepared = connection.prepareStatement(query);
			prepared.setInt(1, idProdotto);
			rs = prepared.executeQuery();
			if (rs.next()) {
				prodotto = new Prodotto();
				prodotto.setIdProdotto(rs.getInt(1));
				prodotto.setNome(rs.getString(2));
				Categoria categoria = Categoria.valueOf(rs.getString(3));
				prodotto.setCategoria(categoria);
				prodotto.setMarca(rs.getString(4));
				prodotto.setPrezzo(rs.getDouble(5));
				prodotto.setOfferta(rs.getBoolean(6));
				prodotto.setSconto(rs.getInt(7));
				prodotto.setQuantitaDisponibile(rs.getInt(8));
				prodotto.setImmagine(rs.getString(9));
				prodotto.setParoleChiave(rs.getString(10));
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
		return prodotto;
	}
	
	
	@Override
	public List<Prodotto> getAllProdotti() {
		List<Prodotto> listaProdotti = new ArrayList<>();
		String query = "select * from prodotto";
		ResultSet resultSet = null;
		try {
			statement = connection.createStatement();
			resultSet = statement.executeQuery(query);
			while (resultSet.next()) {
				Prodotto prodotto = new Prodotto();
				prodotto.setIdProdotto(resultSet.getInt(1));
				prodotto.setNome(resultSet.getString(2));
				Categoria categoria = Categoria.valueOf(resultSet.getString(3));
				prodotto.setCategoria(categoria);
				prodotto.setMarca(resultSet.getString(4));
				prodotto.setPrezzo(resultSet.getDouble(5));
				prodotto.setOfferta(resultSet.getBoolean(6));
				prodotto.setSconto(resultSet.getInt(7));
				prodotto.setQuantitaDisponibile(resultSet.getInt(8));
				prodotto.setImmagine(resultSet.getString(9));
				prodotto.setParoleChiave(resultSet.getString(10));
				listaProdotti.add(prodotto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (resultSet != null) {
					resultSet.close();
				}
				if (statement != null) {
					statement.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return listaProdotti;
	}

	
	@Override
	public void updateQuantita(int quantitaDisponibile, int idProdotto) {
		String query = "update prodotto set quantita_disponibile = ?"
				+ " where id_prodotto = ?";
		try {
			prepared = connection.prepareStatement(query);
			prepared.setInt(1, quantitaDisponibile);
			prepared.setInt(2, idProdotto);
			prepared.executeQuery();
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
	public List<Prodotto> getProdottiInOfferta() {
		List<Prodotto> listaProdottiInOfferta = new ArrayList<>();
		String query = "select * from prodotto where offerta = 1"
				+ " and quantita_disponibile > 0";
		ResultSet resultSet = null;
		try {
			statement = connection.createStatement();
			resultSet = statement.executeQuery(query);
			while (resultSet.next()) {
				Prodotto prodotto = new Prodotto();
				prodotto.setIdProdotto(resultSet.getInt(1));
				prodotto.setNome(resultSet.getString(2));
				Categoria categoria = Categoria.valueOf(resultSet.getString(3));
				prodotto.setCategoria(categoria);
				prodotto.setMarca(resultSet.getString(4));
				prodotto.setPrezzo(resultSet.getDouble(5));
				prodotto.setOfferta(resultSet.getBoolean(6));
				prodotto.setSconto(resultSet.getInt(7));
				prodotto.setQuantitaDisponibile(resultSet.getInt(8));
				prodotto.setImmagine(resultSet.getString(9));
				prodotto.setParoleChiave(resultSet.getString(10));
				listaProdottiInOfferta.add(prodotto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (resultSet != null) {
					resultSet.close();
				}
				if (statement != null) {
					statement.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return listaProdottiInOfferta;
	}

	@Override
	public List<Prodotto> getProdottiByCategoria(Categoria categoria) {
		List<Prodotto> listaProdottiPerCategoria = new ArrayList<>();
		String query = "select * from prodotto where categoria = ?"
				+ " and quantita_disponibile > 0";
		ResultSet resultSet = null;
		try {
			prepared = connection.prepareStatement(query);
			prepared.setString(1, categoria.toString());
			resultSet = prepared.executeQuery();
			while (resultSet.next()) {
				Prodotto prodotto = new Prodotto();
				prodotto.setIdProdotto(resultSet.getInt(1));
				prodotto.setNome(resultSet.getString(2));
				prodotto.setCategoria(categoria);
				prodotto.setMarca(resultSet.getString(4));
				prodotto.setPrezzo(resultSet.getDouble(5));
				prodotto.setOfferta(resultSet.getBoolean(6));
				prodotto.setSconto(resultSet.getInt(7));
				prodotto.setQuantitaDisponibile(resultSet.getInt(8));
				prodotto.setImmagine(resultSet.getString(9));
				prodotto.setParoleChiave(resultSet.getString(10));
				listaProdottiPerCategoria.add(prodotto);
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
		return listaProdottiPerCategoria;
	}
	
	@Override
	public List<Prodotto> getProdottiByRicerca(String paroleRicercate) {
		List<Prodotto> listaProdottiRicercati = new ArrayList<>();
		String query = "select * from prodotto where parole_chiave like '%?%'";
		ResultSet rs = null;
		try {
			prepared = connection.prepareStatement(query);
			prepared.setString(1, paroleRicercate);
			rs = prepared.executeQuery();
			while (rs.next()) {
				Prodotto prodotto = new Prodotto();
				prodotto.setIdProdotto(rs.getInt(1));
				prodotto.setNome(rs.getString(2));
				Categoria categoria = Categoria.valueOf(rs.getString(3));
				prodotto.setCategoria(categoria);
				prodotto.setMarca(rs.getString(4));
				prodotto.setPrezzo(rs.getDouble(5));
				prodotto.setOfferta(rs.getBoolean(6));
				prodotto.setSconto(rs.getInt(7));
				prodotto.setQuantitaDisponibile(rs.getInt(8));
				prodotto.setImmagine(rs.getString(9));
				prodotto.setParoleChiave(rs.getString(10));
				listaProdottiRicercati.add(prodotto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listaProdottiRicercati;
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
