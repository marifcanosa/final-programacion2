<?php

namespace DaVinci\Modelos;

use DaVinci\DB\DBConexion;
use DaVinci\Paginacion\Paginador;
use PDO;
use PDOException;

class Producto
{
    protected int    $producto_id;
    protected string $nombre;
    protected string $descripcion;
    protected float  $precio;
    protected string $imagen;
    protected string $imagen_descripcion;
    protected string $categoria;

    protected Paginador $paginador;

    /**
     * La funcion que retorna todos los productos cargados.
     * @param array $where
     * @param int $registrosPorPagina
     * @return array|Producto[]  La lista de los productos.
     */

    public function todo(int $registrosPorPagina = 10): array
    {
        $db = (new DBConexion())->getConexion();

        $this->paginador = new Paginador($registrosPorPagina);

        $query = "SELECT * FROM productos
                  LIMIT {$this->paginador->getRegistrosPorPagina()} 
                  OFFSET {$this->paginador->getRegistroInicial()};";

        $stmt = $db->prepare($query);
        $stmt->execute();
        $stmt->setFetchMode(PDO::FETCH_CLASS, self::class);

        $queryCount = "SELECT COUNT(*) AS 'total' FROM productos;";
        $stmtCount = $db->prepare($queryCount);
        $stmtCount->execute();
        $fila = $stmtCount->fetch();
        $this->paginador->setRegistrosTotales($fila['total']);

        return $stmt->fetchAll();
    }

    /**
     * @param int $id
     * @return Producto|null
     */

    public function productoPorId(int $id): ?Producto
    {
        $db = (new DBConexion())->getConexion();
        $query = "SELECT * FROM productos 
                  WHERE producto_id = ?";
        $stmt = $db->prepare($query);
        $stmt->execute([$id]);
        $stmt->setFetchMode(PDO::FETCH_CLASS, self::class);
        $producto = $stmt->fetch();

        if (!$producto) {
            return null;
        }
        return $producto;
    }

    public function getProductoId(): ?int
    {
        return $this->producto_id;
    }

    public function getNombre(): ?string
    {
        return $this->nombre;
    }

    /**
     * @return string|null
     */
    public function getDescripcion(): ?string
    {
        return $this->descripcion;
    }

    public function getPrecio(): ?int
    {
        return $this->precio;
    }

    /**
     * @return string|null
     */
    public function getImagen(): ?string
    {
        return $this->imagen;
    }

    /**
     * @return string|null
     */
    public function getImagenDescripcion(): ?string
    {
        return $this->imagen_descripcion;
    }

    /**
     * @return string|null
     */
    public function getCategoria(): ?string
    {
        return $this->categoria;
    }

    /** Se crea la funcion crear que añade un nuevo producto a la base de datos.
     * Si da error se lanza una PDOException
     * @param array $data
     * @return void
     * @throws PDOException
     * @throws \Exception
     */
    public function crear(array $data)
    {
        $db = (new DBConexion())->getConexion();
        $db->beginTransaction();
        try {
            $query = "INSERT INTO productos (Usuarios_usuario_id, nombre, descripcion, precio, imagen, imagen_descripcion)
                  VALUES (:Usuarios_usuario_id, :nombre, :descripcion, :precio, :imagen, :imagen_descripcion);";
            $stmt = $db->prepare($query);
            $stmt->execute([
                'Usuarios_usuario_id' => $data['Usuarios_usuario_id'],
                'nombre'              => $data['nombre'],
                'descripcion'         => $data['descripcion'],
                'precio'              => $data['precio'],
                'imagen'              => $data['imagen'],
                'imagen_descripcion'  => $data['imagen_descripcion'],

            ]);
            $db->commit();
        } catch (\Exception $e) {
            $db->rollBack();
            throw $e;
        }

    }

    /**
     *Elimina un producto
     * @return void
     * @throws PDOException
     * @throws \Exception
     */
    public function eliminar(): void
    {
        $db = (new DBConexion())->getConexion();
        $db->beginTransaction();
        try {
            $query = "DELETE FROM productos
                  WHERE producto_id = ?";
            $db->prepare($query)->execute([$this->getProductoId()]);
            $db->commit();
        } catch (\Exception $e) {
            $db->rollBack();
            throw $e;
        }
    }

    /**
     * Edita el producto
     * @return void
     * @throws \Exception
     */
    public function editar(array $data): void
    {
        $db = (new DBConexion())->getConexion();
        $db->beginTransaction();
        try {
            $query = "UPDATE productos
                  SET Usuarios_usuario_id = :Usuarios_usuario_id,
                      nombre              = :nombre,
                      descripcion         = :descripcion,
                      precio              = :precio,
                      imagen              = :imagen,
                      imagen_descripcion  = :imagen_descripcion
                  WHERE producto_id = :producto_id";
            $db->prepare($query)->execute([
                'producto_id'         => $this->getProductoId(),
                'Usuarios_usuario_id' => $data['Usuarios_usuario_id'],
                'nombre'              => $data['nombre'],
                'descripcion'         => $data['descripcion'],
                'precio'              => $data['precio'],
                'imagen'              => $data['imagen'],
                'imagen_descripcion'  => $data['imagen_descripcion'],
            ]);
            $db->commit();
        } catch (\Exception $e) {
            $db->rollBack();
            throw $e;
        }
    }

    public function productosPorCategoria(string $categoria)
    {
        $db = (new DBConexion())->getConexion();
        $query = "SELECT * FROM productos 
                  WHERE categoria = ?";
        $stmt = $db->prepare($query);
        $stmt->execute([$categoria]);
        $stmt->setFetchMode(PDO::FETCH_CLASS, self::class);
        return $stmt->fetchAll();
    }

    /**
     * @return Paginador
     */
    public function getPaginador(): Paginador
    {
        return $this->paginador;
    }

    public function todoBuscador(string $busqueda) {
        $db = (new DBConexion())->getConexion();
        $query = "SELECT * FROM productos WHERE nombre LIKE '%$busqueda%' ";
        $stmt = $db->prepare($query);
        $stmt->execute();
        return $stmt->fetchAll();
    }
}