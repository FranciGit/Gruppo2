<%@page import="it.gruppo2.ShopOnline.model.Utente"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="css/stile.css">
<script type="text/javascript" src="jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
</head>
<body>

<% String username = (String) request.getAttribute("username"); %>
<% Object errore = request.getAttribute("errore"); %>
<% Utente utenteLoggato = (Utente) session.getAttribute("utenteLoggato"); %>

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
<li><a href="logout">Logout</a></li>
<li><a href="listaAcquisti">Lista Acquisti</a></li>
<li><a href="listaOrdini">Lista Ordini</a></li>
<% } %>

</ul>
</div>

</nav>

<div class="container">

<!-- HEADER -->
<div class="page-header text-center">
<h1>Login</h1>
</div>

<!-- FORM (action rimanda alla servlet login che vado a creare + nuova function ValidazioneLoginin js-->  
<form class="form-horizontal" action="login" method="post"
onsubmit="return validazioneLogin()">

<!-- USERNAME -->
<div class="form-group">
<label for="username" class="control-label col-md-4">Inserisci username</label>
<div class="col-md-5">
<input type="text" name="username" id="username" class="form-control"

<% if (username != null) { %>
value="<%=username %>"
<% } %>
>

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

<!--  aggiungo i BOTTONI -->
<div class="form-group">
<span class="col-md-4"></span>
<div class="col-md-5">
<input type="submit" value="Login" class="btn btn-primary" >
<input type="reset" value="Ripristina" class="btn btn-warning"
style="margin-left:2%">
</div>
<span class="col-md-3"></span>
</div>


</form> <!-- chiusura form -->

<!-- LINK -->
<div class="row">
<span class="col-md-4"></span>
<div class="col-md-5">
<p>Non sei ancora registrato?</p>
<p>Cicca <a href="registrazione.jsp">qui</a> per la registrazione</p>
</div>
<span class="col-md-3"></span>
</div>

<!-- ALERT -->
<div class="alert alert-danger" id="alert" style="display: none">
<p class="text-center">Tutti i campi sono obbligatori</p>
</div>

<%if (errore != null) { %>
<div class="alert alert-danger">
<p class="text-center">Username o Password errati</p>
</div>
<% } %>


</div> <!-- chiusura container -->

</body>
</html>