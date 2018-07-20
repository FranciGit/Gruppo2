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

<% Utente utente = (Utente) session.getAttribute("utenteLoggato"); %>
<% Prodotto prodotto = (Prodotto) request.getAttribute("prodotto"); %>
<% Acquisto acquisto = (Acquisto) request.getAttribute("acquisto");%>


<!-- container -->
<div class "container">
<div class="page-header">
<h1>Procedi all'acquisto</h1>
<h3>(Immagine)</h3>
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
<% if (prodotto.getQuantitaDisponibile() <= 5 && prodotto.getQuantitaDisponibile() > 0) { %>
<h3>Solo <%=prodotto.getQuantitaDisponibile()%> articoli ancora disponibili. Affrettati!</h3>
<% } %>

</div> <!-- CHIUDE L'INTESTAZIONE -->


<!-- FORM -->
<form action="acquista" method="post" class="form horizontal"> 

<!--HIDDEN sui parametri che dovrò recuperare nella servlet: -->

<!-- PRODOTTO -->
<input type="hidden" name="idProdotto" value="<%=prodotto.getIdProdotto()%>">
<input type="hidden" name="offerta" value="<%=prodotto.isOfferta()%>">
<input type="hidden" name="sconto" value="<%=prodotto.getSconto()%>">
<input type="hidden" name="prezzo" value="<%=prodotto.getPrezzo()%>">
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
<label for="quantita" class="control-label col-md-4">Quantità:</label>
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


</div> <!-- chiude container -->

</body>
</html>