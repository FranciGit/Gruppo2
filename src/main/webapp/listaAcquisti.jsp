<%@page import="it.gruppo2.ShopOnline.controller.ListaAcquisti"%>
<%@page import="it.gruppo2.ShopOnline.model.Acquisto"%>
<%@page import="java.util.List"%>
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
<% List<Acquisto> listaAcquisti = (List<Acquisto>) request.getAttribute("listaAcquisti"); %>
	

	<!------------- Navbar -------------->

    
    <!----------- !Navbar End ------------>
    
    
<div class="container">

<div class="page-header">

    
    
    <h1>I tuoi acquisti</h1>
    </div>
     
    <% if (listaAcquisti == null || listaAcquisti.isEmpty()){ %>
    <h2>La tua lista è vuota</h2>
    <% } else { %>
    <ul> 
    <% for ( Acquisto acquisto : listaAcquisti){ %>
    <div class="list-group-item">
    <li>
    <p>
    <%= acquisto.getIdProdotto() %>
    <%= acquisto.getQuantitaAcquistata()%>
    <%= acquisto.getDataInizio() %>
    <%= acquisto.getDataFine() %>
    </p>
    
  
</div>
</form>
</li>
<% } %>
</ul>

<% } %>
    
    

    

</body>
</html>