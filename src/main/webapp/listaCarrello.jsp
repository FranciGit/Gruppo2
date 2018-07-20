<%@page import="it.gruppo2.ShopOnline.model.Prodotto"%>
<%@page import="java.util.List"%>
<%@page import="it.gruppo2.ShopOnline.model.Utente"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Lista Carrello</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="css/stile.css">
<script type="text/javascript" src="jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
</head>
<body>

   <!-- QUESTA JSP MOSTRA LA LISTA DEI PRODOTTI SALVATI NEL CARRELLO
   QUINDI AVRà ANCHE I BOTTONI "PROCEDI ALL'ACQUISTO" E "DETTAGLI PRODOTTO" -->

<% Utente utenteLoggato = (Utente) session.getAttribute("utenteLoggato"); %>

<% List<Prodotto> listaCarrello = (List<Prodotto>) request.getAttribute("listaCarrello"); %>

<div class "container">
<div class="page-header">
<h1>Il tuo Carrello</h1>
</div>
	

	<!------------- Navbar -------------->


    <!----------- !Navbar End ------------>
   
   
<% if (listaCarrello == null || listaCarrello.isEmpty()) { %>
<h2>La lista è vuota</h2>

<% } else { %>
<ul>
<% for (Prodotto prodotto : listaCarrello) { %>
<li>
<p>
<%= prodotto.getNome() %>
<%= prodotto.getCategoria() %>
</p>   
 
   
<!-- BOTTONE ACQUISTO -->
<form action="acquista" method="get">
<input type="hidden" name="idProdotto"
value="<%=prodotto.getIdProdotto() %>">
<input type="submit" value="Acquista">
</form>

<!-- BOTTONE DETTAGLI PRODOTTO -->
<form action="dettagliProdotto" method="get">
<input type="hidden" name="idProdotto"
value="<%=prodotto.getIdProdotto() %>">
<input type="submit" value="Dettagli prodotto">
</form> 

</li>

<% } %>
</ul>
<% } %>

</body>
</html>