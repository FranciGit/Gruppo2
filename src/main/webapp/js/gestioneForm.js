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

function validazioneModifica() {
	var nome = document.getElementById('nome').value;
	var cognome = document.getElementById('cognome').value;
	var username = document.getElementById('username').value;
	var password = document.getElementById('password').value;
	var indirizzo = document.getElementById('indirizzo').value;
	
	var nome = document.getElementById('nomeOld').value;
	var cognome = document.getElementById('cognomeOld').value;
	var username = document.getElementById('usernameOld').value;
	var password = document.getElementById('passwordOld').value;
	var indirizzo = document.getElementById('indirizzoOld').value;
	
	var controllo = true;
	
	console.log(nome + " - " + cognome + " - "  + username
			+ " - " + password + " - " + indirizzo);
	if (nome != '' & cognome != ''& username != '' & password != '' & indirizzo != '') {
		return true;
	} else if (nome != 'nomeOld'| cognome != 'cognomeOld' | username != 'usernameOld'
		| password != 'passwordOld' | indirizzo != 'indirizzoOld') {
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

function controlloQuantita() {
	var quantitaScelta = document.getElementById('quantita').value;
	var quantitaDisponibile = document.getElementById('quantitaDisponibile').value;
	console.log(quantitaScelta + ' - ' + quantitaDisponibile);
	if (quantitaScelta > quantitaDisponibile) {
		document.getElementById('alert').style.display = 'block';
		controllo = false;
	}
	return true;
}


function move() {
    var elem = document.getElementById("myBar"); 
    var width = 1;
    var id = setInterval(frame, 10);
    function frame() {
        if (width >= 100) {
            clearInterval(id);
        } else {
            width++; 
            elem.style.width = width + '%'; 
        }
    }
}