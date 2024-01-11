<?php
// Archivo: obtener_regiones.php

// Realizar la conexión a la base de datos (ajusta según tus credenciales)
$conexion = mysqli_connect("localhost", "root", "", "sistema_votacion");


if ($conexion) {
    // Consulta SQL para obtener las regiones
    $query = "SELECT id,nombre FROM regiones";

    // Ejecutar la consulta
    $result = mysqli_query($conexion, $query);

    // Obtener los resultados como un array asociativo
    $regiones = mysqli_fetch_all($result, MYSQLI_ASSOC);

    // Devolver los resultados como JSON
    echo json_encode($regiones);

    // Cerrar la conexión a la base de datos
    mysqli_close($conexion);
} else {
    // Si hay un error de conexión, devolver un mensaje de error
    echo json_encode(array('error' => 'Error de conexión a la base de datos.'));
}
?>
