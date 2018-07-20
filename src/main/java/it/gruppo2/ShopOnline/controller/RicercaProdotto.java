package it.gruppo2.ShopOnline.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RicercaProdotto extends HttpServlet {
	
	//recuperare dal form le parole inserite dall'utente nella barra di ricerca
	//istanziare il dao di prodotto per richiamare il metodo getProdottiByRicerca
	//ciclo for che esegue il controllo per ogni prodotto della lista (che è il ritorno del metodo dao)
	//quindi splitto le stringhe ricevuto e controllo il matching tra le varie parole in vari cicli
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
	}

}
