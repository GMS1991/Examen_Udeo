<?php
require_once 'dbmysql.php';

if (isset($_POST['departamento_id'])) {
    $departamento_id = $_POST['departamento_id'];

    $db = new BD();
    $conn = $db->connect();

    $query = "SELECT ID AS value, MUNICIPIO AS text FROM MUNICIPIO WHERE DEPARTAMENTO_ID = ?";
    $stmt = $conn->prepare($query);
    $stmt->execute([$departamento_id]);

    $options = "<option value=''>Selecciona un municipio</option>";
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        $options .= "<option value='{$row['value']}'>{$row['text']}</option>";
    }

    echo $options;
}
?>
