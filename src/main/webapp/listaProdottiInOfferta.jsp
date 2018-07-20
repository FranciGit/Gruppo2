<%@page import="it.gruppo2.ShopOnline.model.Prodotto"%>
<%@page import="java.util.List"%>
<%@page import="it.gruppo2.ShopOnline.model.Utente"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Lista prodotti in offerta</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="css/stile.css">
<script type="text/javascript" src="jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
</head>
<body>

<% Utente utenteLoggato = (Utente) session.getAttribute("utenteLoggato"); %>
<% List<Prodotto> listaProdottiInOfferta = (List<Prodotto>)
request.getAttribute("listaProdottiInOfferta"); %>

    <!------------- Navbar -------------->


    <!----------- !Navbar End ------------>

<!-- CONTAINER -->

<div class "container">
<div class="page-header">
<h1>Prodotti in offerta</h1>
</div>

<table class="table table-hover">

<thead>
<tr>
<th>Id Prodotto</th>
<th>Nome Prodotto</th>
<th>Categoria</th>
<th>Marca</th>
<th>Prezzo</th>
<th>Offerta</th>
<th>Sconto</th>
<th>Quantità disponibile</th>
<th>Immagine</th>
<th>(ACQUISTA)</th>
<th>(DETTAGLI PRODOTTO)</th>
<th>(AGGIUNGI AL CARRELLO)</th>
</tr>
</thead>

<tbody>

<% for (Prodotto prodotto : listaProdottiInOfferta) { %>
<tr>
<td><%= prodotto.getIdProdotto() %></td>
<td><%= prodotto.getNome() %></td>
<td><%= prodotto.getCategoria().toString() %></td>
<td><%= prodotto.getMarca() %></td>
<td><%= prodotto.getPrezzo() %></td>
<td><%= prodotto.isOfferta()%></td>
<td><%= prodotto.getSconto() %></td>
<td><%= prodotto.getQuantitaDisponibile() %></td>
<td><%= prodotto.getImmagine() %></td>
<!-- GESTISCI STRINGA IMMAGINE -->

<td>

<!-- BOTTONE ACQUISTO -->
<form action="acquista" method="get">
<input type="hidden" name="idProdotto"
value="<%=prodotto.getIdProdotto() %>">

<% if (utenteLoggato != null) { %>
<input type="submit" value="Acquista">
<% } %>
</form>
</td>


<!-- BOTTONE DETTAGLI PRODOTTO -->
<td>
<form action="dettagliProdotto" method="get">
<input type="hidden" name="idProdotto"
value="<%=prodotto.getIdProdotto() %>">
<input type="submit" value="Dettagli prodotto">
</form>
</td>


<!-- BOTTONE AGGIUNGI AL CARRELLO -->
<td>
<form action="listaCarrello" method="get">
<input type="hidden" name="idProdotto"
value="<%=prodotto.getIdProdotto() %>">

<% if (utenteLoggato != null) { %>
<input type="submit" value="Aggiungi al carrello">
<% } %>
</form>
</td>



</tr>
<% } %>


</tbody>
</table>

</div> <!-- chiude container -->


</body>
</html>