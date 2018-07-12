package it.gruppo2.ShopOnline.dao;

import java.util.List;

import it.gruppo2.ShopOnline.model.Acquisto;

public interface AcquistoDao {
	
	public void insertAcquisto(Acquisto acquisto);
	
	public List<Acquisto> getAllAcquisti(int idUtente, int idProdotto);
	
	public List<Acquisto> getAllOrdini(int idutente, int idProdotto);

	public void close();

}
