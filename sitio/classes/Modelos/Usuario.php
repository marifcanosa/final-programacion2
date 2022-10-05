<?php

namespace DaVinci\Modelos;

use DaVinci\DB\DBConexion;
use PDO;

class Usuario
{
    protected int    $usuario_id;
    protected string $email;
    protected string $password;
    protected string $nombre;
    protected string $apellido;
    protected int    $rol_fk;

    /**
     * La funcion que retorna todos los usuarios registrados.
     * @return array|Usarios[]  La lista de usuarios.
     */

    public function todosUsuarios()
    {
        $db = (new DBConexion())->getConexion();
        $query = "SELECT * FROM usuarios";

        $stmt = $db->prepare($query);
        $stmt->execute();
        $stmt->setFetchMode(PDO::FETCH_CLASS, self::class);
        return $stmt->fetchAll();
    }

    public function traerPorId(int $id): ?self
    {
        $db = (new DBConexion())->getConexion();
        $query = "SELECT * FROM usuarios
                WHERE usuario_id = ?";
        $stmt = $db->prepare($query);
        $stmt->execute([$id]);
        $stmt->setFetchMode(PDO::FETCH_CLASS, self::class);
        $usuario = $stmt->fetch();

        return $usuario ? $usuario : null;
    }

    public function traerPorEmail(string $email): ?Usuario
    {
        $db = (new DBConexion())->getConexion();
        $query = "SELECT * FROM usuarios
                WHERE email = ?";
        $stmt = $db->prepare($query);
        $stmt->execute([$email]);
        $stmt->setFetchMode(PDO::FETCH_CLASS, self::class);

        $usuario = $stmt->fetch();

        return $usuario ? $usuario : null;
    }

    /**
     * Crea un nuevo usuario.
     *
     * @param array $data
     * @return void
     */
    public function crear(array $data)
    {
        $db = (new DBConexion())->getConexion();
        $query = "INSERT INTO usuarios (email, nombre, apellido, password, rol_fk) 
                VALUES (:email, :nombre, :apellido, :password, :rol_fk)";
        $db->prepare($query)->execute([
            'email'     => $data['email'],
            'nombre'    => $data['nombre'],
            'apellido'  => $data['apellido'],
            'password'  => $data['password'],
            'rol_fk'    => $data['rol_fk'],
        ]);
    }

    /**
     * @return int
     */
    public function getUsuarioId(): int
    {
        return $this->usuario_id;
    }

    /**
     * @param int $usuario_id
     */
    public function setUsuarioId(int $usuario_id): void
    {
        $this->usuario_id = $usuario_id;
    }

    /**
     * @return string
     */
    public function getEmail(): string
    {
        return $this->email;
    }

    /**
     * @param string $email
     */
    public function setEmail(string $email): void
    {
        $this->email = $email;
    }

    /**
     * @return string
     */
    public function getPassword(): string
    {
        return $this->password;
    }

    /**
     * @param string $password
     */
    public function setPassword(string $password): void
    {
        $this->password = $password;
    }

    /**
     * @return string
     */
    public function getNombre(): string
    {
        return $this->nombre;
    }

    /**
     * @param string $nombre
     */
    public function setNombre(string $nombre): void
    {
        $this->nombre = $nombre;
    }

    /**
     * @return string
     */
    public function getApellido(): string
    {
        return $this->apellido;
    }

    /**
     * @param string $apellido
     */
    public function setApellido(string $apellido): void
    {
        $this->apellido = $apellido;
    }

    /**
     * @return int
     */
    public function getRolFk(): int
    {
        return $this->rol_fk;
    }
}
