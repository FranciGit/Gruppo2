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

public class Login extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		System.out.println(username + " - " + password);
		UtenteDaoImpl utenteService = new UtenteDaoImpl();
		Utente utente =
				utenteService.getUtenteByUsernameAndPassword(username, password);
		utenteService.close();
		System.out.println(utente);
		
		if (utente == null) {
			System.out.println("credenziali sbagliate");
			
			req.setAttribute("errore", 1);
			RequestDispatcher dispatcher =
					req.getRequestDispatcher("login.jsp");
			dispatcher.forward(req, resp);
		} else {
			System.out.println("login avvenuto con successo");
			HttpSession sessione = req.getSession();
			sessione.setAttribute("utenteLoggato", utente);
			resp.sendRedirect("index.jsp");
		}
		
	}

}
