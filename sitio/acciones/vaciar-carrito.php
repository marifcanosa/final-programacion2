<?php
use DaVinci\Modelos\Carrito;

require_once __DIR__ . '/../bootstrap/init.php';

try {
    (new Carrito())->vaciarCarrito();
    header("Location: ../index.php?s=carrito");
    exit;
} catch (\Exception $e) {
    echo $e->getMessage();
    //header("Location: ../index.php?s=productos");
    exit;
}
