<?php
// Archivo: obtener_comunas.php

if (isset($_GET['region'])) {
    // Obtener el ID de la región desde la solicitud
    $regionId = $_GET['region'];

    // Realizar la conexión a la base de datos (ajusta según tus credenciales)
    $conexion = mysqli_connect("localhost", "root", "", "sistema_votacion");

    if ($conexion) {
        // Consulta SQL para obtener las comunas de la región seleccionada
        $query = "SELECT DISTINCT id, nombre FROM comunas WHERE id_region = $regionId";

        // Ejecutar la consulta
        $result = mysqli_query($conexion, $query);

        // Verificar si se obtuvieron resultados
        if ($result) {
            // Obtener los resultados como un array asociativo
            $comunas = mysqli_fetch_all($result, MYSQLI_ASSOC);

            // Devolver los resultados como JSON
            echo json_encode($comunas);
        } else {
            // Si hay un error en la consulta, devolver un mensaje de error
            echo json_encode(array('error' => 'Error en la consulta de comunas.'));
        }

        // Cerrar la conexión a la base de datos
        mysqli_close($conexion);
    } else {
        // Si hay un error de conexión, devolver un mensaje de error
        echo json_encode(array('error' => 'Error de conexión a la base de datos.'));
    }
} else {
    // Si no se proporcionó el ID de la región en la solicitud, devolver un mensaje de error
    echo json_encode(array('error' => 'ID de región no proporcionado.'));
}
?>
