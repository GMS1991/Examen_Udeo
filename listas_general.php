<?php
require_once 'db.php';

function getOptions($consulta) {
    $db = new BD();
    $conn = $db->connect();
    
    $stmt = $conn->prepare($consulta);
    $stmt->execute();
    
    $options = "";
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        $options .= "<option value='{$row['value']}'>{$row['text']}</option>";
    }
    
    return $options;
}


function getCarreras() {
    $query = "SELECT ID AS value, LICENCIATURA AS text FROM LICENCIATURA";
    return getOptions($query);
}

function getDiversificados() {
    $query = "SELECT ID AS value, DIVERSIFICADO AS text FROM DIVERSIFICADO";
    return getOptions($query);
}

function getJornadas() {
    $query = "SELECT ID AS value, JORNADA AS text FROM JORNADA";
    return getOptions($query);
}



