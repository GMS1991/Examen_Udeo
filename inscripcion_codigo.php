<?php

require_once 'db.php';



function Insertar($datos)
{
    $db = new BD();
    $conn = $db->connect();

    $consulta = '{call SP_ALTA_INSCRIPCION(?,?,?,?,?,?,?,?,?,?)}';
    $parametros = [
        $datos['cui'],
        $datos['nombres'],
        $datos['apellidos'],
        $datos['fecha_nacimiento'],
        $datos['telefono'],
        $datos['pais'],
        $datos['depa'],
        $datos['muni'],
        $datos['direccion'],
        $datos['diver'],
        $datos['carrera'],
        $datos['jornada']
    ];

    $db->executeQuery($consulta,$parametros);
}

function Actualizar($datos)
{

    $db = new BD();
    $conn = $db->connect();

    $consulta = '{call SP_CAMBIO_INSCRIPCION(?,?,?,?,?,?,?,?,?,?)}';
    $parametros = [
        $datos['idinscripcion'],
        $datos['cui'],
        $datos['nombres'],
        $datos['apellidos'],
        $datos['fecha_nacimiento'],
        $datos['telefono'],
        $datos['pais'],
        $datos['depa'],
        $datos['muni'],
        $datos['direccion'],
        $datos['diver'],
        $datos['carrera'],
        $datos['jornada']
    ];

    $db->executeQuery($consulta,$parametros);
}


function Eliminar($datos)
{

    $db = new BD();
    $conn = $db->connect();

    $consulta = '{call SP_BAJA_INSCRIPCION(?,?,?,?,?,?,?,?,?,?)}';
    $parametros = [
        $datos['idinscripcion']
    ];

    $db->executeQuery($consulta,$parametros);
}



// Manejo de la solicitud
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $action = $_POST['action'];
    $data = $_POST;

    try {
        if ($action == 'insert') {
            Insertar($datos);
            echo 'Datos insertados correctamente.';
        } elseif ($action == 'update') {
            Actualizar($datos);
            echo 'Datos actualizados correctamente.';
        } elseif ($action == 'delete') {
            Eliminar($datos);
            echo 'Datos eliminados correctamente.';
        } else {
            throw new Exception('Acción no válida.');
        }
    } catch (Exception $e) {
        echo 'Error: ' . $e->getMessage();
    }
}

