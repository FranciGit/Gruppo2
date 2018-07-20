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
