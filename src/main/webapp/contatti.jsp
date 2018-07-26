<%@page import="it.gruppo2.ShopOnline.model.Utente"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Contatti</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="css/stile.css">
<script type="text/javascript" src="jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=LaTuaChiave&sensor=false"></script>
</head>
<body>

<%Utente utenteLoggato = (Utente) session.getAttribute("utenteLoggato");%>

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
    



 


<div align="center">
<h1>Chi siamo</h1>
<ul type="none">
<li>iShop S.r.l. offre i propri servizi di consulenza mettendo a disposizione</li>
<br>
<li> dei clienti figure professionali in grado di coprire ruoli gestionali ed operativi sfruttando </li> 
<br>
<li>la competenza sulle tecnologie più avanzate e maggiormente richieste dal mercato.</li>
</ul>


</div>

<div align="center">

<h1>Contatti</h1>
<ul type="none">
<li>iShop S.r.l.</li>
<br>
<li>E-mail <span style="color:#FF6600">info@ishop.it</span></li>
<br>
<li>tel. 02 36045773 &nbsp; Fax 02 395 00 890</li>

</ul>
</div>





<div align="center">
<h1>Dove siamo</h1>
<ul type="none">
<li>Sede legale: Via Broletto, 12 - 20121 Milano (Mi)</li>
<br>
<li>Sede operativa: Corso Magenta, 75 - 20123 Milano Mi</li>
</ul>

</div>


<!-- MAPPINA GOOGLE API -->

   <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />

    <style type="text/css">

      html { height: 100% }

      body { height: 50%; margin: 0; padding: 0 }

      #canvas_mappa { height: 100% }

    </style>

   
 
   <script >
 
	function initializza() {
		var latLngRoma = new google.maps.LatLng(41.8905198, 12.4942486);

		var opzioni = {

		center: latLngRoma,

		zoom: 8,

		mapTypeId: google.maps.MapTypeId.ROADMAP

		};

		var map = new google.maps.Map(document.getElementById("canvas_mappa"), opzioni);

		var marker = new google.maps.Marker({position: latLngRoma, map: map, title: "Roma" });

	}
</script> 
  </head>

  <body onload="initializza()">

    <div id="canvas_mappa" style="width:100%; height:50%"></div>
 
</body>
</html>