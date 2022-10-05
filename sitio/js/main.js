function cambiar () {
    let inputCorreo = document.getElementById('select').selectedIndex;
    let divEnvio    = document.getElementById('envio');
    if (inputCorreo == 2) {
    divEnvio.style.display = 'block';
    } else {
    divEnvio.style.display = 'none';
    }
}

