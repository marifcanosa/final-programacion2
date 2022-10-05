<?php
 use DaVinci\Modelos\Carrito;
 use DaVinci\Modelos\Producto;

require_once __DIR__ . '/../bootstrap/init.php';

$id                 = $_GET['id'];
$producto           = (new Producto())->productoPorId($id);
$nombre             = $producto->getNombre();
$precio             = $producto->getPrecio();
$imagen             = $producto->getImagen();
$imagen_descripcion = $producto->getImagenDescripcion();

try {
    (new Carrito())->agregarItem([
        'producto'           => $nombre,
        'precio'             => $precio,
        'imagen'             => $imagen,
        'imagen_descripcion' => $imagen_descripcion,
    ]);
    header("Location: ../index.php?s=carrito");
    exit;
} catch (\Exception $e) {
    header("Location: ../index.php?s=productos");
    exit;
}

