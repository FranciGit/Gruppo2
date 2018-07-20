<%@page import="it.gruppo2.ShopOnline.model.Acquisto"%>
<%@page import="it.gruppo2.ShopOnline.model.Prodotto"%>
<%@page import="it.gruppo2.ShopOnline.model.Utente"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Conferma acquisto</title>
</head>
<body>
<% Utente utente = (Utente) session.getAttribute("utenteLoggato"); %>
<% Acquisto acquisto = (Acquisto) request.getAttribute("acquisto"); %>

<!-- NAVBAR -->

<div class="container">
<div class="page-header">
<h1>Controllo acquisto</h1>

<% if (acquisto.getTipoSpedizione().getPrezzoDiSpedizione() == 0) { %>
<h3>La spedizione da te scelta è: <%=acquisto.getTipoSpedizione()%></h3>
<% } else { %>
<h3>La spedizione da te scelta è: <%=acquisto.getTipoSpedizione()%>
(+<%=acquisto.getTipoSpedizione().getPrezzoDiSpedizione()%>&euro;)</h3>
<% } %>

<h3> Prezzo totale: <%=acquisto.getPrezzoAcquisto()%> &euro;</h3>
<h3> Consegna prevista: <%=acquisto.getDataFine()%></h3>
</div> 

<form action="listaOrdini" method="get">

<!-- CONFERMA -->
<div class="form-group">
<span class="col-md-4"></span>
<div class="col-md-5">
<input type="submit" value="Vai ai tuoi ordini" class="btn btn-primary">
</div>
<span class="col-md-3"></span>
</div>


</form>


</div>

</body>
</html>