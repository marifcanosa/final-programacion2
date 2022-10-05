<?php

use DaVinci\Modelos\Producto;

$productosFactory = new Producto();
$productos = ($productosFactory)->todo(5, null);
$paginador = $productosFactory->getPaginador();
?>
<section class="container">
    <h1>Administrar Productos</h1>

    <div>
        <a class="btn btn-dark mb-3" href="index.php?s=agregar-producto">Agregar Producto</a>
    </div>

    <table class="table">
        <thead>
        <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Descripción</th>
            <th>Precio</th>
            <th>Imagen</th>
            <th>Acciones</th>
        </tr>
        </thead>
        <tbody>
        <?php
        foreach($productos as $producto):
        ?>
            <tr>
                <td><?= $producto->getProductoId();?></td>
                <td><?= $producto->getNombre();?></td>
                <td><?= $producto->getDescripcion();?></td>
                <td><?= $producto->getPrecio();?></td>
                <td><img src="<?= "../imgs/" . $producto->getImagen();?>" alt="<?= $producto->getImagenDescripcion();?>" style="width: 10rem;"></td>
                <td>
                    <a style="margin: 5px;" class="btn btn-dark" href="index.php?s=editar-producto&id=<?=$producto->getProductoId();?>">Editar</a>
                    <a style="margin: 5px;" class="btn btn-danger" href="index.php?s=eliminar-producto&id=<?=$producto->getProductoId();?>"> Eliminar </a>
                </td>
            </tr>
        <?php
        endforeach;
        ?>
        </tbody>
    </table>
    <?php
    $paginador->setUrl('?s=administrar');
    $paginador->links();
    ?>
</section>