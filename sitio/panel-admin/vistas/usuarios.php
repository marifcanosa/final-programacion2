<?php
use DaVinci\Modelos\Usuario;
$usuarios = (new Usuario())->todosUsuarios();

?>

<section class="container text-center">
    <h1>Usuarios Registrados</h1>
    <table class="table">
        <thead>
        <tr>
            <th>ID Usuario</th>
            <th>Email</th>
            <th>Nombre</th>
            <th>Apellido</th>
            <th>Rol</th>
        </tr>
        </thead>
        <tbody>
        <?php
        foreach($usuarios as $item):
            ?>
            <tr>
                <td><?= $item->getUsuarioId();?></td>
                <td><?= $item->getEmail();?></td>
                <td><?= $item->getNombre();?></td>
                <td><?= $item->getApellido()?></td>
                <td><?= $item->getRolFk();?></td>
            </tr>
        <?php
        endforeach;
        ?>
        </tbody>
    </table>
</section>
