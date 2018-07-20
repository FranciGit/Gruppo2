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
<script type="text/javascript" src="js/gestioneForm.js"></script> 
</head>
<body>


<% Utente utenteLoggato = (Utente) session.getAttribute("utenteLoggato"); %>

	

	<!------------- Navbar -------------->

<nav class="navbar navbar-default">
<div class="navbar-header">
 <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
<span class="sr-only">Toggle navigation</span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="index.jsp">Logo</a>
        </div>

        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
          
          <ul class="nav navbar-nav">
            <li class="active"><a href="contatti.jsp">Contatti<span class="sr-only">(current)</span></a></li>
            <li class="active"><a href="listaProdottiInOfferta">Offerte<span class="sr-only">(current)</span></a></li>
            <li class="dropdown">
            
            <!--  MENU A TENDINA CATEGORIE -->
            
            <a href="#" class="dropdown-toggle" role="button" data-toggle="dropdown">Tutte le categorie<span class="caret"></span></a>
            <ul class="dropdown-menu">
            <li><a value="search-alias=ABBIGLIAMENTO">Abbigliamento</a></li>
            <li><a href="listaProdottiPerCategoria">Casa</a></li>
            <li><a href="listaProdottiPerCategoria">Elettronica</a></li>
            <li><a href="listaProdottiPerCategoria">Libri</a></li>
            <li><a href="listaProdottiPerCategoria">Sport</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="listaProdottiPerCategoria.jsp">Guarda Tutto</a></li>
            </ul>
            </li>
                        
            
        <!--  BARRA DI RICERCA -->
        
          <form class="navbar-form navbar-left form-horizontal" role="search">
              <div class="input-group">
                 <input type="text" class="search-box" placeholder="Search">
                 <button type="submit" class="btn"><span class="glyphicon glyphicon-search"></span></button>
              </div>
          </form>   
 
              <% if (utenteLoggato == null) { %>
              <li class="nav navbar-nav">
          	   <a href="login.jsp" class="collapse navbar-collapse">Accedi<span class="sr-only"></span></a>
          	   <% } else { %>
              <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">Il mio account<span class="caret"></span></a>
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

<p class="text-center">Tutti i campi sono obbligatori</p>


</div> 

</div>

</body>
</html>