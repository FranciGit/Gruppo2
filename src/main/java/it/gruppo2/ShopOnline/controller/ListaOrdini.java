package it.gruppo2.ShopOnline.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import it.gruppo2.ShopOnline.dao.AcquistoDaoImpl;
import it.gruppo2.ShopOnline.model.Acquisto;
import it.gruppo2.ShopOnline.model.Utente;

public class ListaOrdini extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		List<Acquisto> listaOrdini = new ArrayList<>();
		AcquistoDaoImpl acquistoService = new AcquistoDaoImpl();
		HttpSession sessione = req.getSession();
		Utente utente = (Utente) sessione.getAttribute("utenteLoggato");
		int idUtente = utente.getIdUtente();
		listaOrdini = acquistoService.getAllOrdiniByUtente(idUtente);
		for (Acquisto acquisto : listaOrdini) {
				System.out.println("acquisto aggiunto a listaOrdini");
				System.out.println(acquisto);
		}
		acquistoService.close();
		req.setAttribute("listaOrdini", listaOrdini);
		RequestDispatcher dispatcher = req.getRequestDispatcher("listaOrdini.jsp");
		dispatcher.forward(req, resp);
	}
}
