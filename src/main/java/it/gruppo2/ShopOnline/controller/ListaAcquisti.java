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

public class ListaAcquisti extends HttpServlet {

	/**
	 * Questa servlet gestisce la chiamata dal form ritornando la lista acquisti
	 * se dataFine (consegna del prodotto) � anteriore rispetto alla data
	 * odierna, o la lista ordini se dataFine � posteriore alla data odierna
	 */

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		List<Acquisto> listaCompleta = new ArrayList<>();
		List<Acquisto> listaAcquisti = new ArrayList<>();
		AcquistoDaoImpl acquistoService = new AcquistoDaoImpl();
		HttpSession sessione = req.getSession();
		Utente utente = (Utente) sessione.getAttribute("utenteLoggato");
		int idUtente = utente.getIdUtente();
		listaCompleta = acquistoService.getAllAcquistiByUtente(idUtente);
		for (Acquisto acquisto : listaCompleta) {
			boolean controlloDataFine = true;
			if (LocalDate.now().isAfter(acquisto.getDataFine())) {
				listaAcquisti.add(acquisto);
				System.out.println("acquisto aggiunto a listaAcquisti");
				System.out.println(acquisto);
			} else {
				controlloDataFine = false;
			}
		}
		acquistoService.close();
		req.setAttribute("listaAcquisti", listaAcquisti);
		RequestDispatcher dispatcher = req.getRequestDispatcher("listaAcquisti.jsp");
		dispatcher.forward(req, resp);
	}
		
}
