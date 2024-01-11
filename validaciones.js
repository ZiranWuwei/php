// Archivo: validaciones.js

// Función para validar que una cadena no esté en blanco
function validarNombreyApellido(valor) {
    if (valor.trim() === '') {
        alert("Tanto el nombre como el apellido no pueden quedar vacíos.");
        return false;
    }
    return true;
}


// Función para validar el alias (debe tener al menos 6 caracteres y contener letras y al menos un número)
function validarAlias(alias) {
    const regex = /^[a-zA-Z0-9]{6,}$/;
    if (!regex.test(alias)) {
        alert("El alias debe tener al menos 6 caracteres alfanuméricos, incluyendo al menos una letra y un número.");
        return false;
    }
    return true;
}


function validarRut(rut) {
    // Verificar que el RUT tenga el formato correcto (números con puntos y guión)
    const regex = /^(\d{1,3}(\.\d{3})*\-\d{1})$/;

    if (!regex.test(rut)) {
        console.error("Formato de RUT inválido:", rut);
        alert("Ingrese un RUT válido en formato chileno con puntos y guion.");
        return false;
    }

    // Verificar si el RUT ya existe en la base de datos
    const xhr = new XMLHttpRequest();
    xhr.open('POST', 'verificar_rut.php', false);
    xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    xhr.send('rut=' + encodeURIComponent(rut));

    if (xhr.status === 200) {
        const respuesta = JSON.parse(xhr.responseText);

        if (respuesta.existe) {
            console.error("RUT ya existe en la base de datos:", rut);
            alert("El RUT ingresado ya existe en la base de datos.");
            return false;
        }
    } else {
        console.error("Error al verificar RUT en la base de datos.");
        alert("Error al verificar el RUT en la base de datos.");
        return false;
    }

    return true;
}



// Función para validar el correo electrónico según estándar
function validarEmail(email) {
    const regex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
    if (!regex.test(email)) {
        alert("Ingrese un correo electrónico válido.");
        return false;
    }
    return true;
}


// Función para validar que al menos dos checkboxes están seleccionados
function validarCheckboxSeleccionados(checkboxes) {
    const seleccionados = Array.from(checkboxes).map(checkbox => checkbox.checked ? 1 : 0);
    
    console.log("Número de checkboxes seleccionados:", seleccionados.reduce((a, b) => a + b, 0));

    if (seleccionados.reduce((a, b) => a + b, 0) < 2) {
        alert("Debe seleccionar al menos dos opciones.");
        return false;
    }
    
    return true;
}





function validarFormulario() {
    const nombre = document.getElementById('nombre').value;
    const apellido = document.getElementById('apellido').value;
    const alias = document.getElementById('alias').value;
    const rut = document.getElementById('rut').value;
    const email = document.getElementById('email').value;
    const checkboxesComoSeEntero = document.querySelectorAll('[name^="enterado_"]:checked');

    console.log("Función validarFormulario llamada.");

    const result =
        validarNombreyApellido(nombre, "Por favor, ingrese su nombre.") &&
        validarNombreyApellido(apellido, "Por favor, ingrese su apellido.") &&
        validarAlias(alias) &&
        validarRut(rut) &&
        validarEmail(email) &&
        validarCheckboxSeleccionados(checkboxesComoSeEntero);

    console.log("Resultado de la validación:", result);

    return result;
}

