<?php

use DaVinci\Modelos\Producto;

$productoFactory = new Producto();

$productos = ($productoFactory)->todo(15);
$paginador = $productoFactory->getPaginador();

?>
<div class="productos container">
<div class="row">
    <div class="col-md-7 col-sm-12">
    <h1>Nuestros Productos</h1>
    <p>Navegá nuestras categorias</p>
    </div>
    <form class="col-md-5 col-sm-12 row" action="index.php" method="get">
        <div class="form-fila col-md-9 col-sm-9">
            <h2 class="visually-hidden"> Buscador</h2>
            <input type="hidden" name="s" value="productos">
            <label for="buscar-titulo">Busca el nombre del producto...</label>
            <input
                    type="search"
                    id="buscar-nombre"
                    name="t"
                    class="form-control"
                    value="<?= $_GET['t'] ?? null;?>"
            >
        </div>
        <div id="buscar-boton" class="col-md-3 col-sm-3">
            <button type="submit" class="btn-success btn">Buscar</button>
        </div>
    </form>
    <div id="categorias">
        <ul class="cate">
            <a class="btn" href="index.php?s=productos"><li>Todo</li></a>
            <a class="btn" href="index.php?s=categoria-detalle&categoria=maquillaje-natural"><li>Maquillaje</li></a>
            <a class="btn" href="index.php?s=categoria-detalle&categoria=cocina-sustentable"><li>Cocina</li></a>
            <a class="btn" href="index.php?s=categoria-detalle&categoria=baño-sustentable"><li>Baño</li></a>
            <a class="btn" href="index.php?s=categoria-detalle&categoria=cuidado-facial"><li>Faciales</li></a>
            <a class="btn" href="index.php?s=categoria-detalle&categoria=aceites-oleos"><li>Oleos</li></a>
            <a class="btn" href="index.php?s=categoria-detalle&categoria=cuidado-bucal"><li>Bucal</li></a>
            <a class="btn" href="index.php?s=categoria-detalle&categoria=gestion-menstrual"><li>Menstrual</li></a>
            <a class="btn" href="index.php?s=categoria-detalle&categoria=varios"><li>Otros</li></a>
        </ul>
    </div>
    <div class="container">
            <div id="resultado" class="row">
                <h2 class="visually-hidden">Resultados</h2>
            <?php
            if(!empty($_GET['t'])):
                $where = $_GET['t'];
                $resultado = $productoFactory->todoBuscador($where);
                foreach ($resultado as $producto):
                $item = $productoFactory->productoPorId($producto[0]);
            ?>
            <div class="card" style="width: 15rem;">
                        <a href="index.php?s=producto-detalle&id=<?=$item->getProductoId();?>"> <img src="imgs/<?= $item->getImagen();?>" class="card-img-top" alt="<?= $item->getNombre();?>"> </a>
                        <div class="card-body">
                            <a href="index.php?s=producto-detalle&id=<?=$item->getProductoId();?>" class="card-text"> <?= $item->getNombre();?> </a>
                            <p>$<?=$item->getPrecio();?></p>
                        </div>
            </div>
            <?php
            endforeach;
            endif;
            ?>
            </div>
    </div>
    <div>
        <p class="mb-1 text-end">Mostrando <?= count($productos);?> de <?= $paginador->getRegistrosTotales();?> productos.</p>
    </div>
    <div id="productosTodos" class="row" >
    <?php
    foreach($productos as $producto):
    ?>
    <div class="card" style="width: 15rem;">
       <a href="index.php?s=producto-detalle&id=<?=$producto->getProductoId();?>"> <img src="imgs/<?= $producto->getImagen();?>" class="card-img-top" alt="<?= $producto->getNombre();?>"> </a>
    <div class="card-body">
       <a href="index.php?s=producto-detalle&id=<?=$producto->getProductoId();?>" class="card-text"> <?= $producto->getNombre();?> </a>
       <p>$<?=$producto->getPrecio();?></p>
    </div>
    </div>
    <?php
    endforeach;
    ?>
    </div>
    <?php
    $paginador->setUrl('?s=productos');
    $paginador->links();
    ?>
</div>
</div>