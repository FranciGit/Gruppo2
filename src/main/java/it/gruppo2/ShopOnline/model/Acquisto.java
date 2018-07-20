package it.gruppo2.ShopOnline.model;

import java.time.LocalDate;

public class Acquisto {
	
	private int idAcquisto;
	private TipoSpedizione tipoSpedizione; //enum
	private LocalDate dataInizio;
	private LocalDate dataFine;
	private int quantitaAcquistata;
	private int idUtente;
	private int idProdotto;
	private double prezzoAcquisto;

	public Acquisto(TipoSpedizione tipoSpedizione, LocalDate dataInizio, LocalDate dataFine,
			int quantitaAcquistata, int idUtente, int idProdotto) {
		this.idAcquisto = idAcquisto;
		this.tipoSpedizione = tipoSpedizione;
		this.dataInizio = dataInizio;
		this.dataFine = dataFine;
		this.quantitaAcquistata = quantitaAcquistata;
		this.idUtente = idUtente;
		this.idProdotto = idProdotto;
	}
	
	public Acquisto() {
	}
	
	public int getIdAcquisto() {
		return idAcquisto;
	}
	public void setIdAcquisto(int idAcquisto) {
		this.idAcquisto = idAcquisto;
	}
	public TipoSpedizione getTipoSpedizione() {
		return tipoSpedizione;
	}
	public void setTipoSpedizione(TipoSpedizione tipoSpedizione) {
		this.tipoSpedizione = tipoSpedizione;
	}
	public LocalDate getDataInizio() {
		return dataInizio;
	}
	public void setDataInizio(LocalDate dataInizio) {
		this.dataInizio = dataInizio;
	}
	public LocalDate getDataFine() {
		return dataFine;
	}
	public void setDataFine(LocalDate dataFine) {
		this.dataFine = dataFine;
	}
	public int getQuantitaAcquistata() {
		return quantitaAcquistata;
	}
	public void setQuantitaAcquistata(int quantitaAcquistata) {
		this.quantitaAcquistata = quantitaAcquistata;
	}
	public int getIdUtente() {
		return idUtente;
	}
	public void setIdUtente(int idUtente) {
		this.idUtente = idUtente;
	}
	public int getIdProdotto() {
		return idProdotto;
	}
	public void setIdProdotto(int idProdotto) {
		this.idProdotto = idProdotto;
	}
	public double getPrezzoAcquisto() {
		return prezzoAcquisto;
	}
	public void setPrezzoAcquisto(double prezzoAcquisto) {
		this.prezzoAcquisto = prezzoAcquisto;
	}

	
	@Override
	public String toString() {
		return "Acquisto [idAcquisto=" + idAcquisto
				+ ", tipoSpedizione=" + tipoSpedizione
				+ ", dataInizio=" + dataInizio
				+ ", dataFine=" + dataFine
				+ ", quantitaAcquistata=" + quantitaAcquistata
				+ ", idUtente="	+ idUtente
				+ ", idProdotto=" + idProdotto
				+ ", prezzoAcquisto=" + prezzoAcquisto + "]";
	}

	public void calcolaPrezzo(double prezzoProdotto, int quantitaAcquistata) {
		double prezzoTotale = prezzoProdotto * quantitaAcquistata;
		prezzoTotale = prezzoTotale + tipoSpedizione.getPrezzoDiSpedizione();
		this.prezzoAcquisto = prezzoTotale; 
	}
	
}
