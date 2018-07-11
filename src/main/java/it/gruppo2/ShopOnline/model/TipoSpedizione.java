package it.gruppo2.ShopOnline.model;

public enum TipoSpedizione {
	
	GRATUITA (0), //4-5 GG LAV
	STANDARD (5.20), //2-3 GG LAV 5
	PRIME (8.40); //1 GG LAV 10
	 
	private double PrezzoDiSpedizione;
	private int numeroGiorni;
	
	private TipoSpedizione(double prezzoDiSpedizione) {
		PrezzoDiSpedizione = prezzoDiSpedizione;
	}

	public double getPrezzoDiSpedizione() {
		return PrezzoDiSpedizione;
	}

	public void setPrezzoDiSpedizione(double prezzoDiSpedizione) {
		PrezzoDiSpedizione = prezzoDiSpedizione;
	}
	
	
	
}
