package it.gruppo2.ShopOnline.model;

import java.io.Serializable;

public class Prodotto implements Serializable {
	
	private int idProdotto;
	private String nome;
	private Categoria categoria;
	private String marca;
	private double prezzo;
	private boolean offerta;
	private int sconto; //%
	private int quantitaDisponibile;
	private String immagine; //INSERIRE PERCORSO
	
	public int getIdProdotto() {
		return idProdotto;
	}
	public void setIdProdotto(int idProdotto) {
		this.idProdotto = idProdotto;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public Categoria getCategoria() {
		return categoria;
	}
	public void setCategoria(Categoria categoria) {
		this.categoria = categoria;
	}
	public String getMarca() {
		return marca;
	}
	public void setMarca(String marca) {
		this.marca = marca;
	}
	public double getPrezzo() {
		return prezzo;
	}
	public void setPrezzo(double prezzo) {
		this.prezzo = prezzo;
	}
	public boolean isOfferta() {
		return offerta;
	}
	public void setOfferta(boolean offerta) {
		this.offerta = offerta;
	}
	public int getSconto() {
		return sconto;
	}
	public void setSconto(int sconto) {
		this.sconto = sconto;
	}
	public int getQuantitaDisponibile() {
		return quantitaDisponibile;
	}
	public void setQuantitaDisponibile(int quantitaDisponibile) {
		this.quantitaDisponibile = quantitaDisponibile;
	}
	public String getImmagine() {
		return immagine;
	}
	public void setImmagine(String immagine) {
		this.immagine = immagine;
	}
	
		
	@Override
	public String toString() {
		return "Prodotto [idProdotto=" + idProdotto + ", nome=" + nome
				+ ", categoria=" + categoria + ", marca=" + marca
				+ ", prezzo=" + prezzo + ", offerta=" + offerta
				+ ", sconto=" + sconto + ", quantitaDisponibile=" + quantitaDisponibile
				+ ", immagine=" + immagine + "]";
	}
	
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((categoria == null) ? 0 : categoria.hashCode());
		result = prime * result + idProdotto;
		result = prime * result + ((immagine == null) ? 0 : immagine.hashCode());
		result = prime * result + ((marca == null) ? 0 : marca.hashCode());
		result = prime * result + ((nome == null) ? 0 : nome.hashCode());
		result = prime * result + (offerta ? 1231 : 1237);
		long temp;
		temp = Double.doubleToLongBits(prezzo);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		result = prime * result + quantitaDisponibile;
		result = prime * result + sconto;
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Prodotto other = (Prodotto) obj;
		if (categoria != other.categoria)
			return false;
		if (idProdotto != other.idProdotto)
			return false;
		if (immagine == null) {
			if (other.immagine != null)
				return false;
		} else if (!immagine.equals(other.immagine))
			return false;
		if (marca == null) {
			if (other.marca != null)
				return false;
		} else if (!marca.equals(other.marca))
			return false;
		if (nome == null) {
			if (other.nome != null)
				return false;
		} else if (!nome.equals(other.nome))
			return false;
		if (offerta != other.offerta)
			return false;
		if (Double.doubleToLongBits(prezzo) != Double.doubleToLongBits(other.prezzo))
			return false;
		if (quantitaDisponibile != other.quantitaDisponibile)
			return false;
		if (sconto != other.sconto)
			return false;
		return true;
	}
	
	public double calcoloPrezzoProdotto(double prezzo, int sconto, boolean offerta) {
		double prezzoProdotto;
		if (offerta && (sconto > 0)) {
			prezzoProdotto = prezzo * (100 - sconto) / 100;
		} else {
			prezzoProdotto = prezzo;
		}
		return prezzoProdotto;
	}
	
}
