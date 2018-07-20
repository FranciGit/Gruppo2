package it.gruppo2.ShopOnline.model;

public enum TipoSpedizione {
	
	GRATUITA (0, 5),
	STANDARD (5.20, 3),
	PRIME (8.40, 1);
	 
	private double PrezzoDiSpedizione;
	
	private int numeroGiorni;
	
	private TipoSpedizione(double prezzoDiSpedizione, int numeroGiorni) {
		PrezzoDiSpedizione = prezzoDiSpedizione;
		this.numeroGiorni = numeroGiorni;
	}

	public double getPrezzoDiSpedizione() {
		return PrezzoDiSpedizione;
	}
	
	public int getNumeroGiorni() {
		return numeroGiorni;
	}

	public void setNumeroGiorni(int numeroGiorni) {
		this.numeroGiorni = numeroGiorni;
	}

	public void setPrezzoDiSpedizione(double prezzoDiSpedizione) {
		PrezzoDiSpedizione = prezzoDiSpedizione;
	}


	
	
	
}
