<?php

use DaVinci\Modelos\Producto;

$producto = (new Producto())->productoPorId($_GET['id']);
?>
<section class="container" id="eliminar">
    <h1>¿Eliminar el producto <?= $producto->getNombre();?>?</h1>
    <p class="alert-danger text-center">Esta acción no es reversible.</p>

    <dl>
        <dt>ID</dt>
        <dd><?= $producto->getProductoId();?></dd>
        <dt>Nombre</dt>
        <dd><?= $producto->getNombre();?></dd>
        <dt>Descripción</dt>
        <dd><?= $producto->getDescripcion();?></dd>
        <dt>Precio</dt>
        <dd><?= $producto->getPrecio();?></dd>
        <dt>Imagen</dt>
        <dd><img src="<?='../imgs/' . $producto->getImagen();?>" alt="" style="width: 10rem;"></dd>
        <dt>Descripción de la imagen</dt>
        <dd><?= $producto->getImagenDescripcion();?></dd>
    </dl>
    <form action="acciones/eliminar-producto.php?id=<?=$producto->getProductoId()?>" method="post">
        <button class="btn btn-danger" type="submit">Eliminar</button>
    </form>
</section>
