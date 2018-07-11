<%@page import="it.gruppo2.ShopOnline.model.Utente"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<script type="text/javascript" src="jquery/jquery-3.2.1.min.js"></script>
</head>
<body>

<% Utente utenteLoggato = (Utente) session.getAttribute("utenteLoggato"); %>

<!-- NAVBAR -->
<nav class="nav navbar-default">

<div class="navbar-header">
<a href="index.jsp" class="navbar-brand">Home</a>
</div>

<div class="collapse navbar-collapse">
<ul class="nav navbar-nav">
<li><a href="">Lista Prodotti</a></li>

<% if (utenteLoggato == null) { %>
<li><a href="registrazione.jsp">Registrazione</a></li>
<li><a href="login.jsp">Login</a></li>
<% } else { %>
<li><a href="logout.jsp">Logout</a></li>
<li><a href="listaAcquisti">Lista Acquisti</a></li>
<li><a href="listaOrdini">Lista Ordini</a></li>
<% } %>

</ul>
</div>
</nav>

<div class="container">

<div class="page-header text-center">
<h1>Benvenuto in SHOOOOP!</h1>
</div>

<!--  CAROUSEL -->
<div class="carousel slide" id="myCarousel" data-ride="carousel"
data-interval="3000">
<!-- data-ride="carousel" lo slide delle immagini comincia in automatico al caricare della pagina
data-interval indica i secondi che trascorrono fra lo scorrere delle immagini-->

<!--  inserisco le IMMAGINI nel carousel
per ogni elemento ho un div con class item = un'immagine per ogni div-->
<div class="carousel-inner">

<div class="item active"> <!-- active indica il carousel di partenza
(la prima immagine, altrimenti il carousel sarebbe vuoto e non partirebbe) -->
<img src="" class="img-carousel">
</div>
<div class="item">
<img src="" class="img-carousel">
</div>
<div class="item">
<img src="" class="img-carousel">
</div>

</div> <!-- chiude immagini -->

<!-- indicatori -->
<ol class="carousel-indicators">
<!-- posiziona il carousel e definisce lo stile di default dei 3 pallini per scorrere le immagini -->
<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
<!-- l'immagine in cui inserisco class="active" deve coincidere con quella
in cui ho inserito l'attributo active prima -->
<!-- data-target indica dove voglio apportare le modifiche (in questo caso l'intero carousel)
data-slide-to indica quali immagini con indice che parte da 0-->
<li data-target="#myCarousel" data-slide-to="1"></li>
<li data-target="#myCarousel" data-slide-to="2"></li>
</ol>

<!-- freccette -->
<a>
<a class="left carousel-control" href="#myCarousel" data-slide="prev">
<span class="glyphicon glyphicon-chevron-left"></span>
</a>

<a class="right carousel-control" href="#myCarousel" data-slide="next">
<span class="glyphicon glyphicon-chevron-right"></span>
</a>

</a>

</div> <!-- chiude carousel -->

</div> <!-- chiude container -->

</body>
</html>