<?php

use DaVinci\Auth\Autenticacion;
use DaVinci\Modelos\Producto;

require_once __DIR__ . '/../../bootstrap/init.php';

$autenticacion = new Autenticacion();
if(!$autenticacion->estaAutenticado()) {
    $_SESSION['mensaje_error'] = "Para acceder a esta pantalla es necesario iniciar sesión.";
    header("Location: index.php?s=login");
    exit;
}

$id = $_GET['id'];

$producto = (new Producto())->productoPorId($id);

if (!$producto) {
    $_SESSION['mensaje_error'] = "No existe el producto que se está tratando de eliminar.";
    header("Location: ../index.php?s=administrar");
    exit;
}

try {
    $producto->eliminar();

    if (!empty($producto->getImagen()) && file_exists(__DIR__ . '/../../imgs/' . $producto->getImagen())) {
        unlink('/../../imgs/' . $producto->getImagen());
    }

    $_SESSION['mensaje_exito'] = "El producto <b>" . $producto->getNombre() . "</b> fue eliminado con éxito.";
    header("Location: ../index.php?s=administrar");
    exit;
} catch (\Exception $e) {
    $_SESSION['mensaje_error'] = "Ocurrió un error inesperado al tratar de eliminar el producto. Por favor, probá de nuevo más tarde.";
    header("Location: ../index.php?s=administrar");
    exit;
}
