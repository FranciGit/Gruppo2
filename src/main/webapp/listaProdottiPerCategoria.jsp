<%@page import="it.gruppo2.ShopOnline.model.Categoria"%>
<%@page import="it.gruppo2.ShopOnline.model.Prodotto"%>
<%@page import="java.util.List"%>
<%@page import="it.gruppo2.ShopOnline.model.Utente"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Lista prodotti per categoria</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="css/stile.css">
<script type="text/javascript" src="jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
</head>
<body>

<% Utente utenteLoggato = (Utente) session.getAttribute("utenteLoggato"); %>
<% List<Prodotto> listaProdottiPerCategoria = (List<Prodotto>)
request.getAttribute("listaProdottiPerCategoria"); %>

<%String categoria = request.getParameter("categoria"); %>

<% List<Prodotto> listaCarrello = (List<Prodotto>) session.getAttribute("listaCarrello"); %>


	<!------------- Navbar -------------->

<nav class="navbar navbar-default" role="navigation">
  <!-- Brand and toggle get grouped for better mobile display -->
  <div class="navbar-header">
    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
      <span class="sr-only">Toggle navigation</span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
    </button>
    <a class="navbar-brand" href="index.jsp" rel="home" href="index.jsp" title="Il nostro shop"><img class="img-responsive logo" 
    src="https://nextindustry.net/wp-content/uploads/2018/01/Logo_TV_2015.png"  alt="logo" style="width:50px"></a>
    
  </div>

  <!-- CONTATTI E OFFERTE-->
  <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
    <ul class="nav navbar-nav">
      <li><a href="contatti.jsp">Contatti</a></li>
      <li><a href="listaProdottiInOfferta">Offerte</a></li>
      
      
      
 <!-- RICERCA PER CATEGORIE-->    
  
  <div class="input-group">
	<div class="row">
	    <form name="categoria"  class="navbar-form navbar-left form-horizontal"
            id="search-box" action ="listaProdottiPerCategoria" method="get">
	        
	      <select class="form-control" name="categoria">	         
	           <option value="Tutte">
	           	Tutte le categorie</option><span class="caret"></span> 
	           <option value="CAMICIE">Camicie</option> 
	           <option value="GONNE">Gonne</option> 
	           <option value="SCARPE">Scarpe</option> 
	           <option value="BORSE">Borse</option> 
	           <option value="INTIMO">Intimo</option> 
	        </select>
	        
	          
	        
<!--  BARRA DI RICERCA -->
	        
	    <div class="input-group">
     
        <form class="navbar-form" role="search">
        <div class="input-group">
            <input type="text" class="form-control" placeholder="Search" name="ricerca" id="ricerca" role="combobox">
            <div class="input-group-btn">
                <button class="btn btn-default" type="submit" value="Cerca" style="width:50px; height:34px">
                <i class="glyphicon glyphicon-search"></i></button>
            </div>
        </div>
        </form>
       
	    </form>
 	</div>
</div>

    </ul>
    
    
    <!-- LATO DESTRO -->
    
    
    <ul class="nav navbar-nav navbar-right">
    <% if (utenteLoggato == null) { %>
      <li><a href="login.jsp"class="collapse navbar-collapse">Accedi <span class="glyphicon glyphicon-user"></span></a></li>
       <% } else { %>
      <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Il mio account<b class="caret"></b></a>
        <ul class="dropdown-menu">
         <li><a href="myAccount.jsp">il mio profilo</a></li>
         <li><a href="listaAcquisti.jsp">i miei acquisti</a></li>
         <li><a href="listaOrdini.jsp">i miei ordini</a></li>
         <li role="separator" class="divider"></li>
         <li><a href="logout">logout</a></li> 
         </ul>
         <li class="dropdown">
         <li class="active"><a href="listaCarrello.jsp">Il mio carrello<span class="sr-only">(current)</span></a></li>
             
             </li>
           <% } %>
            </li>
            
          
        </div>
      
        
    </nav>

    <!----------- !Navbar End ------------>
    
<div class "container">
<div class="page-header">
<h1>Prodotti per categoria</h1>
</div>

<% if (listaProdottiPerCategoria == null || listaProdottiPerCategoria.isEmpty()) { %>
<h2>La lista è vuota</h2>

<% } else { %>
<ul>
<% for (Prodotto prodotto : listaProdottiPerCategoria) { %>
<li>
<p>
<li><a href="#"><img src="<%=prodotto.getImmagine() %>"></a>
<%= prodotto.getNome() %>
<%= prodotto.getCategoria() %>
</p>


<!-- BOTTONE ACQUISTO -->
<form action="acquista" method="get">
<input type="hidden" name="idProdotto"
value="<%=prodotto.getIdProdotto() %>">

<% if (utenteLoggato != null) { %>
<input type="submit" value="Acquista">
<% } %>
</form>

<!-- BOTTONE DETTAGLI PRODOTTO -->
<form action="dettagliProdotto" method="get">
<input type="hidden" name="idProdotto"
value="<%=prodotto.getIdProdotto() %>">
<input type="submit" value="Dettagli prodotto">
</form>

<!-- BOTTONE AGGIUNGI AL CARRELLO -->

<form action="listaCarrello" method="get">
<input type="hidden" name="idProdotto"
value="<%=prodotto.getIdProdotto() %>">

<% if (utenteLoggato != null) { %>
<input type="submit" value="Aggiungi al carrello" 
<% if (listaCarrello != null && listaCarrello.contains(prodotto)) { %>
disabled
class="btn btn-warning"
<% } else { %>
class="btn btn-success">
<% } %> 
<% } %>
</form>

</li>

<% } %>
</ul>
<% } %>









</body>
</html>