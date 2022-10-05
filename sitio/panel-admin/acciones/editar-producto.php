<?php

use DaVinci\Auth\Autenticacion;
use DaVinci\Modelos\Producto;
use DaVinci\Validacion\ProductoValidar;

require_once __DIR__ . '/../../bootstrap/init.php';

$autenticacion = new Autenticacion();
if(!$autenticacion->estaAutenticado()) {
    $_SESSION['mensaje_error'] = "Para acceder a esta pantalla es necesario iniciar sesión.";
    header("Location: index.php?s=login");
    exit;
}

$id                 = $_GET['id'];
$nombre             = $_POST['nombre'];
$descripcion        = $_POST['descripcion'];
$precio             = $_POST['precio'];
$imagen_descripcion = $_POST['imagen_descripcion'];
$imagen             = $_FILES['imagen'];

$producto = (new Producto())->productoPorId($id);

if(!$producto) {
    $_SESSION['mensaje_error'] = "No existe el producto que se está tratando de editar.";
    header("Location: ../index.php?s=administrar");
    exit;
}

$validador = new ProductoValidar([
    'nombre'                => $nombre,
    'descripcion'           => $descripcion,
    'precio'                => $precio,
    'imagen_descripcion'    => $imagen_descripcion,
    'imagen'                => $imagen,
]);

if($validador->hayErrores()) {
    $_SESSION['errores'] = $validador->obtenerErrores();
    $_SESSION['data_form'] = $_POST;

    header("Location: ../index.php?s=editar-producto&id=" . $id);
    exit;
}
if(!empty($imagen['tmp_name'])) {
    $nombreImagen = date('YmdHis_') . $imagen['name'];

    move_uploaded_file($imagen['tmp_name'], PATH_IMAGES . '/' . $nombreImagen);
}

try {
    $imagenOriginal = $producto->getImagen();

    $producto->editar([
        'nombre'                => $nombre,
        'descripcion'           => $descripcion,
        'precio'                => $precio,
        'imagen_descripcion'    => $imagen_descripcion,
        'imagen'                => $nombreImagen ?? $producto->getImagen(),
    ]);

    if(!empty($nombreImagen)) {
        unlink(PATH_IMAGES . '/' . $imagenOriginal);
    }

    $_SESSION['mensaje_exito'] = "El producto <b>" . $nombre . "</b> fue actualizado con éxito.";
    header("Location: ../index.php?s=administrar");
    exit;
} catch(\Exception $e) {
    $_SESSION['mensaje_error'] = "Ocurrió un error inesperado al tratar de actualizar el producto. Por favor, probá de nuevo más tarde.";
    $_SESSION['data_form'] = $_POST;
    header("Location: ../index.php?s=editar-producto&id=" . $id);
    exit;
}