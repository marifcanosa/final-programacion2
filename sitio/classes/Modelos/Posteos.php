<?php

namespace DaVinci\Modelos;

use DaVinci\DB\DBConexion;
use PDO;
use PDOException;

class Posteos
{
    protected int    $posteo_id;
    protected string $titulo;
    protected string $texto;
    protected string $imagen;
    protected string $imagen_descripcion;

    /**
     * La funcion que retorna todos los productos cargados.
     * @return array|Producto[]  La lista de los productos.
     */

    public function todoPosteos(): array
    {
        $db = (new DBConexion())->getConexion();
        $query = "SELECT * FROM posteos";

        $stmt = $db->prepare($query);
        $stmt->execute();
        $stmt->setFetchMode(PDO::FETCH_CLASS, self::class);
        return $stmt->fetchAll();
    }

    public function getPosteoId(): ?int
    {
        return $this->posteo_id;
    }

    public function getTitulo(): ?string
    {
        return $this->titulo;
    }

    public function getTexto(): ?string
    {
        return $this->texto;
    }

    public function getImagen(): ?string
    {
        return $this->imagen;
    }

    public function getImagenDescripcion(): ?string
    {
        return $this->imagen_descripcion;
    }
}

