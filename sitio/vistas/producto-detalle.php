<?php

use DaVinci\Modelos\Producto;
use DaVinci\Auth\Autenticacion;

$autenticacion = new Autenticacion();
$productos = (new Producto())->productoPorId($_GET['id']);
?>

<div id="producto" class="card mb-3 container">
  <div class="row g-0">
    <div class="col-md-4 text-center">
      <img src="imgs/<?=$productos->getImagen();?>" class="img-fluid rounded-start" alt="<?= $productos->getNombre();?>">
    </div>
    <div class="col-md-8">
      <div class="card-body">
        <h1 class="card-title"><?= $productos->getNombre();?></h1>
        <p class="card-text"><?= $productos->getDescripcion();?></p>
        <p class="card-text">$<?= $productos->getPrecio();?></p>
      </div>
    </div>
      <?php if ($autenticacion->estaAutenticado()): ?>
      <form action="acciones/agregar-carrito.php?id=<?=$productos->getProductoId()?>" method="post">
          <button id="ingresar" type="submit" class="btn btn-success">Agregar al Carrito</button>
      </form>
      <?php endif; ?>
  </div>
    <?php if (!$autenticacion->estaAutenticado()): ?>
        <a id="boton-iniciar" class="btn btn-success" href="index.php?s=login">Inicia Sesión para agregarlo al carrito</a>
    <?php endif; ?>
  <a id="atras" href="index.php?s=productos">Atras</a>
</div>
