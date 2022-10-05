<?php
use DaVinci\Auth\Autenticacion;

require_once __DIR__ . '/bootstrap/init.php';

$rutas = [
    'home' => [
        'title' => 'Home',
    ],
    'productos' => [
        'title' => 'Productos',
    ],
    'producto-detalle' => [
        'title' => 'Ver Producto',
    ],
    'contacto' => [
        'title' => 'Contacto',
    ],
    'registro' => [
        'title' => 'Registrarse',
    ],
    'login' => [
        'title' => 'Iniciar Sesión',
    ],
    'blog' => [
        'title' => 'Blog',
    ],
    'categoria-detalle' => [
        'title' => 'Categoria Producto',
    ],
    'perfil' => [
        'title' => 'Perfil',
        'requiereAutenticacion' => true,
    ],
    'carrito' => [
        'title' => 'Carrito',
        'requiereAutenticacion' => true,
    ],
    'checkout' => [
        'title' => 'Checkout',
        'requiereAutenticacion' => true,
    ],
    '404' => [
        'title' => 'Página no encontrada',
    ],
];

$vista = $_GET['s'] ?? 'home';

if (!isset($rutas[$vista])) {
    $vista = '404';
}

$rutaConfig = $rutas[$vista];

$autenticacion = new Autenticacion();
$requiereAuth = $rutaConfig['requiereAutenticacion'] ?? false;
if($requiereAuth && !$autenticacion->estaAutenticado()) {
    $_SESSION['mensaje_error'] = "Para acceder a esta pantalla es necesario iniciar sesión.";
    header("Location: index.php?s=login");
    exit;
}
$mensajeExito = $_SESSION['mensaje_exito'] ?? null;
$mensajeError = $_SESSION['mensaje_error'] ?? null;

unset($_SESSION['mensaje_exito'], $_SESSION['mensaje_error']);
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/estilos.css"/>
    <title>Mi Villa Ecologica: <?= $rutaConfig['title'];?></title>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a href="index.php?=home"><div id="logo">Logo de la Página</div></a>
    <div id="barra" class="container-fluid">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" aria-current="page" href="index.php?s=home">INICIO</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="index.php?s=productos">PRODUCTOS</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="index.php?s=blog">BLOG</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="index.php?s=contacto">CONTACTO</a>
                </li>
                <?php
                if (!$autenticacion->estaAutenticado()):
                    ?>
                    <li class="nav-item">
                        <a class="nav-link" href="index.php?s=login">INICIAR SESIÓN</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="index.php?s=registro">REGISTRARSE</a>
                    </li>
                <?php
                endif;
                ?>
                <?php
                if ($autenticacion->estaAutenticado()):
                    ?>
                    <li class="nav-item">
                        <a class="nav-link" href="index.php?s=perfil">MI PERFIL</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="index.php?s=carrito">CARRITO</a>
                    </li>
                    <li class="cerrar-sesion">
                        <form action="acciones/auth-cerrar-sesion.php">
                            <button class="btn btn-light" type="submit"><?= $autenticacion->getUsuario()->getEmail();?> (Cerrar Sesión) </button>
                        </form>
                    </li>
                <?php
                endif;
                ?>
            </ul>
        </div>
    </div>
</nav>
    <main>
        <?php
        if ($mensajeExito !== null):
            ?>
            <div role="alert" class="mensajes alert-success"> <?= $mensajeExito; ?> </div>
        <?php
        endif;
        ?>
        <?php
        if ($mensajeError !== null):
            ?>
            <div role="alert" class="mensajes alert-danger"> <?= $mensajeError; ?> </div>
        <?php
        endif;
        ?>
        <?php
        if (file_exists('./vistas/' . $vista . '.php')) {
            require __DIR__  . '/vistas/' . $vista . '.php';
        }
        else {
            require __DIR__ . '/vistas/404.php';
        }
        ?>
    </main>
    <footer>
    <div class="container">
        <ul id="social">
                <li><a id="facebook" href="https://www.facebook.com/mivillaecologica" target="_blank">Facebook</a></li>
                <li><a id="whatsapp" href="https://wa.me/c/5492323349146" target="_blank">WhatsApp</a></li>
                <li><a id="instagram" href="https://www.instagram.com/mivillaecologica/" target="_blank">Instagram</a></li>
        </ul>
        <p>&copy; Escuela Da Vinci, Marianela Fernandes Canosa.</p>
    </div>
    </footer>
    <script src="css/bootstrap.bundle.min.js"></script>
    <script src="js/main.js"></script>
</body>
</html>