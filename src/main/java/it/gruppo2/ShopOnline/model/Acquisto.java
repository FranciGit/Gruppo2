package it.gruppo2.ShopOnline.model;

import java.time.LocalDateTime;

public class Acquisto {
	
	private int idAcquisto;
	private TipoSpedizione tipoSpedizione;
	private LocalDateTime dataInizio;
	private LocalDateTime dataFine;
	private double prezzoDiSpedizione;
	private int quantitaAcquistata;
	private int idUtente;
	private int idProdotto;
	
	private double prezzoAcquisto; //aggiunta in più
	
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
	public LocalDateTime getDataInizio() {
		return dataInizio;
	}
	public void setDataInizio(LocalDateTime dataInizio) {
		this.dataInizio = dataInizio;
	}
	public LocalDateTime getDataFine() {
		return dataFine;
	}
	public void setDataFine(LocalDateTime dataFine) {
		this.dataFine = dataFine;
	}
	public double getPrezzoDiSpedizione() {
		return prezzoDiSpedizione;
	}
	public void setPrezzoDiSpedizione(double prezzoDiSpedizione) {
		this.prezzoDiSpedizione = prezzoDiSpedizione;
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
	@Override
	public String toString() {
		return "Acquisto [idAcquisto=" + idAcquisto
				+ ", tipoSpedizione=" + tipoSpedizione
				+ ", dataInizio=" + dataInizio
				+ ", dataFine=" + dataFine
				+ ", prezzoDiSpedizione=" + prezzoDiSpedizione
				+ ", quantitaAcquistata=" + quantitaAcquistata
				+ ", idUtente=" + idUtente
				+ ", idProdotto=" + idProdotto
				+ "]";
	}
	
	public void calcolaPrezzo(double prezzo, double prezzoDiSpedizione) {
		double prezzoTotaleProdotto = prezzo + prezzoDiSpedizione;
		prezzoTotaleProdotto += tipoSpedizione.getPrezzoDiSpedizione(); //funziona con += ???
		this.prezzoAcquisto = prezzoTotaleProdotto;		
	}

}
