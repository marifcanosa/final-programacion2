<?php
use DaVinci\Modelos\Compras;
$compra = new Compras();

$todosPedidos = $compra->todoPedidos();

?>

<section class="container text-center">
    <h1>Pedidos</h1>
    <p class="mensajes">Pedidos de los clientes:</p>
    <table class="table">
        <thead>
        <tr>
            <th>ID Compra</th>
            <th>Cliente</th>
            <th>Mail del Cliente</th>
            <th>Productos</th>
            <th>Total</th>
        </tr>
        </thead>
    <tbody>
    <?php
    foreach($todosPedidos as $item):
        ?>
        <tr>
            <td><?= $item->getCompraId();?></td>
            <td><?= $item->getCliente();?></td>
            <td><?= $item->getMailCliente();?></td>
            <td><?= $item->getProducto()?></td>
            <td>$<?= $item->getPrecioTotal();?></td>
        </tr>
    <?php
    endforeach;
    ?>
    </tbody>
    </table>
</section>
