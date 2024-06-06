<?php
require_once 'dbmysql.php';

function getPaises() {
    $db = new BD();
    $conn = $db->connect();

    $query = "SELECT ID AS value, PAIS AS text FROM PAIS";
    $stmt = $conn->prepare($query);
    $stmt->execute();

    $options = "<option value=''>Selecciona un país</option>";
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        $options .= "<option value='{$row['value']}'>{$row['text']}</option>";
    }

    return $options;
}

echo getPaises();
?>
