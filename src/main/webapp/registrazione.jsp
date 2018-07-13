<%@page import="it.gruppo2.ShopOnline.model.Utente"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registrati</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="css/stile.css">
<script type="text/javascript" src="jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
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
<!-- copio utenteLoggato e la nuova navbar in registrazione e login -->
</ul>
</div>

</nav>

<div class="container"> <!-- CONTIENE TUTTO (header e form) -->

<!-- HEADER -->
<div class="page-header text-center">
<h1>Registrazione</h1>
</div>

<!-- FORM -->
<form class="form-horizontal" action="registrazione" method="post" onsubmit="return validazione()">

<!-- NOME -->
<div class="form-group">

<label for="nome" class="control-label col-md-4">Inserisci Nome</label>

<div class="col-md-5"> <!-- così ora ho 12 colonne-->
<input type="text" name="nome" id="nome" class="form-control">
</div>
<span class="col-md-3"></span> <!-- occuperà la fine della riga -->
</div>

<!-- COGNOME -->
<div class="form-group">

<label for="cognome" class="control-label col-md-4">Inserisci Cognome</label>

<div class="col-md-5">
<input type="text" name="cognome" id="cognome" class="form-control">
</div>
<span class="col-md-3"></span>
</div>

<!-- USERNAME -->
<div class="form-group">
<label for="username" class="control-label col-md-4">Inserisci username</label>
<div class="col-md-5">
<input type="text" name="username" id="username" class="form-control">
</div>
<span class="col-md-3"></span>
</div>

<!-- PASSWORD -->
<div class="form-group">
<label for="password" class="control-label col-md-4">Inserisci Password</label>
<div class="col-md-5">
<input type="password" name="password" id="password" class="form-control">
</div>
<span class="col-md-3"></span>
</div>

<!-- INDIRIZZO -->
<div class="form-group">

<label for="indirizzo" class="control-label col-md-4">Inserisci Indirizzo</label>

<div class="col-md-5">
<input type="text" name="indirizzo" id="indirizzo" class="form-control">
</div>
<span class="col-md-3"></span>
</div>

<!--  aggiungo i BOTTONI -->
<div class="form-group">
<span class="col-md-4"></span>
<div class="col-md-5">
<input type="submit" value="Registrati" class="btn btn-primary">
<input type="reset" vale="Ripristina" class="btn btn-warning"
style="margin-left:2%">
</div>
<span class="col-md-3"></span>
</div>

</div>

</form> <!-- chiusura form -->

<!-- LINK -->
<div class="row">
<span class="col-md-4"></span>
<div class="col-md-5">
<p>Sei già registrato?</p>
<p>Cicca <a href="login.jsp">qui</a> per la login</p>
</div>
<span class="col-md-3"></span>
</div>

<!-- ALERT -->
<div class="alert alert-danger" id="alert" style="display: none">
<!-- questa classe posizione un grosso banner di errore in fondo allo schermo -->
<p class="text-center">Tutti i campi sono obbligatori</p>
<!-- di default l'alert è sempre presente:  per visualizzarlo solo quando l'utente
clicca su Registrati senza aver compilato tutti i campi, inserisco innanzitutto l'attributo
STYLE (display: none), poi dovrò gestire la sua comparsa in caso di registrazione invalida
(vado in gestioneForm, cioè in javascript per modificare dinamicamente l'elemento - nell'else) -->

</div> <!-- chiusura container -->

<!-- ora che il forum è completo vado a inserire action e method:
la action punterà alla Servlet "registrazione" che vado a creare,
mentre il metodo sarà una chiamata post -->



</body>
</html>