<?php
$dataForm = $_SESSION['data_form'] ?? [];
$errores = $_SESSION['errores'] ?? [];

unset($_SESSION['data_form'], $_SESSION['errores']);
?>
<section id="registro">
<div class="container">
    <h1 class="mb-1">Registrarse</h1>
    <p class="lead mb-1">Completá el formulario con tus datos para crear tu cuenta.</p>

    <form action="acciones/auth-registro.php" method="post">
        <div class="form-fila">
            <label for="email">Email</label>
            <input
                type="email"
                id="email"
                name="email"
                class="form-control"
                value="<?= $dataForm['email'] ?? '';?>"
                aria-describedby="<?= isset($errores['email']) ? 'error-email' : '';?>"
            >
            <?php
            if (isset($errores['email'])):
                ?>
                <div id="error-email" class="alert-danger text-center"> <span class="visually-hidden"> Error:</span><?= $errores['email'];?></div>
            <?php endif;?>
        </div>
        <div class="form-fila">
            <label for="nombre">Nombre</label>
            <input
                    type="nombre"
                    id="nombre"
                    name="nombre"
                    class="form-control"
                    value="<?= $dataForm['nombre'] ?? '';?>"
                    aria-describedby="<?= isset($errores['nombre']) ? 'error-nombre' : '';?>"
            >
            <?php
            if (isset($errores['nombre'])):
                ?>
                <div id="error-nombre" class="alert-danger text-center"> <span class="visually-hidden"> Error:</span><?= $errores['nombre'];?></div>
            <?php endif;?>
        </div>
        <div class="form-fila">
            <label for="apellido">Apellido</label>
            <input
                    type="apellido"
                    id="apellido"
                    name="apellido"
                    class="form-control"
                    value="<?= $dataForm['apellido'] ?? '';?>"
                    aria-describedby="<?= isset($errores['apellido']) ? 'error-apellido' : '';?>"
            >
        <?php
        if (isset($errores['apellido'])):
            ?>
            <div id="error-apellido" class="alert-danger text-center"> <span class="visually-hidden"> Error:</span><?= $errores['apellido'];?></div>
        <?php endif;?>
        </div>
        <div class="form-fila">
            <label for="password">Password</label>
            <input
                type="password"
                id="password"
                name="password"
                class="form-control"
                value="<?= $dataForm['password'] ?? '';?>"
                aria-describedby="<?= isset($errores['password']) ? 'error-password' : '';?>"
            >
            <?php
            if (isset($errores['password'])):
                ?>
                <div id="error-password" class="alert-danger text-center"> <span class="visually-hidden"> Error:</span><?= $errores['password'];?></div>
            <?php endif;?>
        </div>
        <div class="form-fila">
            <label for="password_confirmar">Confirmar Password</label>
            <input
                type="password"
                id="password_confirmar"
                name="password_confirmar"
                class="form-control"
                value="<?= $dataForm['password_confirmar'] ?? '';?>"
                aria-describedby="<?= isset($errores['password_confirmar']) ? 'error-password_confirmar' : '';?>"
            >
            <?php
            if (isset($errores['password_confirmar'])):
                ?>
                <div id="error-password_confirmar" class="alert-danger text-center"> <span class="visually-hidden"> Error:</span><?= $errores['password_confirmar'];?></div>
            <?php endif;?>
        </div>
        <button type="submit" class="btn btn-success">Crear cuenta</button>
    </form>
</div>
</section>