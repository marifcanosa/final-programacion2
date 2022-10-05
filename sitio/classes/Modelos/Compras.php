<?php

namespace DaVinci\Modelos;

use DaVinci\DB\DBConexion;
use PDO;
use PDOException;

class Compras
{
    protected int    $compra_id;
    protected string $productos;
    protected int    $total;
    protected string $cliente;
    protected string $mail_cliente;
    protected int    $Usuarios_usuario_id;

    public function getCompraId(): int
    {
        return $this->compra_id;
    }

    public function getProducto(): string
    {
        return $this->productos;
    }

    public function getPrecioTotal(): int
    {
        return $this->total;
    }

    public function getCliente(): string
    {
        return $this->cliente;
    }

    public function getMailCliente(): string
    {
        return $this->mail_cliente;
    }

    public function getUsuarioId(): int
    {
        return $this->Usuarios_usuario_id;
    }

    /**
     * @param int $id
     * @return Compras|null
     */

    public function compraPorId(int $id): ?Compras
    {
        $db = (new DBConexion())->getConexion();
        $query = "SELECT * FROM compras 
                  WHERE compra_id = ?";
        $stmt = $db->prepare($query);
        $stmt->execute([$id]);
        $stmt->setFetchMode(PDO::FETCH_CLASS, self::class);
        $compra = $stmt->fetch();

        if (!$compra) {
            return null;
        }
        return $compra;
    }

    /**
     * La funcion que retorna todas las comprar realizadas.
     * @return array|Compras[]  Las compras.
     */

    public function todoPedidos(): array
    {
        $db = (new DBConexion())->getConexion();
        $query = "SELECT * FROM compras";

        $stmt = $db->prepare($query);
        $stmt->execute();
        $stmt->setFetchMode(PDO::FETCH_CLASS, self::class);
        return $stmt->fetchAll();
    }

    public function agregarCompra(array $data) {
        $db = (new DBConexion())->getConexion();
        $query = "INSERT INTO compras (productos, cliente, total, mail_cliente) 
                VALUES (:productos, :cliente, :total, :mail_cliente)";
        $db->prepare($query)->execute([
            'productos'      => $data['productos'],
            'cliente'        => $data['cliente'],
            'total'          => $data['total'],
            'mail_cliente'   => $data['mail_cliente'],
        ]);
    }

    /**
     * @param string $mail_cliente
     * @return Compras|null
     */

    public function pedidosPorCliente(string $mail_cliente)
    {
        $db = (new DBConexion())->getConexion();
        $query = "SELECT * FROM compras
                  WHERE mail_cliente = ?";

        $stmt = $db->prepare($query);
        $stmt->execute([$mail_cliente]);
        $stmt->setFetchMode(PDO::FETCH_CLASS, self::class);
        $compras = $stmt->fetchAll();

        if (!$compras) {
            return null;
        }
        return $compras;
    }
}