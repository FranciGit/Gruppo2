package it.gruppo2.ShopOnline.dao;

import java.util.List;

import it.gruppo2.ShopOnline.model.Acquisto;
import it.gruppo2.ShopOnline.model.Prodotto;

public interface AcquistoDao {
	
	public void insertAcquisto(Acquisto acquisto);
	
	public List<Acquisto> getAllAcquistiByUtente(int idUtente);
	
	public List<Acquisto> getAllOrdiniByUtente(int idUtente);

	public void close();

}
