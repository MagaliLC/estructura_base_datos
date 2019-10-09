-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-10-2019 a las 12:20:39
-- Versión del servidor: 10.4.6-MariaDB
-- Versión de PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `optician`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `brand`
--

CREATE TABLE `brand` (
  `id_brand` int(11) NOT NULL,
  `provider_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `brand`
--

INSERT INTO `brand` (`id_brand`, `provider_id`, `name`) VALUES
(1, 1, 'Ray-Ban'),
(2, 1, 'Gucci'),
(3, 2, 'Pepe Jeans'),
(4, 2, 'Oakley');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `customer`
--

CREATE TABLE `customer` (
  `id_customer` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `registration_date` date NOT NULL,
  `recommendation_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `customer`
--

INSERT INTO `customer` (`id_customer`, `name`, `address`, `phone`, `email`, `registration_date`, `recommendation_id`) VALUES
(1, 'Ana Pérez', 'c/ Pelai, 2,\r\n3-3\r\nBarcelona', '66524578', 'ana@gmail.com', '2019-10-02', 2),
(2, 'Alfredo Sánchez', 'c/ Perú, 55\r\n2A\r\nBarcelona', '932457845', 'alfredo_p@gmail.com', '2019-09-02', NULL),
(3, 'María López', 'c/ Bolivia, 5\r\nentresuelo', '665657895', 'mlopez@gmail.com', '2019-10-08', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `frame_type`
--

CREATE TABLE `frame_type` (
  `id_frame_type` int(11) NOT NULL,
  `material` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `frame_type`
--

INSERT INTO `frame_type` (`id_frame_type`, `material`) VALUES
(1, 'floating'),
(3, 'metal'),
(4, 'acetate');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glasses`
--

CREATE TABLE `glasses` (
  `id_glasses` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `prescription_id` int(11) NOT NULL,
  `frame_type_id` int(11) NOT NULL,
  `frame_color` varchar(25) NOT NULL,
  `glass_color` varchar(25) NOT NULL,
  `price` decimal(6,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `glasses`
--

INSERT INTO `glasses` (`id_glasses`, `customer_id`, `seller_id`, `brand_id`, `prescription_id`, `frame_type_id`, `frame_color`, `glass_color`, `price`) VALUES
(1, 1, 1, 1, 1, 1, 'negro', 'transparente', '150.25'),
(2, 1, 1, 2, 2, 4, 'Verde', 'transparente', '258.25'),
(3, 1, 2, 4, 5, 4, 'marrón', 'polarizado', '190.00'),
(4, 1, 2, 3, 4, 3, 'dorado', 'transparente', '120.65');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prescription`
--

CREATE TABLE `prescription` (
  `id_prescription` int(11) NOT NULL,
  `left` decimal(4,2) NOT NULL,
  `right` decimal(4,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `prescription`
--

INSERT INTO `prescription` (`id_prescription`, `left`, `right`) VALUES
(1, '1.75', '2.25'),
(2, '3.00', '3.00'),
(3, '4.75', '4.25'),
(4, '1.25', '1.00'),
(5, '0.00', '0.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provider`
--

CREATE TABLE `provider` (
  `id_provider` int(11) NOT NULL,
  `provider_address_id` int(11) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `id` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `provider`
--

INSERT INTO `provider` (`id_provider`, `provider_address_id`, `phone`, `fax`, `id`) VALUES
(1, 1, '932854785', '9285456847', 'B-1456273'),
(2, 2, '935784512', NULL, 'B-453624'),
(3, 3, '911845785', NULL, 'B-123456');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provider_adress`
--

CREATE TABLE `provider_adress` (
  `id_address` int(11) NOT NULL,
  `street` varchar(100) NOT NULL,
  `number` int(100) NOT NULL,
  `floor` int(4) NOT NULL,
  `city` varchar(100) NOT NULL,
  `zip_code` varchar(20) NOT NULL,
  `country` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `provider_adress`
--

INSERT INTO `provider_adress` (`id_address`, `street`, `number`, `floor`, `city`, `zip_code`, `country`) VALUES
(1, 'c/ Bilbao', 3, 2, 'Barcelona', '08030', 'España'),
(2, 'c/ Pelai', 3, 1, 'Barcelona', '08002', 'España'),
(3, 'Gran Vía', 56, 1, 'Madrid', '28056', 'España');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seller`
--

CREATE TABLE `seller` (
  `id_seller` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `seller`
--

INSERT INTO `seller` (`id_seller`, `name`) VALUES
(1, 'María'),
(2, 'Pablo');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id_brand`),
  ADD KEY `provider_id` (`provider_id`);

--
-- Indices de la tabla `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id_customer`);

--
-- Indices de la tabla `frame_type`
--
ALTER TABLE `frame_type`
  ADD PRIMARY KEY (`id_frame_type`);

--
-- Indices de la tabla `glasses`
--
ALTER TABLE `glasses`
  ADD PRIMARY KEY (`id_glasses`),
  ADD KEY `seller_id` (`seller_id`),
  ADD KEY `brand_id` (`brand_id`),
  ADD KEY `prescription_id` (`prescription_id`),
  ADD KEY `frame_type_id` (`frame_type_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indices de la tabla `prescription`
--
ALTER TABLE `prescription`
  ADD PRIMARY KEY (`id_prescription`);

--
-- Indices de la tabla `provider`
--
ALTER TABLE `provider`
  ADD PRIMARY KEY (`id_provider`),
  ADD KEY `provider_address_id` (`provider_address_id`);

--
-- Indices de la tabla `provider_adress`
--
ALTER TABLE `provider_adress`
  ADD PRIMARY KEY (`id_address`);

--
-- Indices de la tabla `seller`
--
ALTER TABLE `seller`
  ADD PRIMARY KEY (`id_seller`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `brand`
--
ALTER TABLE `brand`
  MODIFY `id_brand` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `customer`
--
ALTER TABLE `customer`
  MODIFY `id_customer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `frame_type`
--
ALTER TABLE `frame_type`
  MODIFY `id_frame_type` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `glasses`
--
ALTER TABLE `glasses`
  MODIFY `id_glasses` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `prescription`
--
ALTER TABLE `prescription`
  MODIFY `id_prescription` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `provider`
--
ALTER TABLE `provider`
  MODIFY `id_provider` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `provider_adress`
--
ALTER TABLE `provider_adress`
  MODIFY `id_address` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `seller`
--
ALTER TABLE `seller`
  MODIFY `id_seller` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `brand`
--
ALTER TABLE `brand`
  ADD CONSTRAINT `brand_ibfk_1` FOREIGN KEY (`provider_id`) REFERENCES `provider` (`id_provider`);

--
-- Filtros para la tabla `glasses`
--
ALTER TABLE `glasses`
  ADD CONSTRAINT `glasses_ibfk_2` FOREIGN KEY (`prescription_id`) REFERENCES `prescription` (`id_prescription`),
  ADD CONSTRAINT `glasses_ibfk_3` FOREIGN KEY (`seller_id`) REFERENCES `seller` (`id_seller`),
  ADD CONSTRAINT `glasses_ibfk_4` FOREIGN KEY (`frame_type_id`) REFERENCES `frame_type` (`id_frame_type`),
  ADD CONSTRAINT `glasses_ibfk_5` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id_brand`),
  ADD CONSTRAINT `glasses_ibfk_6` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id_customer`);

--
-- Filtros para la tabla `provider`
--
ALTER TABLE `provider`
  ADD CONSTRAINT `provider_ibfk_1` FOREIGN KEY (`provider_address_id`) REFERENCES `provider_adress` (`id_address`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
