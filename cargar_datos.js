// Archivo: cargar_datos.js

document.addEventListener('DOMContentLoaded', function () {
    cargarRegiones();
});

// Función para cargar las regiones en el combo de regiones
function cargarRegiones() {
    // Realizar una solicitud AJAX al servidor para obtener las regiones
    fetch('obtener_regiones.php')
        .then(response => response.json())
        .then(regiones => {
            // Obtener el elemento select de regiones
            const selectRegion = document.getElementById('region');

            // Limpiar las opciones actuales
            selectRegion.innerHTML = '';

            // Agregar la opción predeterminada
            const defaultOption = document.createElement('option');
            defaultOption.value = '';
            defaultOption.text = 'Seleccionar';
            selectRegion.appendChild(defaultOption);

            // Iterar sobre las regiones y agregarlas al combo
            regiones.forEach(region => {
                const option = document.createElement('option');
                option.value = region.id;
                option.text = region.nombre;
                selectRegion.appendChild(option);
            });

            // Agregar un evento 'change' al select de regiones para cargar comunas cuando se selecciona una región
            selectRegion.addEventListener('change', cargarComunas);
        })
        .catch(error => {
            console.error('Error al cargar regiones:', error);
        });
}

// Función para cargar las comunas en el combo de comunas
function cargarComunas() {
    const regionId = document.getElementById('region').value;

    // Verificar si se seleccionó una región
    if (regionId) {
        // Realizar una solicitud Ajax para obtener las comunas de la región seleccionada
        fetch(`obtener_comunas.php?region=${regionId}`)
            .then(response => response.json())
            .then(data => {
                // Obtener el elemento select de comunas
                const comunaSelect = document.getElementById('comuna');

                // Limpiar las opciones antiguas
                comunaSelect.innerHTML = '';

                // Agregar una opción por defecto
                const defaultOption = document.createElement('option');
                defaultOption.value = '';
                defaultOption.text = 'Seleccione una comuna';
                comunaSelect.appendChild(defaultOption);

                // Llenar el combo de comunas con los datos obtenidos
                data.forEach(comuna => {
                    const option = document.createElement('option');
                    option.value = comuna.id;
                    option.text = comuna.nombre;  // Ajustar aquí al nombre correcto de la columna
                    comunaSelect.appendChild(option);
                });
            })
            .catch(error => console.error('Error al cargar comunas:', error));
    } else {
        // Limpiar el combo de comunas si no se seleccionó una región
        const comunaSelect = document.getElementById('comuna');
        comunaSelect.innerHTML = '<option value="" selected disabled>Seleccione una región primero</option>';
    }
}



// Llamar a la función para cargar regiones cuando la página se carga inicialmente
document.addEventListener('DOMContentLoaded', cargarRegiones);


function cargarCandidatos() {
    // Realizar una solicitud AJAX al servidor para obtener las regiones
    fetch('obtener_candidatos.php')
        .then(response => response.json())
        .then(candidatos => {
            // Obtener el elemento select de regiones
            const selectCandidato = document.getElementById('candidato');

            // Limpiar las opciones actuales
            selectCandidato.innerHTML = '';

            // Agregar la opción predeterminada
            const defaultOption = document.createElement('option');
            defaultOption.value = '';
            defaultOption.text = 'Seleccionar';
            selectCandidato.appendChild(defaultOption);

            // Iterar sobre los candidatos y agregarlas al combo
            candidatos.forEach(candidato => {
                const option = document.createElement('option');
                option.value = candidato.id;
                option.text = candidato.nombre;
                selectCandidato.appendChild(option);
            });
        })
        .catch(error => {
            console.error('Error al cargar candidatos:', error);
        });
}

document.addEventListener('DOMContentLoaded', cargarCandidatos);