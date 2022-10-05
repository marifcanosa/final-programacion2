<?php
namespace DaVinci\DB;

use PDO;

class DBConexion
{
   public CONST DB_HOST = '127.0.0.1';
   public CONST DB_USER = 'root';
   public CONST DB_PASS = '';
   public CONST DB_NAME = 'dw3_fernandescanosa_marianela';

    /** @var PDO */
    protected PDO $db;

    public function __construct()
    {
        $dsn = 'mysql:host=' . self::DB_HOST . ';dbname=' . self::DB_NAME . ';charset=utf8mb4';
        $this->db = new PDO($dsn, self::DB_USER, self::DB_PASS);
        $this->db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    }

    /**
     * Obtiene la conexión a la base de datos.
     * @return PDO
     */
   public function getConexion() : PDO {
       return $this->db;
   }

}