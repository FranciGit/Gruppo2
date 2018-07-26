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
		//recuperare dal form le parole inserite dall'utente nella barra di ricerca come stringa
		//splittare la stringa e inserirla come parametro in ingresso del metodo dao:
		//ciclo for che esegue il controllo per ogni prodotto della lista (che è il ritorno del metodo dao)
		//istanziare il dao di prodotto per richiamare il metodo getProdottiByRicerca
		List<Prodotto> listaProdottiPerCategoria = new ArrayList<>();
		ProdottoDaoImpl prodottoService = new ProdottoDaoImpl();
		String categoria = req.getParameter("categoria");
		String ricerca = req.getParameter("ricerca").toLowerCase();
		listaProdottiPerCategoria = prodottoService.getProdottiByRicerca(ricerca, categoria);
		System.out.println(categoria);
		prodottoService.close();
		System.out.println(listaProdottiPerCategoria);
		req.setAttribute("listaProdottiPerCategoria", listaProdottiPerCategoria);
		RequestDispatcher dispatcher =
				req.getRequestDispatcher("listaProdottiPerCategoria.jsp");
		dispatcher.forward(req, resp);	
	}
	
}
