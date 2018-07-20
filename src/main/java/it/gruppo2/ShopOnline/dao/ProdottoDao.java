package it.gruppo2.ShopOnline.dao;

import java.util.List;

import it.gruppo2.ShopOnline.model.Categoria;
import it.gruppo2.ShopOnline.model.Prodotto;

public interface ProdottoDao {
	
	public Prodotto getProdottoById(int idProdotto);
	
	public List<Prodotto> getAllProdotti();
	
	public void updateQuantita(int quantitaDisponibile, int idProdotto);
	
	public List<Prodotto> getProdottiInOfferta();
	
	public List<Prodotto> getProdottiByCategoria(Categoria categoria);
	
	//AGGIUNGERE METODO PER RIMUOVERE I PRODOTTI DAL CARRELLO?
	
	public void close();

}
