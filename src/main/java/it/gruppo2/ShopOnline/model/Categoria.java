package it.gruppo2.ShopOnline.model;

public enum Categoria {
	
	ABBIGLIAMENTO(1),
	CASA(2),
	ELETTRONICA(3),
	LIBRI(4),
	SPORT(5);
	
	private int numeroCategoria;
	
	private Categoria(int numeroCategoria) {
		this.numeroCategoria = numeroCategoria;
	}
}
