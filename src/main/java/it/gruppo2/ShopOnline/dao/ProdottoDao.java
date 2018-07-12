package it.gruppo2.ShopOnline.dao;

import java.util.List;

import it.gruppo2.ShopOnline.model.Categoria;
import it.gruppo2.ShopOnline.model.Prodotto;

public interface ProdottoDao {
	
	public Prodotto getProdottoById(int id_prodotto);
	
	public List<Prodotto> getAllProdotti();
	
	public void getAllProdottiDisponibili(boolean disponibile, int id_prodotto);
	
	public List<Prodotto> getProdottiInOfferta(boolean offerta, int id_prodotto);
	
	public List<Prodotto> getProdottiPerCategoria(Categoria categoria, int id_prodotto);
	
	public void close();

}
