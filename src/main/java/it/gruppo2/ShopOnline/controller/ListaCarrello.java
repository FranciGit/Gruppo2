package it.gruppo2.ShopOnline.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import it.gruppo2.ShopOnline.dao.ProdottoDaoImpl;
import it.gruppo2.ShopOnline.model.Prodotto;
import it.gruppo2.ShopOnline.model.Utente;

public class ListaCarrello extends HttpServlet {
	
	/**
	 * questa servlet ritorna la listaCarrello, che contiene tutti i prodotti
	 * che l'utente ha intenzione di acquistare
	 */
	
	//AGGIUNGE UN PRODOTTO AL CARRELLO E MOSTRA LA LISTA
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession sessione = req.getSession();
		Utente utente = (Utente) sessione.getAttribute("utenteLoggato");
		int idUtente = utente.getIdUtente();
		List<Prodotto> listaCarrello = (List<Prodotto>) sessione.getAttribute("listaCarrello");
			
		ProdottoDaoImpl prodottoService = new ProdottoDaoImpl();
		int idProdotto = Integer.parseInt(req.getParameter("idProdotto"));
		Prodotto prodotto = prodottoService.getProdottoById(idProdotto);
		
		if (listaCarrello == null) {
			listaCarrello = new ArrayList<>();
			listaCarrello.add(prodotto);	
		} else if (!listaCarrello.contains(prodotto)) {
				listaCarrello.add(prodotto);
		}
		prodottoService.close();
			sessione.setAttribute("listaCarrello", listaCarrello);
			System.out.println("Prodotti nel carrello:");
			System.out.println(listaCarrello);
			
		RequestDispatcher dispatcher = req.getRequestDispatcher("listaCarrello.jsp");
		dispatcher.forward(req, resp);
	}
}
