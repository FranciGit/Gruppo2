package it.gruppo2.ShopOnline.model;

import java.util.ArrayList;

public class Utente {
	
	private int idUtente;
	private String nome;
	private String cognome;
	private String username;
	private String password;
	private String indirizzo;
	private ArrayList<Acquisto> listaOrdini;
	private ArrayList<Acquisto> listaAcquisti;
	
	public int getIdUtente() {
		return idUtente;
	}
	public void setIdUtente(int idUtente) {
		this.idUtente = idUtente;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getCognome() {
		return cognome;
	}
	public void setCognome(String cognome) {
		this.cognome = cognome;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getIndirizzo() {
		return indirizzo;
	}
	public void setIndirizzo(String indirizzo) {
		this.indirizzo = indirizzo;
	}
	public ArrayList<Acquisto> getListaOrdini() {
		return listaOrdini;
	}
	public void setListaOrdini(ArrayList<Acquisto> listaOrdini) {
		this.listaOrdini = listaOrdini;
	}
	public ArrayList<Acquisto> getListaAcquisti() {
		return listaAcquisti;
	}
	public void setListaAcquisti(ArrayList<Acquisto> listaAcquisti) {
		this.listaAcquisti = listaAcquisti;
	}
	@Override
	public String toString() {
		return "Utente [idUtente=" + idUtente + ", nome=" + nome + ", cognome=" + cognome + ", username=" + username
				+ ", password=" + password + ", indirizzo=" + indirizzo + ", listaOrdini=" + listaOrdini
				+ ", listaAcquisti=" + listaAcquisti + "]";
	}
	
	
}
