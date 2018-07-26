package it.gruppo2.ShopOnline.dao;

import java.util.List;

import it.gruppo2.ShopOnline.model.Recensioni;

public interface RecensioniDao {
	
	public void inserisciRecensione(Recensioni recensioni);
	
	public List<Recensioni> getAllRecensioniByIdProdotto(int idProdotto);
	
	public void close();

}
