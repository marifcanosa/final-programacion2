<?php

use DaVinci\Modelos\Posteos;

$posteos = (new Posteos())->todoPosteos();

?>
<div class="container" id="nosotros">
<h2 class="fondo-titulo">Sobre Nosotros</h2>
<p>Conoce un poco sobre quienes somos y aprende cosas nuevas con nuestros posteos.</p>
</div>
<section class="container" id="mision-vision">
    <div class="row">
    <article  class="blog-texto col-xl-6 col-md-12">
        <div class="text-center">
        <h3 class="titulo-2">Misión</h3>
        <p class="mb-5"> <strong> Somos un emprendimiento que ofrece productos naturales y sustentables, por y para el medioambiente. </strong> Nuestros productos abarcan una amplia variedad de productos sustentables, tanto como para realizar tus cuidados faciales o tu maquillaje diario, como también para implementarlos en tu casa en el sector de la cocina o baño.
           Todos estos productos son totalmente amigables con el medio ambiente y con nuestra salud sobre todo!</p>
            <img src="imgs/mision.jpg" alt="Misión">
        </div>
    </article>
    <article class="blog-texto col-xl-6 col-md-12">
        <div class="text-center">
            <h3 class="titulo-2">Visión</h3>
            <p> Nuestro objetivo mas allá de hacer llegar nuestros productos a las personas y convertirnos cada vez más conocidos, es generar conciencia en la comunidad para que puedan abrir los ojos y descubrir que con simples acciones pueden contribuir a mejorar el medioambiente, generando menos residuos, utilizando productos totalmente de origen natural, eliminando los tóxicos y los envases plásticos, entre otros.
                <strong> Esperamos generar conciencia y aportar nuestro granito de arena al mundo. </strong> </p>
            <img src="imgs/vision.jpg" alt="Visión">
        </div>
    </article>
    </div>
</section>
<section class="container">
    <h3 class="fondo-titulo">Nuestros Posteos</h3>
    <article class="row">
        <?php
        foreach($posteos as $posteo):
            ?>
            <section class="card mb-3">
                <h3><?=$posteo->getTitulo()?></h3>
                <img src="imgs/<?=$posteo->getImagen()?>" class="card-img-top" alt="<?=$posteo->getImagenDescripcion()?>">
                <div class="card-body">
                    <p class="card-text"><?=$posteo->getTexto()?></p>
                </div>
            </section>
        <?php
        endforeach;
        ?>
    </article>
</section>
