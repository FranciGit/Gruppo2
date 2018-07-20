<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Recensioni</title>
</head>
<body>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Recensioni</title>
</head>
<body>
<script type="text/javascript">
var massimo = 500;
window.onload = function()
{
    document.modulo.conta.value = massimo;
}
function ContaCaratteri()
{
    document.modulo.conta.value = massimo - document.modulo.testo.value.length;
    if (document.modulo.testo.value.length > massimo)
    {
        document.modulo.testo.value = document.modulo.testo.value.substr(0, massimo);
        document.modulo.conta.value = 0;
        alert("Massimo " + massimo + " caratteri!");
    }
}
</script>

<!--  TEXTAREA -->

<div>
<form name="recensione">
<h2>Scrivi la tua recensione...</h2>

<!--  label per titolo recensione -->
<div>
<label for="titolo" >Scrivi il titolo della tua recensione</label>
<br><br>
<input type="text" name="titolo" id="titolo" class="text" maxlength="120" value placeholder="Scrivi il titolo della tua recensione" style="width:500px" >
</div>
<br><br>

<!-- textarea per testo recensione -->
<div>
<label for="recensione">Scrivi la tua recensione</label>
<br><br>
<textarea name="recensione" id="recensione" class="text" data-minlen="100" data-maxlen="1000" rows="15" cols="150"
placeholder="Racconta agli altri clienti la tua esperienza rispetto al prodotto che hai acquistato..." onkeyup="ContaCaratteri()"></textarea>
</div>
<br>

<!-- SUBMIT -->
<input type="submit" name="invia" value="Pubblica la tua recensione">
</form>
</div>



</body>
</body>
</html>