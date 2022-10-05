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

$nombre             = $_POST['nombre'];
$descripcion        = $_POST['descripcion'];
$precio             = $_POST['precio'];
$imagen             = $_FILES['imagen'];
$imagen_descripcion = $_POST['imagen_descripcion'];

$validador = new ProductoValidar([
    'nombre'                => $nombre,
    'descripcion'           => $descripcion,
    'precio'                => $precio,
    'imagen'                => $imagen,
    'imagen_descripcion'    => $imagen_descripcion,
]);

if($validador->hayErrores()) {
    $_SESSION['errores'] = $validador->obtenerErrores();
    $_SESSION['data_form'] = $_POST;
    header("Location: ../index.php?s=agregar-producto");
    exit;
}
if(!empty($imagen['tmp_name'])) {
    $nombreImg = date('YmdHis_') . $imagen['name'];

    move_uploaded_file($imagen['tmp_name'], PATH_IMAGES . '/' . $nombreImg);
}

try {
    (new Producto)->crear([
        'Usuarios_usuario_id'   => $autenticacion->getId(),
        'nombre'                => $nombre,
        'descripcion'           => $descripcion,
        'precio'                => $precio,
        'imagen'                => $nombreImg ?? '',
        'imagen_descripcion'    => $imagen_descripcion,
    ]);
    $_SESSION['mensaje_exito'] = "El producto <b>" . $nombre . "</b> se añadió con éxito.";
    header("Location: ../index.php?s=administrar");
    exit;
} catch(\Exception $e) {
    $_SESSION['mensaje_error'] = "Ocurrio un error. Intentá de nuevo mas tarde.";
    $_SESSION['data_form'] = $_POST;
    header("Location: ../index.php?s=agregar-producto");
    exit;
}