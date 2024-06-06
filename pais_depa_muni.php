<?php
require_once 'db.php';

if (isset($_POST['action'])) {
    $action = $_POST['action'];

    if ($action == 'getDepartments') {
        $countryId = $_POST['countryId'];
        echo getDepartments($countryId);
    } elseif ($action == 'getMunicipalities') {
        $departmentId = $_POST['departmentId'];
        echo getMunicipalities($departmentId);
    }
}

function getOptions($query, $param) {
    $db = new BD();
    $conn = $db->connect();

    $stmt = $conn->prepare($query);
    $stmt->execute([$param]);

    $options = "<option value=''>Selecciona una opción</option>";
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        $options .= "<option value='{$row['value']}'>{$row['text']}</option>";
    }

    return $options;
}

function getDepartments($countryId) {
    $query = "SELECT ID AS value, DEPARTAMENTO AS text FROM DEPARTAMENTO WHERE PAIS_ID = ?";
    return getOptions($query, $countryId);
}

function getMunicipalities($departmentId) {
    $query = "SELECT ID AS value, MUNICIPIO AS text FROM MUNICIPIO WHERE DEPARTAMENTO_ID = ?";
    return getOptions($query, $departmentId);
}
?>
