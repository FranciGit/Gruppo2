package it.gruppo2.ShopOnline.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.gruppo2.ShopOnline.dao.ProdottoDaoImpl;
import it.gruppo2.ShopOnline.model.Prodotto;

public class ListaCarrello extends HttpServlet {
	
	/**
	 * questa servlet ritorna la listaCarrello, che contiene tutti i prodotti
	 * che l'utente ha intenzione di acquistare
	 */
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		List<Prodotto> listaCarrello = new ArrayList<>();
		ProdottoDaoImpl prodottoService = new ProdottoDaoImpl();
		int idProdotto = Integer.parseInt(req.getParameter("idProdotto"));
		Prodotto prodotto = prodottoService.getProdottoById(idProdotto);
		listaCarrello.add(prodotto);
		RequestDispatcher dispatcher =
				req.getRequestDispatcher("listaCarrello.jsp");
		dispatcher.forward(req, resp);
	}
	
	
}
