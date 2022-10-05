<?php
$errores  = $_SESSION['errores'] ?? [];
$dataForm = $_SESSION['data_form'] ?? [];

unset($_SESSION['errores'], $_SESSION['data_form']);
?>
<section id="agregar" class="container">
    <h1>Agregar Producto</h1>

    <p class="text-center">Completá el formulario con los datos del nuevo producto que deaseas agregar. Cuando esté listo, apretá "Publicar".</p>

    <form action="acciones/crear-producto.php" method="post" enctype="multipart/form-data">
        <div class="row form-fila">
            <label for="nombre">Nombre</label>
            <input type="text"
                   id="nombre"
                   name="nombre"
                   class="form-control"
                   value="<?= $dataForm['nombre'] ?? null; ?>"
                   aria-describedby="<?= isset($errores['nombre']) ? 'error-nombre' : '';?>"
            >
            <?php
            if (isset($errores['nombre'])):
            ?>
            <div id="error-nombre" class="alert-danger text-center"> <span class="visually-hidden"> Error:</span><?= $errores['nombre'];?></div>
            <?php endif;?>
        </div>
        <div class="row form-fila">
            <label for="descripcion">Descripción</label>
            <textarea id="descripcion"
                      name="descripcion"
                      class="form-control"
                      aria-describedby="<?= isset($errores['descripcion']) ? 'error-descripcion' : '';?>"
            ><?= $dataForm['descripcion'] ?? null; ?></textarea>
            <?php
            if (isset($errores['descripcion'])):
            ?>
            <div id="error-descripcion" class="alert-danger text-center"> <span class="visually-hidden"> Error:</span><?= $errores['descripcion'];?></div>
            <?php endif;?>
        </div>
        <div class="row form-fila">
            <label for="precio">Precio</label>
            <input type="number"
                   id="precio"
                   name="precio"
                   class="form-control"
                   value="<?= $dataForm['precio'] ?? null; ?>"
                   aria-describedby="<?= isset($errores['precio']) ? 'error-precio' : '';?>"
            >
            <?php
            if (isset($errores['precio'])):
            ?>
            <div id="error-precio" class="alert-danger text-center"> <span class="visually-hidden"> Error:</span><?= $errores['precio'];?></div>
            <?php endif;?>
        </div>
        <div class="row form-fila">
            <label for="imagen">Imagen</label>
            <input type="file"
                   id="imagen"
                   class="form-control"
                   name="imagen">
            <?php
            if (isset($errores['imagen'])):
            ?>
            <div id="error-imagen" class="alert-danger  text-center"> <span class="visually-hidden"> Error:</span><?= $errores['imagen'];?></div>
            <?php endif;?>
        </div>
        <div class="row form-fila">
            <label for="imagen_descripcion">Descripción de la Imagen</label>
            <input type="text"
                   id="imagen_descripcion"
                   name="imagen_descripcion"
                   class="form-control"
                   value="<?=$dataForm['imagen_descripcion'] ?? null;?>"
                   aria-describedby="<?= isset($errores['imagen_descripcion']) ? 'error-imagen_descripcion' : '';?>"
            >
            <?php
            if (isset($errores['imagen_descripcion'])):
            ?>
                <div id="error-imagen_descripcion" class="alert-danger text-center"> <span class="visually-hidden"> Error:</span><?= $errores['imagen_descripcion'];?></div>
            <?php endif;?>
        </div>
        <div>
        <button class="btn btn-success" type="submit">Publicar</button>
        </div>
    </form>
</section>
