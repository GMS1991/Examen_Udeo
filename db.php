<?php
class BD {
    private $serverName = "DESKTOP-H50TBC6\\SQLGWMS"; // Nota la doble barra invertida
    private $database = "UDEO";
    private $username = "sa";
    private $password = "Gerson@1991";
    private $conn;

    public function __construct() {
        $dsn = "sqlsrv:Server=$this->serverName;Database=$this->database";
        try {
            $this->conn = new PDO($dsn, $this->username, $this->password);
            // Establecer el modo de error de PDO a excepción
            $this->conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            echo "Conexión establecida.<br />";
        } catch (PDOException $e) {
            echo "Conexión fallida: " . $e->getMessage() . "<br />";
            die();
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

// Para usar la clase y probar la conexión
$db = new BD();
