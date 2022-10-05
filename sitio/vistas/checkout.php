<?php
use DaVinci\Modelos\Carrito;

$todosCarrito = (new Carrito())->todosProductos();
$totalPrecio = 0;

$errores  = $_SESSION['errores'] ?? [];
$dataForm = $_SESSION['data_form'] ?? [];

unset($_SESSION['errores'], $_SESSION['data_form']);
?>
<section id="checkout" class="container">
    <h1>Checkout</h1>
    <p>Completa todos los datos del formulario para poder realizar tu pedido correctamente.</p>
    <div class="row">
        <div class="col-md-9">
            <form action="acciones/guardar-pedido.php" method="post">
                <div>
                <h2>Datos de Contacto</h2>
                </div>
                <div class="form-fila">
                    <label for="nombre">Nombre</label>
                    <input
                            type="text"
                            id="nombre"
                            name="nombre"
                            class="form-control"
                            value="<?= $dataForm['nombre'] ?? null;?>"
                            aria-describedby="<?= isset($errores['nombre']) ? 'error-nombre' : '';?>"
                    >
                    <?php
                    if(isset($errores['nombre'])):
                        ?>
                        <div id="error-nombre" class="alert-danger text-center"><span class="visually-hidden">Error: </span><?= $errores['nombre'];?></div>
                    <?php
                    endif;
                    ?>
                </div>
                <div class="form-fila">
                    <label for="apellido">Apellido:</label>
                    <input class="form-control"
                           type="text"
                           id="apellido"
                           name="apellido"
                           value="<?= $dataForm['apellido'] ?? null; ?>"
                           aria-describedby="<?= isset($errores['apellido']) ? 'error-apellido' : '';?>"
                    >
                    <?php
                    if (isset($errores['apellido'])):
                        ?>
                        <div id="error-apellido" class="alert-danger text-center"> <span class="visually-hidden"> Error:</span><?= $errores['apellido'];?></div>
                    <?php endif;?>
                </div>
                <div class="form-fila">
                    <label for="mail">Mail:</label>
                    <input class="form-control"
                           type="email"
                           id="mail"
                           name="mail"
                           value="<?= $dataForm['mail'] ?? null; ?>"
                           aria-describedby="<?= isset($errores['mail']) ? 'error-mail' : '';?>"
                    >
                    <?php
                    if (isset($errores['mail'])):
                        ?>
                        <div id="error-mail" class="alert-danger text-center"> <span class="visually-hidden"> Error:</span><?= $errores['mail'];?></div>
                    <?php endif;?>
                </div>
                <div class="form-fila">
                    <label for="telefono">Telefono:</label>
                    <input class="form-control"
                           type="tel"
                           id="telefono"
                           name="telefono"
                           value="<?= $dataForm['telefono'] ?? null; ?>"
                           aria-describedby="<?= isset($errores['apellido']) ? 'error-apellido' : '';?>"
                    >
                    <?php
                    if (isset($errores['telefono'])):
                        ?>
                        <div id="error-telefono" class="alert-danger text-center"> <span class="visually-hidden"> Error:</span><?= $errores['telefono'];?></div>
                    <?php endif;?>
                </div>
                <div>
                <h2>Método de Entrega</h2>
                <select id="select" name="select" onChange="cambiar()">
                    <option value="value1"> Retiro por Local</option>
                    <option value="value2">Retiro por Correo</option>
                    <option value="value3">Envío por Correo</option>
                </select>
                </div>
                <div id="envio">
                <h2>Datos de Envío</h2>
                <div class="form-fila">
                    <label for="pais">País:</label>
                    <input class="form-control" type="text" id="pais" name="pais">
                </div>
                <div class="form-fila">
                    <label for="provincia">Provincia:</label>
                    <input class="form-control" type="text" id="provincia" name="provincia">
                </div>
                <div class="form-fila">
                    <label for="ciudad">Ciudad:</label>
                    <input class="form-control" type="text" id="ciudad" name="ciudad">
                </div>
                <div class="form-fila">
                    <label for="direccion">Dirección:</label>
                    <input class="form-control" type="text" id="direccion" name="direccion">
                </div>
                <div class="form-fila">
                    <label for="cp">Código Postal:</label>
                    <input class="form-control" type="number" id="cp" name="cp">
                </div>
                </div>
                <div id="pago">
                    <h2>Método de Pago</h2>
                    <select id="select" name="select">
                         <option value="value1">Tarjeta de Debito</option>
                         <option value="value2"> Tarjeta de Crédito</option>
                         <option value="value3"> Efectivo </option>
                    </select>
                    <div class="form-fila">
                       <label for="numero">Número de la Tarjeta:</label>
                       <input class="form-control"
                              type="number"
                              id="numero"
                              name="numero"
                              value="<?= $dataForm['numero'] ?? null; ?>"
                              aria-describedby="<?= isset($errores['numero']) ? 'error-numero' : '';?>"
                        >
                        <?php
                        if (isset($errores['numero'])):
                            ?>
                            <div id="error-numero" class="alert-danger text-center"> <span class="visually-hidden"> Error:</span><?= $errores['numero'];?></div>
                        <?php endif;?>
                    </div>
                    <div class="form-fila">
                        <label for="vencimiento">Fecha de Vencimiento:</label>
                        <input class="form-control"
                               type="number"
                               id="vencimiento"
                               name="vencimiento"
                               value="<?= $dataForm['vencimiento'] ?? null; ?>"
                               aria-describedby="<?= isset($errores['vencimiento']) ? 'error-vencimiento' : '';?>"
                        >
                        <?php
                        if (isset($errores['vencimiento'])):
                            ?>
                            <div id="error-vencimiento" class="alert-danger text-center"> <span class="visually-hidden"> Error:</span><?= $errores['vencimiento'];?></div>
                        <?php endif;?>
                    </div>
                    <div class="form-fila">
                         <label for="codigo">Código de Seguridad:</label>
                         <input class="form-control"
                                type="number"
                                id="codigo"
                                name="codigo"
                                value="<?= $dataForm['codigo'] ?? null; ?>"
                                aria-describedby="<?= isset($errores['codigo']) ? 'error-codigo' : '';?>"
                        >
                        <?php
                        if (isset($errores['codigo'])):
                            ?>
                            <div id="error-codigo" class="alert-danger text-center"> <span class="visually-hidden"> Error:</span><?= $errores['codigo'];?></div>
                        <?php endif;?>
                    </div>
                    <div class="form-fila">
                        <label for="titular">Titular:</label>
                        <input class="form-control"
                               type="text"
                               id="titular"
                               name="titular"
                               value="<?= $dataForm['titular'] ?? null; ?>"
                               aria-describedby="<?= isset($errores['titular']) ? 'error-titular' : '';?>"
                        >
                        <?php
                        if (isset($errores['titular'])):
                            ?>
                            <div id="error-titular" class="alert-danger text-center"> <span class="visually-hidden"> Error:</span><?= $errores['titular'];?></div>
                        <?php endif;?>
                    </div>
                    <div class="form-fila">
                        <label for="dni">DNI del titular:</label>
                        <input class="form-control"
                               type="number"
                               id="dni"
                               name="dni"
                               value="<?= $dataForm['dni'] ?? null; ?>"
                               aria-describedby="<?= isset($errores['dni']) ? 'error-dni' : '';?>"
                        >
                        <?php
                        if (isset($errores['dni'])):
                            ?>
                            <div id="error-dni" class="alert-danger text-center"> <span class="visually-hidden"> Error:</span><?= $errores['dni'];?></div>
                        <?php endif;?>
                    </div>

                </div>
                <div id="finalizar">
                    <button type="submit" class="btn btn-success">FINALIZAR COMPRA</button>
                </div>
            </form>
        </div>
        <div id="resumen" class="col-md-3">
            <div>
            <h3>Productos a comprar:</h3>
            <?php
            foreach($todosCarrito as $item):
                ?>
                <ul>
                    <li><?= $item->getProducto()?> $<?= $item->getPrecio();?></li>
                    <?php $totalPrecio += $item->getPrecio(); ?>
                </ul>
            <?php
            endforeach;
            ?>
            <p>Total a pagar: $<?php echo $totalPrecio ?> </p>
            </div>
        </div>
    </div>
</section>

