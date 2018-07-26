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

<script>
(document).ready(function(){
    ('[data-toggle="popover"]').popover(); 
});
</script>

<link href="search.css" rel="stylesheet" type="text/css">
</head>

<body>

	<%Utente utenteLoggato = (Utente) session.getAttribute("utenteLoggato");%>
	<%List<Prodotto> listaProdottiPerCategoria = (List<Prodotto>) request
				.getAttribute("listaProdottiPerCategoria"); %>
				
				<% List<Prodotto> listaCarrello = (List<Prodotto>) session.getAttribute("listaCarrello"); %>
				
	<%List<Prodotto> listaProdottiPiuVenduti = (List<Prodotto>) session.getAttribute("listaProdottiPiuVenduti"); %>
	

	<!------------- NAVBAR -------------->

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
      <li><a href="login.jsp"class="collapse navbar-collapse">Accedi
      <span class="glyphicon glyphicon-user"></span></a></li>
       <% } else { %>
      <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Il mio account<b class="caret"></b></a>
        <ul class="dropdown-menu">
         <li><a href="myAccount.jsp">il mio profilo</a></li>
         <li><a href="listaAcquisti">i miei acquisti</a></li>
         <li><a href="listaOrdini">i miei ordini</a></li>
         <li role="separator" class="divider"></li>
         <li><a href="logout">logout</a></li> 
         </ul>
         <li class="dropdown">
       <li class="active"><a href="listaCarrello.jsp">Il mio carrello
       <span class="glyphicon glyphicon-shopping-cart"></span> ( <%=listaCarrello.size()%> )</a></li>             
             </li>
           <% } %>
            </li>
            
          
        </div>
      
        
    </nav>
    <!----------- !Navbar End ------------>

	<div class="page-header">
<div align="center"><img src="https://nextindustry.net/wp-content/uploads/2018/01/Logo_TV_2015.png" style="width:50px "></div>

</div>
	

<!-- CAROUSEL 1 -->


<div class="carousel slide" id="carousel" data-ride="carousel" data-interval="3000" >




<!-- indicatori -->

<ol class="carousel-indicators">
<li data-slide-to="0" class="active" ></li>
<li data-target="#carousel" data-slide-to="1"></li>
<li data-target="#carousel" data-slide-to="2"></li>
</ol>



<div class="carousel-inner">
<div class="item active">
<img src="img/carousel1.jpg " class="img-carousel">
<div class="container">
<div class="carousel-caption">
<h1>COMPRA DA JAVANDO</h1>
</div>
</div>
</div>

<div class="item">
<img src="img/carousel2.jpg ">
<div class="container">
<div class="carousel-caption">
<h1>METTI UN TITOLO</h1>
<p>scrivi un cazzo per descrivere</p>
</div>
</div>
</div>

<div class="item">
<img src="img/carousel3.jpg ">
<div class="container">
<div class="carousel-caption">
<h1>COMPRA DA JAVANDO</h1>
</div>
</div>
</div>


<!-- freccette -->
<a class="left carousel-control" href="#carousel" data-slide="prev"> 
<span class="glyphicon glyphicon-chevron-left"></span>
</a> 
<a class="right carousel-control" href="#carousel" data-slide="next">
<span class="glyphicon glyphicon-chevron-right"></span>
</a>



</div>
</div>

<!-- CHIUSURA CAROSEL 1 -->



<div class="text-center">
<h1>I PRODOTTI PIU VENDUTI</h1>
</div>




<!-- CAROUSEL 2 -->


	<div class="container">
<h2>I prodotti piu venduti</h2>
<h4>Cosa hanno acquistato i nostri clienti questa settimana?</h4>
<h6>Con JAVANDO diventi subito un'icona di stile</h6>
			
		

		<div class="carousel slide" id="carousel2" data-ride="carousel"
			data-interval="3000">
			
	
			

			<div class="carousel-inner">
			<% for (Prodotto prodotto : listaProdottiPiuVenduti) { %>
				<div class="item 
					<% if (listaProdottiPiuVenduti.indexOf(prodotto) == 0) { %>active<% } %>
					">
					<img src="<%=prodotto.getImmagine()%>"
						class="img-carousel" data-toggle="popover"
						title="<%=prodotto.calcoloPrezzoProdotto(prodotto.getPrezzo(), prodotto.getSconto(), prodotto.isOfferta())%>&euro; (sconto <%=prodotto.getSconto()%>%), Disponibilità immediata"
						data-content="I nostri prodotti più venduti">
					
					<div class="carousel-caption">
					<h4>Cosa hanno acquistato i nostri clienti questa settimana?</h4>
<p>Con JAVANDO diventi subito un'icona di stile<a class="label label-primary" target="_blank">
scorpi di piu</a></p>

</div> 
					
				</div>
			
				<% } %>

			</div>
			
			
		<!-- Bottom Carousel Indicators -->

<ol class="carousel-indicators">
<li data-target="#carousel" data-slide-to="0" class="active"></li>
<li data-target="#carousel" data-slide-to="1"></li>
<li data-target="#carousel" data-slide-to="2"></li>
</ol>

<!-- freccette -->
<a class="left carousel-control" href="#carousel" data-slide="prev"> 
<span class="glyphicon glyphicon-chevron-left"></span>
</a> 
<a class="right carousel-control" href="#carousel" data-slide="next">
<span class="glyphicon glyphicon-chevron-right"></span>
</a>


		</div>

	</div>







</body>
</html>