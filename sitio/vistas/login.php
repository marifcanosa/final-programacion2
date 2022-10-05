<?php
$dataForm = $_SESSION['data_form'] ?? [];
unset($_SESSION['data_form']);
?>
<section id="login">
    <div class="container">
    <h1 class="mb-1">Ingresar</h1>

    <p class="text-center">Para ingresar es necesario iniciar sesión. Por favor, ingresá tus credenciales de acceso en el formulario.</p>

    <form action="acciones/auth-iniciar-sesion.php" method="post">
        <div class="text-start">
            <label for="email">Email</label>
            <input
                type="email"
                id="email"
                name="email"
                class="form-control"
                value="<?= $dataForm['email'] ?? null;?>"
            >
        </div>
        <div class="text-start">
        <label for="password">Contraseña</label>
        <input type="password" id="password" name="password" class="form-control">
        </div>
        <button id="ingresar" type="submit" class="btn btn-success">Ingresar</button>
    </form>
    </div>
</section>

