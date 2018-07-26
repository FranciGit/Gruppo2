<%@page import="it.gruppo2.ShopOnline.model.Utente"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="css/stile.css">
<script type="text/javascript" src="jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<%Utente utenteLoggato = (Utente) session.getAttribute("utenteLoggato");%>
	

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




<div>
<h1>Ciao <%= utenteLoggato.getUsername() %></h1>
<h2>I tuoi dati</h2>

<table>
 	<tr><td>Nome</td><td><%= utenteLoggato.getNome() %></td></tr>
    <tr><td>Cognome</td><td><%= utenteLoggato.getCognome() %></td></tr>
    <tr><td>Username</td><td><%= utenteLoggato.getUsername() %></td></tr>
    <tr><td>Indirizzo</td><td><%= utenteLoggato.getIndirizzo() %></td></tr>
   
</table>
</div>


<!-- HEADER "MODIFICA LE TUE CREDENZIALI" -->
<div class="page-header text-center">
<h1>Modifica le tue credenziali</h1>
</div>

<!-- FORM -->
<form class="form-horizontal" action="modificaCredenziali" method="post"
onsubmit="return validazioneModifica()"> <!--  da controllare -->

<!-- NOME -->
<div class="form-group">

<label for="nome" class="control-label col-md-4">Inserisci Nuovo Nome</label>

<div class="col-md-5"> <!-- così ora ho 12 colonne-->
<input type="text" name="nome" id="nome" class="form-control"
 >
</div>
<span class="col-md-3"></span> <!-- occuperà la fine della riga -->
</div>

<!-- COGNOME -->
<div class="form-group">

<label for="cognome" class="control-label col-md-4">Inserisci Nuovo Cognome</label>

<div class="col-md-5">
<input type="text" name="cognome" id="cognome" class="form-control">
</div>
<span class="col-md-3"></span>
</div>

<!-- USERNAME -->
<div class="form-group">
<label for="username" class="control-label col-md-4">Inserisci Nuovo Username</label>
<div class="col-md-5">
<input type="text" name="username" id="username" class="form-control">
</div>
<span class="col-md-3"></span>
</div>

<!-- PASSWORD -->
<div class="form-group">
<label for="password" class="control-label col-md-4">Inserisci Nuova Password</label>
<div class="col-md-5">
<input type="password" name="password" id="password" class="form-control">
</div>
<span class="col-md-3"></span>
</div>

<!-- INDIRIZZO -->
<div class="form-group">

<label for="indirizzo" class="control-label col-md-4">Inserisci Nuovo Indirizzo</label>

<div class="col-md-5">
<input type="text" name="indirizzo" id="indirizzo" class="form-control">
</div>
<span class="col-md-3"></span>
</div>

<!--  aggiungo i BOTTONI -->
<div class="form-group">
<span class="col-md-4"></span>
<div class="col-md-5">

<input type="hidden" name="nomeOld" id="nomeOld"
value="<%=utenteLoggato.getNome()%>">
<input type="hidden" name="cognomeOld" id="cognomeOld"
value="<%=utenteLoggato.getCognome()%>">
<input type="hidden" name="UsernameOld" id="UsernameOld"
value="<%=utenteLoggato.getUsername()%>">
<input type="hidden" name="passWordOld" id="passwordOld"
value="<%=utenteLoggato.getPassword()%>">
<input type="hidden" name="indirizzoOld" id="indirizzoOld"
value="<%=utenteLoggato.getIndirizzo()%>">

<input type="submit" value="Modifica" class="btn btn-primary"> 

<input type="reset" value="Ripristina" class="btn btn-warning"
style="margin-left:2%">
</div>
<span class="col-md-3"></span>
</div>

</div>

</form> <!-- chiusura form -->


</div>



</body>
</html>


</body>
</html>