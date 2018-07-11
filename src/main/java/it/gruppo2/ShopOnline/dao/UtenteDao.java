package it.gruppo2.ShopOnline.dao;

import it.gruppo2.ShopOnline.model.Utente;

public interface UtenteDao {
	
	public void insertUtente(Utente utente);
	
	public Utente getUtenteByUsernameAndPassword(String username, String password);
	
	public void close();	
}
