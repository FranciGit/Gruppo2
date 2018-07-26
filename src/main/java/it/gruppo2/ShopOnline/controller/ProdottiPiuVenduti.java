package it.gruppo2.ShopOnline.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import it.gruppo2.ShopOnline.dao.ProdottoDaoImpl;
import it.gruppo2.ShopOnline.model.Prodotto;

//@WebServlet("/index.jsp")
public class ProdottiPiuVenduti extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		HttpSession sessione = req.getSession();
		List<Prodotto> listaProdottiPiuVenduti = new ArrayList<>();
		ProdottoDaoImpl prodottoService = new ProdottoDaoImpl();
		listaProdottiPiuVenduti = prodottoService.getTreProdottiPiuVenduti();
		prodottoService.close();
		sessione.setAttribute("listaProdottiPiuVenduti", listaProdottiPiuVenduti);
		System.out.println(listaProdottiPiuVenduti);
		RequestDispatcher dispatcher = 
				req.getRequestDispatcher("index.jsp");
		dispatcher.forward(req, resp);
	}

}
