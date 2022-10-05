<?php

use DaVinci\Auth\Autenticacion;

require_once __DIR__ . '/../bootstrap/init.php';

$autenticacion = new Autenticacion();

$autenticacion->cerrarSesion();

$_SESSION['mensaje_exito'] = "La sesión se cerró correctamente. ¡Te esperamos pronto!";
header("Location: ../index.php?s=login");