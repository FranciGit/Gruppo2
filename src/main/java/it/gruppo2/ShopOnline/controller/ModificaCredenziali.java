package it.gruppo2.ShopOnline.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import it.gruppo2.ShopOnline.dao.UtenteDaoImpl;
import it.gruppo2.ShopOnline.model.Utente;

public class ModificaCredenziali extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		HttpSession sessione = req.getSession();
		Utente utente = (Utente) sessione.getAttribute("utenteLoggato");
		int idUtente = utente.getIdUtente();
		String nome = req.getParameter("nome");
		String cognome = req.getParameter("cognome");
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String indirizzo = req.getParameter("indirizzo");
		
		UtenteDaoImpl utenteService = new UtenteDaoImpl();
		utenteService.updateUtente(idUtente, nome, cognome, username,
				password, indirizzo);
		System.out.println("Credenziali aggiornate: " + idUtente + " - " +
				nome + " - " + cognome + " - " + username + " - " + password
				+ " - " + indirizzo);
		resp.sendRedirect("myAccount.jsp");
		
		//RequestDispatcher dispatcher = 
			//	req.getRequestDispatcher("myAccount.jsp");
		//dispatcher.forward(req, resp);
	}

}
