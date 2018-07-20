<%@page import="it.gruppo2.ShopOnline.model.Prodotto"%>
<%@page import="java.util.List"%>
<%@page import="it.gruppo2.ShopOnline.model.Categoria"%>
<%@page import="it.gruppo2.ShopOnline.model.Utente"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="css/stile.css">
<script type="text/javascript" src="jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="jquery.js"></script>
<script type="text/javascript" src="search.js"></script>
<link href="search.css" rel="stylesheet" type="text/css" />

</head>
<body>

	<%Utente utenteLoggato = (Utente) session.getAttribute("utenteLoggato");%>
	<%List<Prodotto> listaProdottiPerCategoria = (List<Prodotto>) request
				.getAttribute("listaProdottiPerCategoria"); %>
	<% Prodotto prodotto = (Prodotto) session.getAttribute("prodotto"); %>
	

	<!------------- NAVBAR -------------->

<nav class="navbar navbar-default">
<div class="navbar-header">
 <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
 data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
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
                    
            
              <!--  MENU A TENDINA CATEGORIE - FORM -->
              
            <form name="categoria"  class="navbar-form navbar-left form-horizontal"
            id="search-box" action ="listaProdottiPerCategoria" method="get">
			<select name="categoria">
			<option value="ABBIGLIAMENTO">Abbigliamento</option>
				<option value="CASA">Casa</option>
				<option value="ELETTRONICA">Elettronica</option>
				<option value="LIBRI">Libri</option>
				<option value="SPORT">Sport</option>
			</select>
			
			<!--  BARRA DI RICERCA -->
        
        
    
          <fieldset>
              <div class="input-group">
                 <input type="text" class="search-box" placeholder="Search" id="search-in" role="combobox" >
                 <button type="submit" class="btn" value="Cerca"><span class="glyphicon glyphicon-search"></span></button>
                 
              </div>
              </fieldset>
          </form>   
        
        
        <!-- CHIUSURA BARRA DI RICERCA -->
        
        
 
              <% if (utenteLoggato == null) { %>
              <li class="nav navbar-nav">
          	   <a href="login.jsp" class="collapse navbar-collapse">Accedi<span class="sr-only"></span></a>
          	   <% } else { %>
              <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">Il mio account<span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li><a href="myAccount.jsp">il mio profilo</a></li>
                <li><a href="listaAcquisti">i miei acquisti</a></li>
                <li><a href="listaOrdini">i miei ordini</a></li>
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

				<div class="item active">
					<!-- active indica il carousel di partenza
(la prima immagine, altrimenti il carousel sarebbe vuoto e non partirebbe) -->
					<img src="" class="img-carousel">
				</div>
				<div class="item">
					<img src="" class="img-carousel">
				</div>
				<div class="item">
					<img src="" class="img-carousel">
				</div>

			</div>
			<!-- chiude immagini -->

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
			<a> <a class="left carousel-control" href="#myCarousel"
				data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left"></span>
			</a> <a class="right carousel-control" href="#myCarousel"
				data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right"></span>
			</a>

			</a>

		</div>
		<!-- chiude carousel -->

	</div>
	<!-- chiude container -->



</body>
</html>