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
</head>
<body>

	<%
		Utente utenteLoggato = (Utente) session.getAttribute("utenteLoggato");
	%>


	<!-- NAVBAR -->

	<div class="topnav">
		<nav class="nav navbar-default">




		<ul class="title-area">
			<li class="name" style="list-style-type: none">
				<h1>LOGO</h1>
			</li>
		</ul>

		<span>
			<div class="collapse navbar-collapse">


				<div class="topnav-left">
					<div class="dropdown">
						<button class="dropbtn">Tutte le categorie</button>
						<div class="dropdown-content">
							<a href="#">Abbigliamento</a> <a href="#">Casa</a> <a href="#">Elettronica</a>
							<a href="#">Libri</a> <a href="#">Sport</a>
						</div>
					</div>


					<div class="topnav-right">

						<% if (utenteLoggato == null) {	%>
						<div class="dropdown">
							<button class="dropbtn">Accedi</button>
							<div class="dropdown-content">
								<a href="login.jsp">Login</a>
								<a href="registrazione.jsp">Registrati</a>
							</div>
						</div>
						<% } else {	%>
						<li><a href="myAccount.jsp">Il mio account</a></li>
						<li><a href="prodottiCarrello.jsp">Il mio carrello</a></li>
						<li><a href="logout">Logout</a></li>
						<%	}	%>
						
					</div>
				</div>
		</span> </nav>
	</div>











	<!--
<form class="nav-searchbar">
<nav class="nav navbar-default">

<div class="collapse navbar-collapse">
<ul class="nav navbar-nav">
<input type="text" name="barra" id="barra" class="form-control" placeholder="Ricerca...">
<button class="btn btn-success" type submit">Cerca</button>

<select aria-describedby="searchDropdownDescription" class="nav-search-dropdown searchSelect" data-nav-digest="iLdVGIUExgXtzWyBMR1pIG1L7AQ" data-nav-selected="0" id="searchDropdownBox" name="url" style="display: block; top: 0px;" tabindex="5" title="Ricerca in">
<option selected="selected" value="search-alias=aps">Tutte le categorie</option>
<option value="search-alias=apparel">Abbigliamento</option>
<option value="search-alias=grocery">Alimentari e cura della casa</option>
<option value="search-alias=pantry">Amazon Pantry</option>
<option value="search-alias=warehouse-deals">Amazon Warehouse Deals</option>
<option value="search-alias=mobile-apps">App e Giochi</option>
<option value="search-alias=automotive">Auto e Moto</option>
<option value="search-alias=beauty">Bellezza</option>
<option value="search-alias=gift-cards">Buoni Regalo</option>
<option value="search-alias=office-products">Cancelleria e prodotti per ufficio</option>
<option value="search-alias=kitchen">Casa e cucina</option>
<option value="search-alias=popular">CD e Vinili </option>
<option value="search-alias=amazon-devices">Dispositivi Amazon</option>
<option value="search-alias=electronics">Elettronica</option>
<option value="search-alias=diy">Fai da te</option>
<option value="search-alias=dvd">Film e TV</option>
<option value="search-alias=garden">Giardino e giardinaggio</option>
<option value="search-alias=toys">Giochi e giocattoli</option>
<option value="search-alias=jewelry">Gioielli</option>
<option value="search-alias=handmade">Handmade</option>
<option value="search-alias=lighting">Illuminazione</option>
<option value="search-alias=industrial">Industria e Scienza</option>
<option value="search-alias=computers">Informatica</option>
<option value="search-alias=digital-text">Kindle Store</option>
<option value="search-alias=stripbooks">Libri</option>
<option value="search-alias=english-books">Libri in altre lingue</option>
<option value="search-alias=fashion">Moda</option>
<option value="search-alias=digital-music">Musica Digitale</option>
<option value="search-alias=watches">Orologi</option>
<option value="search-alias=baby">Prima infanzia</option>
<option value="search-alias=pets">Prodotti per animali domestici</option>
<option value="search-alias=hpc">Salute e cura della persona</option>
<option value="search-alias=shoes">Scarpe e borse</option>
<option value="search-alias=software">Software</option>
<option value="search-alias=sporting">Sport e tempo libero</option>
<option value="search-alias=mi">Strumenti musicali e DJ</option>
<option value="search-alias=luggage">Valigeria</option>
<option value="search-alias=videogames">Videogiochi</option>
</select>

<%if (utenteLoggato == null) {%>
<li><a href="registrazione.jsp">Registrazione</a></li>
<li><a href="login.jsp">Login</a></li>
<%} else {%>
<li><a href="logout.jsp">Logout</a></li>
<li><a href="Prodotti acquistati">Lista Acquisti</a></li>
<li><a href="I tuoi ordini">Lista Ordini</a></li>
<%}%>

</ul>
</div>
</nav>

</form>

 -->


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