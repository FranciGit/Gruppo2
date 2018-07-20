package it.gruppo2.ShopOnline.controller;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import it.gruppo2.ShopOnline.dao.AcquistoDaoImpl;
import it.gruppo2.ShopOnline.dao.ProdottoDaoImpl;
import it.gruppo2.ShopOnline.model.Acquisto;
import it.gruppo2.ShopOnline.model.Prodotto;
import it.gruppo2.ShopOnline.model.TipoSpedizione;
import it.gruppo2.ShopOnline.model.Utente;

public class Acquista extends HttpServlet {
	
	//recupera il prodotto selezionato tramite l'id (bottone 'acquista')
	//e rimanda alla pagina alla jsp acquistoProdotto (dove l'utente
	//dovrà specificare i dettagli dell'acquisto)
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		int idProdotto = Integer.parseInt(req.getParameter("idProdotto"));
		//parametro passato con l'input di type hidden
		ProdottoDaoImpl prodottoService = new ProdottoDaoImpl();
		Prodotto prodotto = prodottoService.getProdottoById(idProdotto);
		System.out.println(prodotto);
		prodottoService.close();
		req.setAttribute("prodotto", prodotto);
		RequestDispatcher dispatcher =
				req.getRequestDispatcher("acquistoProdotto.jsp");
		dispatcher.forward(req, resp);
	}
	
	//acquisto definitivo
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		//(DAL FORM RECUPERO TUTTE LE VARIABILI DI ACQUISTO
		
		String tipoSpedizioneString = req.getParameter("tipoSpedizione");
		TipoSpedizione tipoSpedizione = TipoSpedizione.valueOf(tipoSpedizioneString);
		LocalDate dataInizio = LocalDate.now();
		LocalDate dataFine = dataInizio.plusDays(tipoSpedizione.getNumeroGiorni());
		String quantitaString = req.getParameter("quantita");
		int quantitaAcquistata = Integer.parseInt(quantitaString);
		HttpSession sessione = req.getSession();
		Utente utente = (Utente) sessione.getAttribute("utenteLoggato");
		int idUtente = utente.getIdUtente();
		int idProdotto = Integer.parseInt(req.getParameter("idProdotto"));
		
		ProdottoDaoImpl prodottoService = new ProdottoDaoImpl();
		Prodotto prodotto = prodottoService.getProdottoById(idProdotto);
		double prezzoProdotto =	prodotto.calcoloPrezzoProdotto
				(prodotto.getPrezzo(), prodotto.getSconto(), prodotto.isOfferta());
		
		Acquisto acquisto = new Acquisto(tipoSpedizione, dataInizio, dataFine,
				quantitaAcquistata, idUtente, idProdotto);				
		acquisto.calcolaPrezzo(prezzoProdotto, quantitaAcquistata);
		System.out.println(acquisto);
		
		int quantitaDiminuita =
				prodotto.getQuantitaDisponibile() - quantitaAcquistata;
		prodottoService.updateQuantita(quantitaDiminuita, idProdotto);
		System.out.println("quantità aggiornata: " + quantitaDiminuita);
		prodottoService.close();
		
		//ACQUISTO
		AcquistoDaoImpl acquistoService = new AcquistoDaoImpl();
		acquistoService.insertAcquisto(acquisto);
		System.out.println("Acquisto inserito");
		acquistoService.close();
	
		req.setAttribute("acquisto", acquisto);
		RequestDispatcher dispatcher = req.getRequestDispatcher("riepilogoAcquisto.jsp");
		dispatcher.forward(req, resp);
	}
}
