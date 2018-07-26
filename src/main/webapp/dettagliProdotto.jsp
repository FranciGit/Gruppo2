<%@page import="it.gruppo2.ShopOnline.model.Recensioni"%>
<%@page import="it.gruppo2.ShopOnline.model.Prodotto"%>
<%@page import="java.util.List"%>
<%@page import="it.gruppo2.ShopOnline.model.Utente"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Dettagli prodotto</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type = "text/css" href="css/stile.css">
<script type="text/javascript" src="jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>

<style>
.zoom img {
      height: 300px;
      width: 300px;

      -webkit-transition: all 1s ease;
      -moz-transition: all 1s ease;
      -o-transition: all 1s ease;
      -ms-transition: all 1s ease;
      transition: all 1s ease;
}

.zoom img:hover {
      width: 400px;
      height: 400px;
}
</style>

</head>
<body>

<% Utente utenteLoggato = (Utente) session.getAttribute("utenteLoggato"); %>
<% Prodotto prodotto = (Prodotto) request.getAttribute("prodotto"); %>
<% List<Recensioni> listaRecensioni = (List<Recensioni>) request.getAttribute("listaRecensioni"); %>


<!-- NAVBAR -->

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
<h1>Dettagli prodotto</h1>
</div>


<!-- FORM DETTAGLIO PRODOTTO -->
<div class="container" >

<input type="hidden" name="idProdotto"
value="<%=prodotto.getIdProdotto() %>">

    <div class="content-wrapper">	
		<div class="item-container">	
			<div class="container">	
				<div class="col-md-14">
		
					
					<div class="container service1-items col-sm-2 col-md-2 pull-left">
						<center>
							<a id="item-1" class="service1-item">
						 		<img class="zoom pic" src="<%= prodotto.getImmagine()%>" id="immagine" name="immagine">
							</a>							
						</center>
					</div>
				</div>
					
				<div class="col-md-7 pull-right">
				
					<div class="product-title">QUI METTI IL NOME</div>
					<div class="product-desc">QUI METTI LA DESCRIZIONE/MARCA</div>
					<div class="product-rating"></div>
					<hr>
					<div class="product-price">&euro; QUI METTI IL PREZZO</div>
					<div class="product-stock">qui metti la quantità disponibile</div>
					<hr>
					<div class="btn-group cart">
						<button type="button" class="btn btn-success">
							Aggiungi al carrello 
						</button>
					</div>
					<div class="btn-group wishlist">
						<button type="button" class="btn btn-danger">
							Acquista 
						</button>
					</div>
				</div>
			</div> 
		</div>
		
		
<div class="container">		
<div class="col-md-12 product-info">
<ul id="laTabSotto" class="nav nav-tabs nav_tabs">
						
<li class="active"><a href="#infoDelProdotto" data-toggle="tab">INFO DEL PRODOTTO</a></li>
<li><a href="#recensioni" data-toggle="tab">RECENSIONI</a></li>
						
</ul>


<div id="IContenutiTestualiDellaTab" class="tab-content">

					
					
					
<div class="tab-pane fade" id="infoDelProdotto">
<section class="container">


 	<h2><%= prodotto.getNome() %></h2>
    <h4><%= prodotto.getMarca() %></h4>
    
    <h5 style="font-size:30px"><%=prodotto.calcoloPrezzoProdotto(prodotto.getPrezzo(), prodotto.getSconto(), prodotto.isOfferta())%>
	<% if (prodotto.isOfferta() && (prodotto.getSconto() > 0)) { %>
	<h5 style="color: red">Prezzo: <del>EUR <%=prodotto.getPrezzo()%></del> (-<%=prodotto.getSconto()%>%)</h5>
	<% } %>
	</h5>
	
	<% if (prodotto.getQuantitaDisponibile() <= 5 && prodotto.getQuantitaDisponibile() > 0) { %>
	<h3>Ancora <%=prodotto.getQuantitaDisponibile()%> articoli disponibili!</h3> 	
	<% } %>
	

	
	

	
	
	
	
	
	
	

	

</section>
</div>



<!-- FORM ALL RECENSIONI PRODOTTO -->

<div class="tab-pane fade" id="recensioni">

<li><%= listaRecensioni %></li>

</div>


</div> <!-- chiude container dimensioni -->
			
</div> <!-- chiude container -->


</body>

</html>