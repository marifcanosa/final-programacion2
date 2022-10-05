<?php
use DaVinci\Modelos\Carrito;

$todosCarrito = (new Carrito())->todosProductos();
$totalPrecio = 0;
?>
<section class="container">
    <h1>Carrito</h1>
    <?php
    if ($todosCarrito == null):
    ?>
    <p class="fs-5 text-center"> No hay productos en tu carrito.</p>
    <p class="text-center"> <a class="btn btn-outline-dark fs-5" href="index.php?s=productos"> ¡Conocé nuestros productos y agregalos aca! </a> </p>
    <?php
    endif;
    ?>
    <?php
    if (count($todosCarrito) !== 0):
    ?>
        <div class="container">
            <form id="vaciar" action="acciones/vaciar-carrito.php" method="post">
                <button class="btn btn-danger">Vaciar Carrito</button>
            </form>
        </div>
        <table class="table">
            <thead>
            <tr>
                <th>Imagen</th>
                <th>Producto</th>
                <th>Precio</th>
                <th>Acciones</th>
            </tr>
            </thead>
            <tbody>
            <?php
            foreach($todosCarrito as $item):
                ?>
                <tr>
                    <td><img src="<?= "imgs/" . $item->getImg();?>" alt="<?= $item->getImgDescripcion();?>" style="width: 10rem;"></td>
                    <td><?= $item->getProducto()?></td>
                    <td><?= $item->getPrecio();?></td>
                    <td><form action="acciones/eliminar-carrito.php?id=<?= $item->getCarritoId()?>" method="post">
                            <button class="alert-danger btn">Eliminar</button>
                        </form></td>
                </tr>
                <?php $totalPrecio += $item->getPrecio(); ?>
            <?php
            endforeach;
            ?>
            </tbody>
        </table>
        <hr>
        <div class="container" id="total">
            <p>Total: $<?php echo $totalPrecio ?> </p>
            <a href="index.php?s=checkout" class="btn btn-success">INICIAR COMPRA</a>
        </div>
    <?php
    endif;
    ?>
</section>
