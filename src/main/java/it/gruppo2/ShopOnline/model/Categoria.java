package it.gruppo2.ShopOnline.model;

public enum Categoria {
	
	CAMICIE(1),
	GONNE(2),
	SCARPE(3),
	BORSE(4),
	INTIMO(5);
	
	private int numeroCategoria;
	
	private Categoria(int numeroCategoria) {
		this.numeroCategoria = numeroCategoria;
	}

	public int getNumeroCategoria() {
		return numeroCategoria;
	}

	public void setNumeroCategoria(int numeroCategoria) {
		this.numeroCategoria = numeroCategoria;
	}
	
	
}
