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
import it.gruppo2.ShopOnline.dao.RecensioniDaoImpl;
import it.gruppo2.ShopOnline.model.Prodotto;
import it.gruppo2.ShopOnline.model.Recensioni;
import it.gruppo2.ShopOnline.model.Utente;

public class AggiungiRecensione extends HttpServlet {
	
	//GET - ci arriviamo da listaAcquisti ---> rimanda a recensioni.jsp
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		int idProdotto = Integer.parseInt(req.getParameter("idProdotto"));
		req.setAttribute("idProdotto", idProdotto);
		RequestDispatcher dispatcher = 
				req.getRequestDispatcher("recensioni.jsp");
		dispatcher.forward(req, resp);
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String titolo = req.getParameter("titolo");
		String contenuto = req.getParameter("contenuto");
		HttpSession sessione = req.getSession();
		Utente utente = (Utente) sessione.getAttribute("utenteLoggato");
		int idUtente = utente.getIdUtente();
		int idProdotto = Integer.parseInt(req.getParameter("idProdotto"));
		
		Recensioni recensione = new Recensioni();
		recensione.setTitolo(titolo);
		recensione.setContenuto(contenuto);
		recensione.setIdUtente(idUtente);
		recensione.setIdProdotto(idProdotto);
		
		RecensioniDaoImpl recensioniService = new RecensioniDaoImpl();
		recensioniService.inserisciRecensione(recensione);
		System.out.println("Recensione inserita: " + recensione);
		List<Recensioni> listaRecensioni = recensioniService.getAllRecensioniByIdProdotto(idProdotto);
		req.setAttribute("listaRecensioni", listaRecensioni);
		req.setAttribute("recensione", recensione);
		recensioniService.close();
		
		ProdottoDaoImpl prodottoService = new ProdottoDaoImpl();
		Prodotto prodotto = prodottoService.getProdottoById(idProdotto);
		prodottoService.close();
		req.setAttribute("prodotto", prodotto);
		
		RequestDispatcher dispatcher = 
				req.getRequestDispatcher("dettagliProdotto.jsp");
		dispatcher.forward(req, resp);
	}

}
