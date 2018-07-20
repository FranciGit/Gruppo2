package it.gruppo2.ShopOnline.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.gruppo2.ShopOnline.dao.ProdottoDaoImpl;
import it.gruppo2.ShopOnline.model.Prodotto;

public class DettagliProdotto extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		Prodotto prodotto = new Prodotto();
		ProdottoDaoImpl prodottoService = new ProdottoDaoImpl();
		int idProdotto = Integer.parseInt(req.getParameter("idProdotto"));
		prodotto = prodottoService.getProdottoById(idProdotto);
		prodottoService.close();
		req.setAttribute("idProdotto", idProdotto);
		RequestDispatcher dispatcher = req.getRequestDispatcher("dettagliProdotto.jsp");
		dispatcher.forward(req, resp);
		
	}

}
