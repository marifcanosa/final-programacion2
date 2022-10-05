<?php
use DaVinci\Modelos\Producto;

$producto = new Producto();
$categoria = $_GET['categoria'];

$productos = $producto->productosPorCategoria($categoria);

?>
<div class="container productos">
    <h1>Nuestros Productos</h1>
    <p>Navegá nuestras categorias</p>
    <div class="row">
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
</div>