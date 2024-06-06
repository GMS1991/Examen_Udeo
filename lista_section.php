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
    } elseif ($action == 'getCountries') {
        echo getCountries();
    }
}

function getOptions($query, $param = null) {
    $db = new BD();
    $conn = $db->connect();

    $stmt = $conn->prepare($query);
    if ($param) {
        $stmt->execute([$param]);
    } else {
        $stmt->execute();
    }

    $options = "<option value=''>Selecciona una opción</option>";
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        $options .= "<option value='{$row['value']}'>{$row['text']}</option>";
    }

    return $options;
}

function getCountries() {
    $query = "SELECT ID AS value, PAIS AS text FROM PAIS";
    return getOptions($query);
}

function getDepartments($countryId) {
    $query = "SELECT ID AS value, DEPARTAMENTO AS text FROM DEPARTAMENTO WHERE IDPAIS = ?";
    return getOptions($query, $countryId);
}

function getMunicipalities($departmentId) {
    $query = "SELECT ID AS value, MUNICIPIO AS text FROM MUNICIPIO WHERE IDDEPARTAMENTO = ?";
    return getOptions($query, $departmentId);
}
?>
