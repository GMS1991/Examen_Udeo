<?php
require_once 'dbmysql.php';

if (isset($_POST['pais_id'])) {
    $pais_id = $_POST['pais_id'];

    $db = new BD();
    $conn = $db->connect();

    $query = "SELECT ID AS value, DEPARTAMENTO AS text FROM DEPARTAMENTO WHERE PAIS_ID = ?";
    $stmt = $conn->prepare($query);
    $stmt->execute([$pais_id]);

    $options = "<option value=''>Selecciona un departamento</option>";
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        $options .= "<option value='{$row['value']}'>{$row['text']}</option>";
    }

    echo $options;
}
?>
