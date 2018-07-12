package it.gruppo2.ShopOnline.dao;

import java.util.List;

import it.gruppo2.ShopOnline.model.Prodotto;
import it.gruppo2.ShopOnline.model.Utente;

public interface CarrelloDao {
	
	public void insertProdottoIntoCarrello(Utente utente, Prodotto prodotto);
	
	public List<Prodotto> getAllCarrelloByUtente(int idUtente);
	
	public void deleteProdottoFromCarrello(int idProdotto);

	

}
