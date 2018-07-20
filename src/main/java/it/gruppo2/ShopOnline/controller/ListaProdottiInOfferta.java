package it.gruppo2.ShopOnline.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.gruppo2.ShopOnline.dao.ProdottoDaoImpl;
import it.gruppo2.ShopOnline.model.Categoria;
import it.gruppo2.ShopOnline.model.Prodotto;

public class ListaProdottiInOfferta extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		List<Prodotto> listaProdottiInOfferta = new ArrayList<>();
		ProdottoDaoImpl prodottoService = new ProdottoDaoImpl();
		listaProdottiInOfferta = prodottoService.getProdottiInOfferta();
		prodottoService.close();
		req.setAttribute("listaProdottiInOfferta", listaProdottiInOfferta);
		System.out.println(listaProdottiInOfferta);
		RequestDispatcher dispatcher =
				req.getRequestDispatcher("listaProdottiInOfferta.jsp");
		dispatcher.forward(req, resp);
	}

}
