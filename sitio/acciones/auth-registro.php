<?php

use DaVinci\Modelos\Usuario;
use DaVinci\Validacion\RegistroValidar;

require_once __DIR__ . '/../bootstrap/init.php';

$email              = $_POST['email'];
$nombre             = $_POST['nombre'];
$apellido           = $_POST['apellido'];
$password           = $_POST['password'];
$password_confirmar = $_POST['password_confirmar'];

$validador = new RegistroValidar([
    'email'              => $email,
    'nombre'             => $nombre,
    'apellido'           => $apellido,
    'password'           => $password,
    'password_confirmar' => $password_confirmar,
]);

if($validador->hayErrores()) {
    $_SESSION['errores'] = $validador->obtenerErrores();
    $_SESSION['data_form'] = $_POST;
    header("Location: ../index.php?s=registro");
    exit;
}

try {
    (new Usuario)->crear([
        'email'     => $email,
        'nombre'    => $nombre,
        'apellido'  => $apellido,
        'password'  => password_hash($password, PASSWORD_DEFAULT),
        'rol_fk'    => 2,
    ]);

    $_SESSION['mensaje_exito'] = "Tu cuenta se creó con éxito. Ya podés ingresar al sitio.";

    header('Location: ../index.php?s=login');
    exit;
} catch(\Exception $e) {
    $_SESSION['data_form'] = $_POST;
    $_SESSION['mensaje_error'] = "Ocurrió un error inesperado al tratar de crear la cuenta.";
    header("Location: ../index.php?s=registro");
    exit;
}

