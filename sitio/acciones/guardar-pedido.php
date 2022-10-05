<?php

use DaVinci\Modelos\Compras;
use DaVinci\Modelos\Carrito;
use DaVinci\Auth\Autenticacion;
use DaVinci\Validacion\CheckoutValidar;

require_once __DIR__ . '/../bootstrap/init.php';



$todosProductos = (new Carrito())->todosProductos();

$totalPrecio = 0;

$usuario = new Autenticacion();
$nombre_usuario = $usuario->getUsuario()->getNombre();
$mail_usuario = $usuario->getUsuario()->getEmail();
$productos = array();

foreach ($todosProductos as $producto) {
    $totalPrecio += $producto->getPrecio();
    array_push($productos, $producto->getProducto());
}

$nombre        = $_POST['nombre'];
$apellido      = $_POST['apellido'];
$mail          = $_POST['mail'];
$telefono      = $_POST['telefono'];
$numero        = $_POST['numero'];
$vencimiento   = $_POST['vencimiento'];
$codigo        = $_POST['codigo'];
$titular       = $_POST['titular'];
$dni           = $_POST['dni'];

$validador = new CheckoutValidar([
    'nombre'          => $nombre,
    'apellido'        => $apellido,
    'mail'            => $mail,
    'telefono'        => $telefono,
    'numero'          => $numero,
    'vencimiento'     => $vencimiento,
    'codigo'          => $codigo,
    'titular'         => $titular,
    'dni'             => $dni,
]);

if($validador->hayErrores()) {
    $_SESSION['errores'] = $validador->obtenerErrores();
    $_SESSION['data_form'] = $_POST;
    header("Location: ../index.php?s=checkout");
    exit;
}

try {
    (new Compras())->agregarCompra([
        'productos'      => implode(", ", $productos),
        'cliente'        => $nombre_usuario,
        'total'          => $totalPrecio,
        'mail_cliente'   => $mail_usuario,
    ]);
    (new Carrito())->vaciarCarrito();
    header("Location: ../index.php?s=perfil");
    exit;
} catch (\Exception $e) {
    echo $e->getMessage();
    //header("Location: index.php?s=carrito");
    exit;
}
?>

