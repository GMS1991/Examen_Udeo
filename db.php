<?php
class BD {
    private $serverName = 'GERSONMATIAS'; 
    private $database = 'udeo'; 
    private $username = 'sa'; 
    private $password = 'Gerson@1991'; 
    private $conn;

    // Conexión a la base de datos
    public function connect() {
        $this->conn = null;

        try {
            $connectionInfo = array("Database" => $this->database, "UID" => $this->username, "PWD" => $this->password);
            $this->conn = sqlsrv_connect($this->serverName, $connectionInfo);

            if ($this->conn === false) {
                throw new Exception("No se pudo conectar a la base de datos.");
            }
        } catch(Exception $e) {
            echo 'Error de Conexión: ' . $e->getMessage();
        }

        return $this->conn;
    }

    public function executeQuery($query, $params) {
        $stmt = sqlsrv_prepare($this->conn, $query, $params);
        if (!$stmt) {
            throw new Exception("Error al preparar la consulta.");
        }
        if (!sqlsrv_execute($stmt)) {
            throw new Exception("Error al ejecutar la consulta.");
        }
        return $stmt;
    }
}
