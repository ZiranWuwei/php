<?php
header("Cache-Control: no-cache, must-revalidate");
header('Access-Control-Allow-Methods: POST');

// Verificar si la solicitud es de tipo POST y proviene de Ajax
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['ajax_request'])) {
    // Resto del código para procesar el formulario
    try {
        $conexion = new mysqli("localhost", "root", "", "sistema_votacion");

        if ($conexion->connect_error) {
            throw new Exception("Error de conexión a la base de datos.");
        }

        // Obtener los datos del formulario
        $nombre = $_POST['nombre'];
        $apellido = $_POST['apellido'];
        $alias = $_POST['alias'];
        $rut = $_POST['rut'];
        $email = $_POST['email'];
        $id_region = $_POST['region'];
        $id_comuna = $_POST['comuna'];
        $id_candidato = $_POST['candidato'];
        $enterado_web = isset($_POST['enterado_web']) ? 1 : 0;
        $enterado_tv = isset($_POST['enterado_tv']) ? 1 : 0;
        $enterado_redes = isset($_POST['enterado_redes']) ? 1 : 0;
        $enterado_amigo = isset($_POST['enterado_amigo']) ? 1 : 0;

        // Verificar si ya existe un RUT igual en la tabla Votos
        if (existeRut($conexion, $rut)) {
            echo json_encode(array('error' => 'Ya existe un voto con este RUT. Solo se permite un voto por persona.'));
        } else {
            // Insertar los datos en la base de datos si la validación es exitosa
            if (validarDatos($nombre, $apellido, $alias, $rut, $email, $id_region, $id_comuna, $id_candidato, $enterado_web, $enterado_tv, $enterado_redes, $enterado_amigo)) {
                // Preparar la consulta SQL para insertar en la tabla Votos
                $query = "INSERT INTO Votos (nombre, apellido, alias, rut, email, id_region, id_comuna, id_candidato, enterado_web, enterado_tv, enterado_redes, enterado_amigo)
                          VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

                $stmt = $conexion->prepare($query);

                if (!$stmt) {
                    throw new Exception("Error al preparar la consulta.");
                }

                $stmt->bind_param("sssssiissiii", $nombre, $apellido, $alias, $rut, $email, $id_region, $id_comuna, $id_candidato, $enterado_web, $enterado_tv, $enterado_redes, $enterado_amigo);

                if (!$stmt->execute()) {
                    throw new Exception("Error al insertar en la base de datos.");
                }

                echo json_encode(array('success' => true, 'message' => 'Voto registrado exitosamente.'));
            } else {
                echo json_encode(array('error' => 'Datos no válidos.', 'message' => 'Error al procesar el voto.'));
            }
        }
    } catch (Exception $e) {
        echo json_encode(array('error' => $e->getMessage(), 'message' => 'Error al procesar el voto.'));
    } finally {
        // Cerrar la conexión a la base de datos
        if ($conexion) {
            $conexion->close();
        }
    }
} else {
    // Si la solicitud no es POST o no proviene de Ajax, responder con un código de estado no permitido
    http_response_code(405);
    echo json_encode(array('error' => 'Método no permitido', 'message' => 'Error al procesar el voto.'));
}

// Función para validar los datos
function validarDatos($nombre, $apellido, $alias, $rut, $email, $id_region, $id_comuna, $id_candidato, $enterado_web, $enterado_tv, $enterado_redes, $enterado_amigo) {
    // Implementar las validaciones necesarias
    // Devolver true si los datos son válidos, false si no lo son
    // Puedes implementar tus propias reglas de validación aquí
    return true;  // Cambia esto según tus necesidades de validación
}

// Función para verificar si existe un RUT en la tabla Votos
function existeRut($conexion, $rut) {
    $query = "SELECT COUNT(*) as count FROM Votos WHERE rut = ?";
    $stmt = $conexion->prepare($query);

    if (!$stmt) {
        throw new Exception("Error al preparar la consulta.");
    }

    $stmt->bind_param("s", $rut);

    if (!$stmt->execute()) {
        throw new Exception("Error al ejecutar la consulta.");
    }

    $result = $stmt->get_result();
    $row = $result->fetch_assoc();

    return $row['count'] > 0;
}
?>
