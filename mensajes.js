// mensajes.js

// Función para manejar la respuesta del formulario
function manejarRespuesta(respuesta) {
    var mensajeElemento = document.getElementById('mensaje');

    if (mensajeElemento) {
        try {
            var respuestaJson = JSON.parse(respuesta);

            if (respuestaJson.success) {
                // Éxito
                mensajeElemento.innerHTML = '<div class="mensaje-exito">' + respuestaJson.message + '</div>';
            } else {
                // Error
                mensajeElemento.innerHTML = '<div class="mensaje-error">' + respuestaJson.message + '</div>';
            }
        } catch (error) {
            // Si no se puede parsear como JSON, mostrar el texto directamente
            mensajeElemento.innerHTML = '<div class="mensaje-error">' + respuesta + '</div>';
        }
    } else {
        console.error('Elemento con id "mensaje" no encontrado.');
    }
}

// Código para manejar la respuesta después de enviar el formulario
document.addEventListener('DOMContentLoaded', function () {
    var formulario = document.getElementById('formulario');

    if (formulario) {
        formulario.addEventListener('submit', function (event) {
            event.preventDefault(); // Evitar el envío normal del formulario

            // Realiza tu lógica para enviar el formulario mediante Ajax, por ejemplo, con fetch o XMLHttpRequest
            var xhr = new XMLHttpRequest();
            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4) {
                    if (xhr.status === 200) {
                        var respuesta = xhr.responseText;
                        manejarRespuesta(respuesta);

                        // Si la respuesta indica éxito, mostrar alerta, recargar la página y vaciar los campos
                        var respuestaJson = JSON.parse(respuesta);
                        if (respuestaJson.success) {
                            alert(respuestaJson.message);
                            location.reload(); // Recargar la página
                        }
                    }
                }
            };

            // Resto del código para enviar el formulario con XMLHttpRequest
            xhr.open('POST', 'procesar_voto.php', true);
            xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
            xhr.send(new URLSearchParams(new FormData(formulario)));
 
        });
    } else {
        console.error('Formulario no encontrado.');
    }
});
