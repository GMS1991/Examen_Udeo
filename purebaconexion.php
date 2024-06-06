<?php
require_once 'conexion.php';


$con = new Conexion() ; 

if($con->getConexion() != null)
{
    echo "conexion exitosa gm";
}
else{
    echo "error al conectarse a la base de datos";
}
 
