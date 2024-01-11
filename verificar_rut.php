<?php
header("Content-Type: application/json");

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['rut'])) {
    // Conectar a la base de datos
    $conexion = new mysqli("localhost", "root", "", "sistema_votacion");

    if ($conexion->connect_error) {
        echo json_encode(array('error' => 'Error de conexión a la base de datos.'));
        exit();
    }

    // Obtener el RUT enviado por la solicitud
    $rut = $_POST['rut'];

    // Consultar la base de datos para verificar si el RUT ya existe
    $consulta = $conexion->prepare("SELECT COUNT(*) as count FROM Votos WHERE rut = ?");
    $consulta->bind_param("s", $rut);
    $consulta->execute();
    $resultado = $consulta->get_result();

    // Obtener el resultado de la consulta
    $fila = $resultado->fetch_assoc();

    // Responder con un JSON indicando si el RUT existe o no
    echo json_encode(array('existe' => ($fila['count'] > 0)));

    // Cerrar la conexión a la base de datos
    $consulta->close();
    $conexion->close();
} else {
    // Si la solicitud no es POST o no se proporcionó el RUT, responder con un código de estado no permitido
    http_response_code(405);
    echo json_encode(array('error' => 'Método no permitido.'));
}
?>
