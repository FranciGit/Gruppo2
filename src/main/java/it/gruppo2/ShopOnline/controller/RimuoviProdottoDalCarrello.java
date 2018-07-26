package it.gruppo2.ShopOnline.controller;

import java.io.IOException;
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

public class RimuoviProdottoDalCarrello extends HttpServlet {
	//RIMUOVE UN PRODOTTO DAL CARRELLO
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		HttpSession sessione = req.getSession();
		Utente utente = (Utente) sessione.getAttribute("utenteLoggato");
		List<Prodotto> listaCarrello =
				(List<Prodotto>) sessione.getAttribute("listaCarrello");
		ProdottoDaoImpl prodottoService = new ProdottoDaoImpl();
		int idProdotto = Integer.parseInt(req.getParameter("idProdotto"));
		Prodotto prodotto = prodottoService.getProdottoById(idProdotto);
		prodottoService.close();
		System.out.println(listaCarrello.remove(prodotto));
		System.out.println(listaCarrello);
		sessione.setAttribute("listaCarrello", listaCarrello);
		RequestDispatcher dispatcher =
				req.getRequestDispatcher("listaCarrello.jsp");
		dispatcher.forward(req, resp);
	}
	
	

}
