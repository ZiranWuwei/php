# php-form
postulación desis.

Desarrollar un Sistema de Votación. La interfaz deberá validar y
guardar los datos del formulario en una base de datos.

Las tecnologías a utilizar serán:
• HTML
La interfaz se deberá desarrollar con HTML utilizando estructuras estándar.
• PHP
El desarrollo del aplicativo debe estar programado con PHP limpio, sin framework u
otro.
• JavaScript / Ajax
Para la conexión entre el HTML y PHP se deberán generar funciones en Javascript. 
• BASE DE DATOS
 MySQL.
La interfaz deberá tener los campos como se ve en la imagen:
FORMULARIO DE VOTACIÓN:
Versión 2023-02-20
Para dudas pruebadev@desis.cl.

VALIDACIONES:
• Nombre y Apellido: No debe quedar en Blanco.
• Alias: Validar que la cantidad de caracteres sea mayor a 5 y que contenga letras y
números.
• RUT: Deberá Validar el RUT (Formato Chile).
• Email: Deberá validar el correo según estándar.
• Los Combo Box Región y Comuna deben cargar los datos desde Base de Datos. No
deberán quedar en blanco y entre los combos debe existir relación Región->Comuna.
• El Combo Box Candidato debe cargar los datos desde Base de Datos.
• Checkbox “Como se enteró de Nosotros”: Debe elegir al menos dos opciones.
• Se debe validar la duplicación de votos por RUT.

##Versión
Apache/2.4.58 (Win64) OpenSSL/3.1.3 PHP/8.2.12
Versión del cliente de base de datos: libmysql - mysqlnd 8.2.12
extensión PHP: mysqli Documentación curl Documentación mbstring Documentación
Versión de PHP: 8.2.12

## Requisitos para implementar el proyecto.

- [XAMPP](https://www.apachefriends.org/index.html) instalado en tu máquina.
- Visual Studio Code.
- Git.

## Instalación y Configuración

1. Buscar la dirección de intalación de XAMPP.
2. Abrir la carpeta en XAMPP htdocs.
3. Clona el repositorio en tu máquina local en la carpeta htdocs o arrastrala luego de clonar :

   ```bash
   git clone https://github.com/ZiranWuwei/php-form.git
   
4. Abrir XAMPP y habilitar Apache y Mysql al darle "start" para habilitar los puertos.
5. Abrir http://localhost/phpmyadmin/index.php en el navegador.
6. importar archivo de base de datos sistema_votacion.sql
7. Luego de importar la base de datos y que el archivo php-form se encuentre en la carpeta xampp/htdocs abrir enlace http://localhost/php-form/
