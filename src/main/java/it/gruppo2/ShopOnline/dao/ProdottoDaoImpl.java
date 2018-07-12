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
				prodotto.setNome(rs.getString(1));
				Categoria categoria = Categoria.valueOf(rs.getString(2));
				prodotto.setCategoria(categoria);
				prodotto.setMarca(rs.getString(3));
				prodotto.setPrezzo(rs.getDouble(4));
				prodotto.setOfferta(rs.getBoolean(5));
				prodotto.setSconto(rs.getInt(6));
				prodotto.setQuantitaDisponibile(rs.getInt(7));
				prodotto.setImmagine(rs.getString(8));
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
	public List<Prodotto> getProdottiDisponibili(boolean disponibile, int idProdotto) {
		List<Prodotto> listaProdottiDisponibili = new ArrayList<>();
		String query = "select * from prodotto where quantita_disponibile <> 0;";
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
				listaProdottiDisponibili.add(prodotto);
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
		return listaProdottiDisponibili;
	}

	@Override
	public List<Prodotto> getProdottiInOfferta(boolean offerta, int idProdotto) {
		List<Prodotto> listaProdottiInOfferta = new ArrayList<>();
		String query = "select * from prodotto where offerta = 1";
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
		String query = "select * from prodotto where categoria = ?";
		ResultSet resultSet = null;
		try {
			prepared = connection.prepareStatement(query);
			prepared.setString(1, categoria.toString());
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
