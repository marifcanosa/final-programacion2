<?php

use DaVinci\Auth\Autenticacion;
use DaVinci\Modelos\Carrito;

require_once __DIR__ . '/../bootstrap/init.php';

$email      = $_POST['email'];
$password   = $_POST['password'];

$autenticacion = new Autenticacion();

if($autenticacion->iniciarSesion($email, $password)) {
    try {
        (new Carrito())->vaciarCarrito();
    } catch (\Exception $e) {
        //echo $e->getMessage();
    }
    $_SESSION['mensaje_exito'] = "Sesión iniciada correctamente.";
    header("Location: ../index.php?s=perfil");
    exit;
} else {
    $_SESSION['mensaje_error'] = "Las credenciales ingresadas no coinciden con ninguno de nuestros registros.";
    $_SESSION['data_form'] = $_POST;
    header("Location: ../index.php?s=login");
    exit;
}

