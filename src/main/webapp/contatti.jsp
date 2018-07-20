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


    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />

    <style type="text/css">

      html { height: 100% }

      body { height: 100%; margin: 0; padding: 0 }

      #canvas_mappa { height: 100% }

    </style>

   
    </script>
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

    <div id="canvas_mappa" style="width:100%; height:100%"></div>


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

<!-- MAPPINA GOOGLE API -->



<div align="center">
<h1>Dove siamo</h1>
<ul type="none">
<li>Sede legale: Via Broletto, 12 - 20121 Milano (Mi)</li>
<br>
<li>Sede operativa: Corso Magenta, 75 - 20123 Milano Mi</li>
</ul>

</div>

</body>
</html>