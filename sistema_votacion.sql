-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-01-2024 a las 18:23:33
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sistema_votacion`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `candidatos`
--

CREATE TABLE `candidatos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `candidatos`
--

INSERT INTO `candidatos` (`id`, `nombre`) VALUES
(1, 'Sebastián Piñera'),
(2, 'Michelle Bachelet'),
(3, 'Sebastián Piñera'),
(4, 'Alejandro Guillier'),
(5, 'Evelyn Matthei'),
(6, 'Marco Enríquez-Ominami'),
(7, 'José Antonio Kast'),
(8, 'Beatriz Sánchez'),
(9, 'Carolina Goic'),
(10, 'Ricardo Lagos'),
(11, 'José Piñera'),
(12, 'François Hollande');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comunas`
--

CREATE TABLE `comunas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `id_region` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `comunas`
--

INSERT INTO `comunas` (`id`, `nombre`, `id_region`) VALUES
(111, 'Iquique', 1),
(112, 'Alto Hospicio', 1),
(113, 'Pozo Almonte', 1),
(114, 'Antofagasta', 2),
(115, 'Mejillones', 2),
(116, 'Tocopilla', 2),
(117, 'Copiapó', 3),
(118, 'Vallenar', 3),
(119, 'Huasco', 3),
(120, 'La Serena', 4),
(121, 'Coquimbo', 4),
(122, 'Illapel', 4),
(123, 'Valparaíso', 5),
(124, 'Viña del Mar', 5),
(125, 'Quillota', 5),
(126, 'Santiago', 6),
(127, 'Puente Alto', 6),
(128, 'Maipú', 6),
(129, 'Rancagua', 7),
(130, 'Machalí', 7),
(131, 'San Fernando', 7),
(132, 'Chillán', 8),
(133, 'Bulnes', 8),
(134, 'Yungay', 8),
(135, 'Concepción', 9),
(136, 'Talcahuano', 9),
(137, 'Los Ángeles', 9),
(138, 'Temuco', 10),
(139, 'Padre Las Casas', 10),
(140, 'Angol', 10),
(141, 'Valdivia', 11),
(142, 'La Unión', 11),
(143, 'Paillaco', 11),
(144, 'Puerto Montt', 12),
(145, 'Osorno', 12),
(146, 'Castro', 12),
(147, 'Coyhaique', 13),
(148, 'Puerto Aysén', 13),
(149, 'Chile Chico', 13),
(150, 'Punta Arenas', 14),
(151, 'Puerto Natales', 14),
(152, 'Porvenir', 14),
(153, 'Cabo de Hornos', 14),
(154, 'Arica', 15),
(155, 'Putre', 15),
(156, 'General Lagos', 15);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `regiones`
--

CREATE TABLE `regiones` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `regiones`
--

INSERT INTO `regiones` (`id`, `nombre`) VALUES
(1, 'Tarapacá'),
(2, 'Antofagasta'),
(3, 'Atacama'),
(4, 'Coquimbo'),
(5, 'Valparaíso'),
(6, 'Región Metropolitana de Santiago'),
(7, 'Región del Libertador General Bernardo OHiggins'),
(8, 'Región del Maule'),
(9, 'Ñuble'),
(10, 'Biobío'),
(11, 'La Araucanía'),
(12, 'Los Ríos'),
(13, 'Los Lagos'),
(14, 'Aysén del General Carlos Ibáñez del Camp'),
(15, 'Magallanes y de la Antártica Chilena');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `votos`
--

CREATE TABLE `votos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `alias` varchar(20) NOT NULL,
  `rut` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `id_region` int(11) NOT NULL,
  `id_comuna` int(11) NOT NULL,
  `id_candidato` int(11) NOT NULL,
  `enterado_web` tinyint(1) DEFAULT NULL,
  `enterado_tv` tinyint(1) DEFAULT NULL,
  `enterado_redes` tinyint(1) DEFAULT NULL,
  `enterado_amigo` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `votos`
--

INSERT INTO `votos` (`id`, `nombre`, `apellido`, `alias`, `rut`, `email`, `id_region`, `id_comuna`, `id_candidato`, `enterado_web`, `enterado_tv`, `enterado_redes`, `enterado_amigo`) VALUES
(39, 'Miguel', 'Ravelo', 'mravelo', '26.144.767-3', 'mig.ravelom@gmail.com', 5, 124, 6, 1, 1, 0, 0),
(40, 'Miguel', 'Ravelo', 'mravelo', '26.144.757-3', 'mig.ravelom@gmail.com', 4, 120, 5, 1, 1, 0, 0),
(41, 'Miguel', 'Ravelo', 'mravelo', '1.123.456-7', 'mig.ravelom@gmail.com', 11, 142, 10, 1, 1, 0, 0),
(42, 'Miguel', 'Ravelo', 'mravelo', '1.123.416-7', 'mig.ravelom@gmail.com', 12, 145, 7, 1, 1, 0, 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `candidatos`
--
ALTER TABLE `candidatos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `comunas`
--
ALTER TABLE `comunas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_region` (`id_region`);

--
-- Indices de la tabla `regiones`
--
ALTER TABLE `regiones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `votos`
--
ALTER TABLE `votos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_region` (`id_region`),
  ADD KEY `id_comuna` (`id_comuna`),
  ADD KEY `id_candidato` (`id_candidato`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `candidatos`
--
ALTER TABLE `candidatos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `comunas`
--
ALTER TABLE `comunas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=157;

--
-- AUTO_INCREMENT de la tabla `regiones`
--
ALTER TABLE `regiones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `votos`
--
ALTER TABLE `votos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comunas`
--
ALTER TABLE `comunas`
  ADD CONSTRAINT `comunas_ibfk_1` FOREIGN KEY (`id_region`) REFERENCES `regiones` (`id`);

--
-- Filtros para la tabla `votos`
--
ALTER TABLE `votos`
  ADD CONSTRAINT `votos_ibfk_1` FOREIGN KEY (`id_region`) REFERENCES `regiones` (`id`),
  ADD CONSTRAINT `votos_ibfk_2` FOREIGN KEY (`id_comuna`) REFERENCES `comunas` (`id`),
  ADD CONSTRAINT `votos_ibfk_3` FOREIGN KEY (`id_candidato`) REFERENCES `candidatos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
