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

import it.gruppo2.ShopOnline.dao.AcquistoDaoImpl;
import it.gruppo2.ShopOnline.dao.ProdottoDaoImpl;
import it.gruppo2.ShopOnline.model.Categoria;
import it.gruppo2.ShopOnline.model.Prodotto;

public class ListaProdottiPerCategoria extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		List<Prodotto> listaProdottiPerCategoria = new ArrayList<>();
		ProdottoDaoImpl prodottoService = new ProdottoDaoImpl();
		String categoriaString = req.getParameter("categoria").toUpperCase();
		Categoria categoria = Categoria.valueOf(categoriaString);
		listaProdottiPerCategoria = prodottoService.getProdottiByCategoria(categoria);
		prodottoService.close();
		for (Prodotto prodotto : listaProdottiPerCategoria) {
			System.out.println(prodotto);
		}
		req.setAttribute("listaProdottiPerCategoria", listaProdottiPerCategoria);
		RequestDispatcher dispatcher =
				req.getRequestDispatcher("listaProdottiPerCategoria.jsp");
		dispatcher.forward(req, resp);	
	}
	
}
