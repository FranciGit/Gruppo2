package it.gruppo2.ShopOnline.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.gruppo2.ShopOnline.dao.AcquistoDaoImpl;
import it.gruppo2.ShopOnline.dao.ProdottoDaoImpl;
import it.gruppo2.ShopOnline.model.Prodotto;

public class ListaProdotti extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		List<Prodotto> listaProdotti = new ArrayList<>();
		ProdottoDaoImpl prodottoService = new ProdottoDaoImpl();
		listaProdotti = prodottoService.getAllProdotti();
		prodottoService.close();
		for ( Prodotto prodotto : listaProdotti){
			System.out.println(prodotto);
		}
		//controlloDisponibilita (listaProdotti);
		req.setAttribute("listaProdotti", listaProdotti);
		RequestDispatcher dispatcher = req.getRequestDispatcher("listaProdotti.jsp");
		dispatcher.forward(req, resp);
	}
	/*
	public void controlloDisponibilita(List<Prodotto> listaProdotti){
		AcquistoDaoImpl acquistoService = new AcquistoDaoImpl();
		for (Prodotto prodotto : listaProdotti){
			boolean controlloDisponibilita = true;
			List<Disponibilita>
			
			
			
		}
		*/
		
	
	
}
