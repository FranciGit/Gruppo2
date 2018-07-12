package it.gruppo2.ShopOnline.dao;

import java.util.List;

import it.gruppo2.ShopOnline.model.Prodotto;

public interface CarrelloDao {
	
	public void insertProdottoIntoCarrello(Prodotto prodotto);
	
	public List<Prodotto> getAllProdottiCarrello(int idProdotto);
	
	public void deleteProdottoFromCarrello(int idProdotto);
	
	

}
