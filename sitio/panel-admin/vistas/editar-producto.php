<?php

use DaVinci\Modelos\Producto;

$errores  = $_SESSION['errores'] ?? [];
$dataForm = $_SESSION['data_form'] ?? [];

unset($_SESSION['errores'], $_SESSION['data_form']);

$producto = (new Producto())->productoPorId($_GET['id']);
?>
<section id="editar" class="container">
    <h1>Edita el producto</h1>

    <p>Cambia los datos que desees del producto. Cuando esté listo, apretá "Actualizar".</p>

    <form action="acciones/editar-producto.php?id=<?=$producto->getProductoId()?>" method="post" enctype="multipart/form-data">
        <div class="row form-fila" >
            <label class="text-start" for="nombre">Nombre:</label>
            <input type="text"
                   id="nombre"
                   name="nombre"
                   class="form-control"
                   value="<?= $dataForm['nombre'] ?? $producto->getNombre(); ?>"
                   aria-describedby="<?= isset($errores['nombre']) ? 'error-nombre' : '';?>"
            >
            <?php
            if (isset($errores['nombre'])):
            ?>
            <div id="error-nombre" class="alert-danger text-center"> <span class="visually-hidden"> Error:</span><?= $errores['nombre'];?></div>
            <?php endif; ?>
        </div>
        <div class="row form-fila">
            <label class="text-start" for="descripcion">Descripción:</label>
            <textarea id="descripcion"
                      name="descripcion"
                      class="form-control"
                      aria-describedby="<?= isset($errores['descripcion']) ? 'error-descripcion' : '';?>"
                ><?= $dataForm['descripcion'] ?? $producto->getDescripcion(); ?></textarea>
            <?php
            if (isset($errores['descripcion'])):
            ?>
            <div id="error-descripcion" class="alert-danger text-center"> <span class="visually-hidden"> Error:</span><?= $errores['descripcion'];?></div>
            <?php endif; ?>
        </div>
        <div class="row form-fila">
            <label class="text-start" for="precio">Precio:</label>
            <input type="number"
                   id="precio"
                   class="form-control"
                   name="precio"
                   value="<?= $dataForm['precio'] ?? $producto->getPrecio(); ?>"
                   aria-describedby="<?= isset($errores['precio']) ? 'error-precio' : '';?>"
            >
            <?php
            if (isset($errores['precio'])):
            ?>
            <div id="error-precio" class="alert-danger text-center"> <span class="visually-hidden"> Error:</span><?= $errores['precio'];?></div>
            <?php endif; ?>
        </div class="row">
        <?php
        if(!empty($producto->getImagen()) && file_exists(__DIR__ . '/../../imgs/' . $producto->getImagen())): ?>
            <div>
                <p class="text-start">Imagen actual:</p>
                <img src="<?= '../imgs/' . $producto->getImagen();?>" alt="">
            </div>
        <?php
        endif; ?>
        <div class="row form-fila">
            <label class="text-start" for="imagen">Imagen:</label>
            <input type="file"
                   id="imagen"
                   name="imagen"
                   class="form-control"
            >
            <?php
            if (isset($errores['imagen'])):
            ?>
                <div id="error-imagen" class="alert-danger text-center"> <span class="visually-hidden"> Error:</span><?= $errores['imagen'];?></div>
            <?php endif;?>
        </div>
        <div class="row form-fila">
            <label class="text-start" for="imagen_descripcion">Descripción de la Imagen:</label>
            <input type="text"
                   id="imagen_descripcion"
                   name="imagen_descripcion"
                   class="form-control"
                   value="<?=$dataForm['imagen_descripcion'] ?? $producto->getImagenDescripcion();?>">
            <?php
            if (isset($errores['imagen_descripcion'])):
                ?>
                <div id="error-imagen_descripcion" class="alert-danger text-center"> <span class="visually-hidden"> Error:</span><?= $errores['imagen_descripcion'];?></div>
            <?php endif;?>
        </div>
        <div>
        <button class="btn btn-success" type="submit">Actualizar</button>
        </div>
    </form>
</section>