function validazione() {
	var nome = document.getElementById('nome').value;
	var cognome = document.getElementById('cognome').value;
	var username = document.getElementById('username').value;
	var password = document.getElementById('password').value;
	var indirizzo = document.getElementById('indirizzo').value;
	console.log(nome + " - " + cognome + " - "  + username
			+ " - " + password + " - " + indirizzo);
	if (nome != '' & cognome != '' & username != '' & password != ''& indirizzo != '') {
		return true;
	} else {
		document.getElementById('alert').style.display = 'block';
		return false;
	}
}

function validazioneLogin() {
	var username = document.getElementById('username').value;
	var password = document.getElementById('password').value;
	console.log(username + " - " + password);
	if (username != '' & password != '') {
		return true;
	} else {
		document.getElementById('alert').style.display = 'block';
		return false;
	}
}