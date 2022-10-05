<?php

namespace DaVinci\Paginacion;


class PaginadorLinks
{
    public function __construct(Paginador $paginador)
    {
        require_once __DIR__ . '/../../vistas-parciales/paginador.php';
    }
}
