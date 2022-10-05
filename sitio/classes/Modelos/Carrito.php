<?php

namespace DaVinci\Modelos;

use DaVinci\DB\DBConexion;
use PDO;
use PDOException;

class Carrito
{
    protected int    $id_carrito;
    protected string $producto;
    protected int    $precio;
    protected string $imagen;
    protected string $imagen_descripcion;

    /**
     * La funcion que retorna todos los productos del carrito.
     * @return array|Carrito[]  La lista de los productos del carrito.
     */

    public function todosProductos(): array
    {
        $db = (new DBConexion())->getConexion();
        $query = "SELECT * FROM carrito";

        $stmt = $db->prepare($query);
        $stmt->execute();
        $stmt->setFetchMode(PDO::FETCH_CLASS, self::class);
        return $stmt->fetchAll();
    }

    /**
     * La funcion que agrega un item al carrito
     */

    public function getCarritoId(): int
    {
        return $this->id_carrito;
    }

    public function agregarItem(array $data)
    {
        $db = (new DBConexion())->getConexion();
        $query = "INSERT INTO carrito (producto, precio, imagen, imagen_descripcion) 
                VALUES (:producto, :precio, :imagen, :imagen_descripcion)";
        $db->prepare($query)->execute([
            'producto'            => $data['producto'],
            'precio'              => $data['precio'],
            'imagen'              => $data['imagen'],
            'imagen_descripcion'  => $data['imagen_descripcion'],
        ]);
    }

    /**
     * La funcion que elimina un item del carrito
     */

    public function eliminarItem($id)
    {
        $db = (new DBConexion())->getConexion();
        $query = "DELETE FROM carrito
                  WHERE id_carrito = ?";
        $db->prepare($query)->execute([$id]);
    }

    public function vaciarCarrito()
    {
        $db = (new DBConexion())->getConexion();
        $query = "DELETE FROM carrito";
        $stmt = $db->prepare($query);
        $stmt->execute();
        $stmt->setFetchMode(PDO::FETCH_CLASS, self::class);
        return $stmt->fetchAll();
    }

    public function getProducto(): ?string
    {
        return $this->producto;
    }

    public function getPrecio(): ?int
    {
        return $this->precio;
    }

    public function getImg(): ?string
    {
        return $this->imagen;
    }

    public function getImgDescripcion(): ?string
    {
        return $this->imagen_descripcion;
    }
}