<?php
class BD {
    private $host = "localhost";
    private $dbname = "UDEO";
    private $username = "root";
    private $password = "";
    private $conn;

    public function __construct() {
        $dsn = "mysql:host=$this->host;dbname=$this->dbname;charset=utf8";
        try {
            $this->conn = new PDO($dsn, $this->username, $this->password);
            $this->conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        } catch (PDOException $e) {
            die("Conexión fallida: " . $e->getMessage());
        }
    }

    public function connect() {
        return $this->conn;
    }

    public function executeQuery($consulta, $parametros) {
        try {
            $stmt = $this->conn->prepare($consulta);
            $stmt->execute($parametros);
            return $stmt;
        } catch (PDOException $e) {
            die("Error en la consulta: " . $e->getMessage());
        }
    }
}