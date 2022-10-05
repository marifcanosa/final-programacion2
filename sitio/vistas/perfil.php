<?php
use DaVinci\Modelos\Compras;
use DaVinci\Auth\Autenticacion;

$compras = new Compras();
$usuario = (new Autenticacion())->getUsuario();

$mail_usuario = $usuario->getEmail();
$pedidos = $compras->todoPedidos();
$pedidosCliente = $compras->pedidosPorCliente($mail_usuario);

?>
<section class="container">
    <h1 class="mb-1">Mi Perfil</h1>

    <?php
    if($usuario->getRolFk() === 1):
    ?>
        <div id="perfil"><a href="panel-admin/index.php?s=panel">Acceder al panel de administración</a></div>
    <?php
    endif;
    ?>

    <dl id="datos">
        <dt>Email</dt>
        <dd><?= $mail_usuario ;?></dd>
        <dt>Nombre</dt>
        <dd><?= $usuario->getNombre() ?? 'No especificado';?></dd>
        <dt>Apellido</dt>
        <dd><?= $usuario->getApellido() ?? 'No especificado';?></dd>
    </dl>

    <?php
    if($usuario->getRolFk() === 2):
    ?>
    <h2>Mis Pedidos</h2>
    <?php
    if($pedidosCliente == null):
    ?>
    <p class="text-center">Aún no has realizado pedidos.</p>
    <?php
    endif;
    ?>
    <?php
    if($pedidosCliente != null):
    ?>
    <table class="table">
        <thead>
        <tr>
            <th>ID Compra</th>
            <th>Productos</th>
            <th>Total</th>
        </tr>
        </thead>
        <tbody>
    <?php
       foreach($pedidosCliente as $item):
    ?>
            <tr>
                <td><?= $item->getCompraId();?></td>
                <td><?= $item->getProducto()?></td>
                <td>$<?= $item->getPrecioTotal();?></td>
            </tr>
    <?php
    endforeach;
    endif;
    ?>
        </tbody>
    </table>
    <?php
    endif;
    ?>
</section>
