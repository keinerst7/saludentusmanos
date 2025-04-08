-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-04-2025 a las 15:21:11
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
-- Base de datos: `salud_en_ tu _manos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividadesfisicas`
--

CREATE TABLE `actividadesfisicas` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `tipoactividad` varchar(100) NOT NULL,
  `duracionminutos` int(11) NOT NULL,
  `intensidad` enum('baja','media','alta','') NOT NULL,
  `calorias_quemadas` int(11) NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `actividadesfisicas`
--

INSERT INTO `actividadesfisicas` (`id`, `usuario_id`, `tipoactividad`, `duracionminutos`, `intensidad`, `calorias_quemadas`, `fecha_registro`) VALUES
(1, 2, 'cardio', 15, 'media', 150, '2025-04-01 12:43:20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dispositivo_salud`
--

CREATE TABLE `dispositivo_salud` (
  `id_dispositivo` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `nombre_dispositivo` varchar(250) NOT NULL,
  `tipo_dispositivo` varchar(250) NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfil_usuarios`
--

CREATE TABLE `perfil_usuarios` (
  `id_perfil` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `foto_perfil` varchar(255) NOT NULL,
  `biografia` text NOT NULL,
  `ubicacion` varchar(100) NOT NULL,
  `genero` enum('masculino','femenino','otro','') NOT NULL,
  `objetivos_salud` text NOT NULL,
  `condiciones_medicas` text NOT NULL,
  `preferencias_alimentarias` text NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `perfil_usuarios`
--

INSERT INTO `perfil_usuarios` (`id_perfil`, `usuario_id`, `foto_perfil`, `biografia`, `ubicacion`, `genero`, `objetivos_salud`, `condiciones_medicas`, `preferencias_alimentarias`, `fecha_creacion`) VALUES
(1010, 1, '', 'alguien fitness y cuidadoso', 'CR 30 # 26-76', 'masculino', 'Crecer en mi bienestar saludable mediante rutinas saludables de alimentacion', 'N/A', 'Frutas ricas naturales', '2025-04-01 15:51:13'),
(1020, 2, '', 'inteligente, aprendiz y social', 'calle 20 #20-20', 'masculino', 'tener buen fisico y bienestar', 'N/A', 'Sopas, ensaladas y jugos', '2025-04-01 12:26:19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL COMMENT 'Fecha de nacimiento del usuario',
  `correo` varchar(100) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `metodo_registro` enum('email','google','facebook','apple') NOT NULL,
  `id_social` varchar(250) DEFAULT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `fecha_nacimiento`, `correo`, `contrasena`, `metodo_registro`, `id_social`, `fecha_registro`) VALUES
(1, 'luis perez', '1989-05-07', 'luispz23@gmail.com', '123456789', 'email', NULL, '2025-03-17 19:50:49'),
(2, 'fray', '1999-03-03', 'fray2323@gmail.com', 'fray12345', 'email', 'fray_111', '2025-04-01 12:21:23');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actividadesfisicas`
--
ALTER TABLE `actividadesfisicas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `dispositivo_salud`
--
ALTER TABLE `dispositivo_salud`
  ADD PRIMARY KEY (`id_dispositivo`);

--
-- Indices de la tabla `perfil_usuarios`
--
ALTER TABLE `perfil_usuarios`
  ADD PRIMARY KEY (`id_perfil`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `actividadesfisicas`
--
ALTER TABLE `actividadesfisicas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `dispositivo_salud`
--
ALTER TABLE `dispositivo_salud`
  MODIFY `id_dispositivo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `perfil_usuarios`
--
ALTER TABLE `perfil_usuarios`
  MODIFY `id_perfil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1021;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1123;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `actividadesfisicas`
--
ALTER TABLE `actividadesfisicas`
  ADD CONSTRAINT `actividadesfisicas_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `perfil_usuarios`
--
ALTER TABLE `perfil_usuarios`
  ADD CONSTRAINT `perfil_usuarios_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
