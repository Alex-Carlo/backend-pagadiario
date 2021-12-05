-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-07-2020 a las 01:33:11
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.2.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pagadiario`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app`
--

CREATE TABLE `app` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `token` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `app`
--

INSERT INTO `app` (`id`, `nombre`, `token`) VALUES
(1, 'api', '123apirest');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tcliente`
--

CREATE TABLE `tcliente` (
  `id` int(11) NOT NULL,
  `id_estado` int(11) NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `telefono` varchar(80) NOT NULL,
  `correo` varchar(120) DEFAULT NULL,
  `direccion` varchar(80) DEFAULT NULL,
  `ruta` varchar(80) DEFAULT NULL,
  `cedula` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tcliente`
--

INSERT INTO `tcliente` (`id`, `id_estado`, `nombre`, `telefono`, `correo`, `direccion`, `ruta`, `cedula`) VALUES
(9, 2, 'Alex', '321012', 'sadas@gmail.com', 'sdusawe', 'millan', 100042),
(10, 2, 'Carlos Duran', '3215384559', 'carlos@gmail.com', 'corozal', 'ospina peres', 100054),
(11, 2, 'Isidro Carlo', '3142552746', 'isidro@gmail.com', 'br millan', 'sampues', 10047791),
(12, 2, 'Nersaida Morelo', '3216666066', 'nersaida@gmail.com', 'millan', 'sampues', 493781),
(13, 1, 'ysysy', '64676', 'hahsh', 'Hshhd', 'Jwjsj', 6464),
(14, 1, 'José Ángel ', '3178589501', 'ujja@gm.com', 'Jsksu', 'HHhs', 10055488),
(15, 1, 'fany castro', '3022826054', 'alancamo@gma.com', 'Cr 22', 'Carmen', 1056374),
(16, 1, 'Raúl velilla', '3014529483', 'ksksks@gm.com', 'Sampues', 'Sampues', 16407564),
(17, 1, 'yassir', '3016882320', 'yul.com', 'Millan', 'Millan', 10005637),
(18, 1, 'María Angélica ', '3135920872', 'dkdk.com', 'Cass', 'Sincelejo ', 106547831),
(19, 1, '', '', '', '', '', 0),
(20, 1, 'Ruben Montesv', '3113368425', 'rube.com', 'Dg 43 cr12', 'Mercedes ', 321456987),
(21, 1, 'Valeria ', '3205751227', 'val.com', 'CR 22 24d', 'Sincelejo ', 10005);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `tcliente_tprestamo`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `tcliente_tprestamo` (
`cliente` int(11)
,`cuota` int(11)
,`totalPagar` float
,`telefono` varchar(80)
,`id` int(11)
,`ncuotas` int(11)
,`nombre` varchar(80)
,`fecha_final` varchar(90)
,`valor` int(11)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `testado`
--

CREATE TABLE `testado` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `testado`
--

INSERT INTO `testado` (`id`, `nombre`) VALUES
(1, 'Lista Negra'),
(2, 'Activo'),
(3, 'Inactivo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tganancias`
--

CREATE TABLE `tganancias` (
  `id` int(11) NOT NULL,
  `id_prestamo` int(11) NOT NULL,
  `ganacias` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tperiodopago`
--

CREATE TABLE `tperiodopago` (
  `id` int(11) NOT NULL,
  `nombre` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tperiodopago`
--

INSERT INTO `tperiodopago` (`id`, `nombre`) VALUES
(1, 'Semanal'),
(2, 'Diario'),
(4, 'Mensual'),
(5, 'Quincenal');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tprestamo`
--

CREATE TABLE `tprestamo` (
  `id` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `valor` int(11) NOT NULL,
  `fecha_final` varchar(90) NOT NULL,
  `tasa_interes` float NOT NULL,
  `id_Periodopago` int(11) NOT NULL,
  `cuota` int(11) NOT NULL,
  `totalPagar` float NOT NULL,
  `plazo` int(11) NOT NULL,
  `ncuotas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tprestamo`
--

INSERT INTO `tprestamo` (`id`, `id_cliente`, `valor`, `fecha_final`, `tasa_interes`, `id_Periodopago`, `cuota`, `totalPagar`, `plazo`, `ncuotas`) VALUES
(46, 9, 100000, '', 10, 1, 1512500, 12100000, 2, 0),
(47, 9, 100000, '2020-31-31', 0.1, 1, 13750, 68750, 2, 0),
(48, 17, 100000, '2020-31-31', 0.1, 1, 13750, 96250, 2, 0),
(49, 10, 200000, '2020-30-30', 0.1, 1, 18333, 201667, 3, 0),
(50, 18, 300000, '2020-31-31', 0.05, 1, 39375, 275625, 2, 0),
(51, 9, 100000, '2020-31-31', 0.1, 4, 110000, 110000, 1, 0),
(52, 14, 100000, '6/28/2020 12:00:00 a. m.', 0.1, 2, 1220, 142750, 4, 0),
(53, 17, 250000, '28/06/2020', 0.1, 2, 3697, 329053, 3, 0),
(54, 17, 100000, '***', 0.1, 2, 160, 180, 2, 3),
(57, 9, 2000000, '28/06/2020', 0.05, 1, 192937, 2701130, 3, 14),
(58, 20, 150000, '28/06/2020', 0.1, 5, 151590, 14401000, 48, 96),
(59, 21, 100000, '28/06/2020', 0.05, 2, 1837, 108413, 2, 60);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ttransaccion`
--

CREATE TABLE `ttransaccion` (
  `id` bigint(20) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `pago` int(11) NOT NULL,
  `comenteario` varchar(80) NOT NULL,
  `fecha_pago` varchar(80) DEFAULT NULL,
  `id_prestamo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ttransaccion`
--

INSERT INTO `ttransaccion` (`id`, `id_cliente`, `pago`, `comenteario`, `fecha_pago`, `id_prestamo`) VALUES
(11, 9, 13750, 'Pago', '2020-27-27', 47),
(12, 9, 13750, 'Pago', '2020-27-27', 47),
(13, 9, 13750, 'Psho', '2020-27-27', 47),
(14, 17, 13750, 'Pago', '2020-27-27', 48),
(15, 10, 18333, 'Pago', '2020-27-27', 49),
(16, 18, 39375, 'Pago', '2020-27-27', 50),
(17, 14, 1220, 'Pago', '6/28/2020 12:00:00 a. m.', 52),
(18, 14, 1220, 'Hh', '29/06/2020', 52),
(19, 14, 1220, 'Pago Efectuado ', '6/28/2020 12:00:00 a. m.', 52),
(20, 17, 3697, 'Pago Efectuado', '28/06/2020', 53),
(21, 9, 0, 'Estimado cliente, le informamos que se atraso en el pago', '28/06/2020', 46),
(22, 17, 0, 'Estimado cliente, le informamos que se atraso en el pago', '28/06/2020', 54),
(23, 17, 0, 'Estimado cliente, le informamos que se atraso en el pago', '28/06/2020', 54),
(24, 9, 0, 'Estimado cliente, le informamos que se atraso en el pago', '28/06/2020', 57),
(25, 9, 0, 'Estimado cliente, le informamos que se atraso en el pago', '28/06/2020', 57),
(26, 20, 151590, 'Pago Efectuado', '28/06/2020', 58),
(27, 21, 1837, 'Pago Efectuado', '28/06/2020', 59);

--
-- Disparadores `ttransaccion`
--
DELIMITER $$
CREATE TRIGGER `dValor` AFTER INSERT ON `ttransaccion` FOR EACH ROW UPDATE tprestamo SET totalPagar=totalPagar-NEW.Pago WHERE id=NEW.id_prestamo
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `email` varchar(80) NOT NULL,
  `usuario` varchar(80) NOT NULL,
  `contra` varchar(80) NOT NULL,
  `id_rol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre`, `email`, `usuario`, `contra`, `id_rol`) VALUES
(1, 'thy', 'tty', 'tgh', 'hhh', 0);

-- --------------------------------------------------------

--
-- Estructura para la vista `tcliente_tprestamo`
--
DROP TABLE IF EXISTS `tcliente_tprestamo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tcliente_tprestamo`  AS  select `tcliente`.`id` AS `cliente`,`tprestamo`.`cuota` AS `cuota`,`tprestamo`.`totalPagar` AS `totalPagar`,`tcliente`.`telefono` AS `telefono`,`tprestamo`.`id` AS `id`,`tprestamo`.`ncuotas` AS `ncuotas`,`tcliente`.`nombre` AS `nombre`,`tprestamo`.`fecha_final` AS `fecha_final`,`tprestamo`.`valor` AS `valor` from (`tcliente` join `tprestamo` on(`tcliente`.`id` = `tprestamo`.`id_cliente`)) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `app`
--
ALTER TABLE `app`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tcliente`
--
ALTER TABLE `tcliente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_estado` (`id_estado`);

--
-- Indices de la tabla `testado`
--
ALTER TABLE `testado`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tganancias`
--
ALTER TABLE `tganancias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_prestamo` (`id_prestamo`);

--
-- Indices de la tabla `tperiodopago`
--
ALTER TABLE `tperiodopago`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tprestamo`
--
ALTER TABLE `tprestamo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tprestamo_ibfk_1` (`id_cliente`),
  ADD KEY `tprestamo_ibfk_2` (`id_Periodopago`);

--
-- Indices de la tabla `ttransaccion`
--
ALTER TABLE `ttransaccion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_prestamo` (`id_prestamo`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `app`
--
ALTER TABLE `app`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tcliente`
--
ALTER TABLE `tcliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `testado`
--
ALTER TABLE `testado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tganancias`
--
ALTER TABLE `tganancias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tperiodopago`
--
ALTER TABLE `tperiodopago`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tprestamo`
--
ALTER TABLE `tprestamo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT de la tabla `ttransaccion`
--
ALTER TABLE `ttransaccion`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tcliente`
--
ALTER TABLE `tcliente`
  ADD CONSTRAINT `tcliente_ibfk_1` FOREIGN KEY (`id_estado`) REFERENCES `testado` (`id`);

--
-- Filtros para la tabla `tganancias`
--
ALTER TABLE `tganancias`
  ADD CONSTRAINT `tganancias_ibfk_1` FOREIGN KEY (`id_prestamo`) REFERENCES `tprestamo` (`id`);

--
-- Filtros para la tabla `tprestamo`
--
ALTER TABLE `tprestamo`
  ADD CONSTRAINT `tprestamo_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `tcliente` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tprestamo_ibfk_2` FOREIGN KEY (`id_Periodopago`) REFERENCES `tperiodopago` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `ttransaccion`
--
ALTER TABLE `ttransaccion`
  ADD CONSTRAINT `ttransaccion_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `tcliente` (`id`),
  ADD CONSTRAINT `ttransaccion_ibfk_2` FOREIGN KEY (`id_prestamo`) REFERENCES `tprestamo` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
