<%@page import="java.time.LocalDate"%>
<%@page import="it.gruppo2.ShopOnline.model.Acquisto"%>
<%@page import="it.gruppo2.ShopOnline.model.Prodotto"%>
<%@page import="it.gruppo2.ShopOnline.model.Utente"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Acquisto prodotto</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="css/stile.css">
<script type="text/javascript" src="jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
</head>
<body>

<!-- JSP CHE MOSTRA IL FORM MPER L'ACQUISTO DEL PRODOTTO, DOVE L'UTENTE INSERIRà
I DETTAGLI DELL'ACQUISTO -->
<!-- RIMANDERà ALLA LISTA DEGLI ORDINI IN CORSO -  -->

<% Utente utenteLoggato = (Utente) session.getAttribute("utenteLoggato"); %>
<% Prodotto prodotto = (Prodotto) request.getAttribute("prodotto"); %>
<% Acquisto acquisto = (Acquisto) request.getAttribute("acquisto");%>
<% Object acquistoNegato = request.getAttribute("acquistoNegato"); %>

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
        
<!-- container -->
<div class "container">
<div class="page-header">
<h1>Procedi all'acquisto</h1>
<h3> <img src="<%=prodotto.getImmagine()%>"></h3>
<h3><%=prodotto.getNome()%></h3>
<h3><%=prodotto.getMarca()%></h3>

<!-- mettere if: se il prodotto è scontato mostri in grande il prezzo scontato + riga sotto
prezzo non scontato sbarrato + percentuale di sconto fra parentesi.
Se invece il prodotto non è scontato viene mostrato solo il prezzo normale -->

<!-- MOSTRO IL PREZZO EFFETTIVO -->
<h3 style="font-size:30px"><%=prodotto.calcoloPrezzoProdotto(prodotto.getPrezzo(), prodotto.getSconto(), prodotto.isOfferta())%></h3>
<% if (prodotto.isOfferta() && (prodotto.getSconto() > 0)) { %>
<span>
<h3 style="color: red">Prezzo: <del>EUR <%=prodotto.getPrezzo()%></del> (-<%=prodotto.getSconto()%>%)</h3>
</span>
<% } %>
<!-- se rimangono pochi articoli nelle scorte, faccio comparire questo, altrimenti nulla -->
<% if (prodotto.getQuantitaDisponibile() <= 5 && prodotto.getQuantitaDisponibile() > 1) { %>
<h3>Solo <%=prodotto.getQuantitaDisponibile()%> articoli ancora disponibili. Affrettati!</h3>
<% } %>
<% if (prodotto.getQuantitaDisponibile() == 1) { %>
<h3>Solo <%=prodotto.getQuantitaDisponibile()%> articolo ancora disponibile. Affrettati!</h3>
<% } %>

</div> <!-- CHIUDE L'INTESTAZIONE -->


<!-- FORM -->
<form action="acquista" method="post" class="form horizontal" onsubmit="return controlloQuantita()"> 

<!--HIDDEN sui parametri che dovrò recuperare nella servlet: -->

<!-- PRODOTTO -->
<input type="hidden" name="idProdotto" value="<%=prodotto.getIdProdotto()%>">
<input type="hidden" name="offerta" value="<%=prodotto.isOfferta()%>">
<input type="hidden" name="sconto" value="<%=prodotto.getSconto()%>">
<input type="hidden" name="prezzo" value="<%=prodotto.getPrezzo()%>">
<input type="hidden" name="quantitaDisponibile" value="<%=prodotto.getQuantitaDisponibile() %>">
<!-- IMMAGINE?? -->

<!-- FORM per scegliere: tipoSpedizione e quantità -->

<div class="form-group">
<label for="tipoSpedizione" class="control-label col-md-4">
Scegli il tipo di spedizione</label>
<div class="col-md-7" style="font-size: 20px">
<div>
<input type="radio" name="tipoSpedizione" id="tipoSpedizione" value="GRATUITA" checked>
Spedizione GRATUITA - Entro 3/4 giorni lavorativi
</div>
<div>
<input type="radio" name="tipoSpedizione" value="STANDARD">
Standard - Entro 2/3 giorni lavorativi
</div>
<div>
<input type="radio" name="tipoSpedizione" value="PRIME">
1 giorno - Ricevilo entro domani!
</div>
</div>
<span class="col-md-1"></span>
</div>

<div class="form-group">
<span>
<label for="quantita" class="control-label col-md-4">Quantità desiderata:</label>
<div class="col-md-7" style="font-size: 20px">
<select name="quantita" id="quantita">
<option value="1">1</option>
<option value="2">2</option>
<option value="3">3</option>
<option value="4">4</option>
<option value="5">5</option>
<option value="6">6</option>
<option value="7">7</option>
<option value="8">8</option>
<option value="9">9</option>
<option value="10">10</option>
</select>
</div>
</span>
</div>

<!-- SUBMIT ACQUISTA -->
<div class="form-group">
<span class="col-md-4"></span>
<div class="col-md-5">
<input type="submit" value="Acquista" class="btn btn-primary">
</div>
<span class="col-md-3"></span>
</div>
</form>



<!-- ALERT -->
<div class="alert alert-danger" id="alert" style="display: none">
<p class="text-center">Scorte esaurite</p>
</div>

<%if (acquistoNegato != null) { %>
<div class="alert alert-danger">
<p class="text-center">Prodotto momentaneamente non disponibile. Ci dispiace!</p>
</div>
<% } %>


</div> <!-- chiude container -->

</body>
</html>