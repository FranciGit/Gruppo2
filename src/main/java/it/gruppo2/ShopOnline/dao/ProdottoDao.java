package it.gruppo2.ShopOnline.dao;

import java.util.List;

import it.gruppo2.ShopOnline.model.Categoria;
import it.gruppo2.ShopOnline.model.Prodotto;

public interface ProdottoDao {
	
	public Prodotto getProdottoById(int idProdotto);
	
	public List<Prodotto> getAllProdotti();
	
	public List<Prodotto> getProdottiDisponibili(boolean disponibile, int idProdotto);
	
	public List<Prodotto> getProdottiInOfferta(boolean offerta, int idProdotto);
	
	public List<Prodotto> getProdottiByCategoria(Categoria categoria);
	
	public void close();

}
