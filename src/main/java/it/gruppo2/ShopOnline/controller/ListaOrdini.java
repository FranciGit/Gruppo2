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
		List<Acquisto> listaCompleta = new ArrayList<>();
		List<Acquisto> listaOrdini = new ArrayList<>();
		AcquistoDaoImpl acquistoService = new AcquistoDaoImpl();
		HttpSession sessione = req.getSession();
		Utente utente = (Utente) sessione.getAttribute("utenteLoggato");
		int idUtente = utente.getIdUtente();
		listaCompleta = acquistoService.getAllAcquistiByUtente(idUtente);
		
		for (Acquisto acquisto : listaCompleta) {
			boolean controlloDataFine = true;
			if (LocalDate.now().isBefore(acquisto.getDataFine())) {
				listaOrdini.add(acquisto);
				System.out.println("acquisto aggiunto a listaOrdini");
				System.out.println(acquisto);
			} else {
				controlloDataFine = false;
			}
		}
		acquistoService.close();
		req.setAttribute("listaOrdini", listaOrdini);
		RequestDispatcher dispatcher = req.getRequestDispatcher("listaOrdini.jsp");
		dispatcher.forward(req, resp);
	}
}
