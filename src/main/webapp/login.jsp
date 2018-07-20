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
<script type="text/javascript" src="js/gestioneForm.js"></script> 
</head>
<body>

<% String username = (String) request.getAttribute("username"); %>
<% Object errore = request.getAttribute("errore"); %>
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
          
          
          
          
 
 <!-- L'UTENTE STA EFFETTUANDO IL LOGIN QUINDI QUESTA PARTE SOTTO è DA RIVEDERE! -->
 

 
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
<input type="checkbox" onchange="document.getElementById('password').type = this.checked ? 'text' : 'password'"> Mostra password
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