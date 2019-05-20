-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 22-11-2017 a las 13:23:51
-- Versión del servidor: 5.5.24-log
-- Versión de PHP: 5.4.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `percepciones`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bases`
--

CREATE TABLE IF NOT EXISTS `bases` (
  `cod_base` int(11) NOT NULL AUTO_INCREMENT,
  `nom_base` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`cod_base`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `bases`
--

INSERT INTO `bases` (`cod_base`, `nom_base`) VALUES
(1, 'Chilca'),
(2, 'Pucusana'),
(3, 'Papa Leon XIII'),
(4, 'Grano de Oro'),
(5, 'Benjamin'),
(6, 'San Jose');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE IF NOT EXISTS `cliente` (
  `cod_cli` int(11) NOT NULL AUTO_INCREMENT,
  `contact` int(11) NOT NULL,
  `nom_cli` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cod_base` int(11) DEFAULT NULL,
  `note` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`cod_cli`),
  KEY `FK_cliente_base` (`cod_base`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`cod_cli`, `contact`, `nom_cli`, `cod_base`, `note`) VALUES
(1, 92156421, 'Eduardo Gomez', 2, '..........................'),
(2, 95642532, 'Marcos Rueda', 4, '................'),
(3, 96352614, 'Maria Isabel', 1, '............'),
(5, 92635261, 'Juan Caycho', 1, '............'),
(6, 92653265, 'Jhonatan Carbajal', 2, '............'),
(7, 95632521, 'Luis Solis', 3, '............');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimiento`
--

CREATE TABLE IF NOT EXISTS `movimiento` (
  `factura` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `percepcion` int(11) DEFAULT NULL,
  `liquidacion` date DEFAULT NULL,
  `voucher` int(11) DEFAULT NULL,
  `cod_cli` int(11) DEFAULT NULL,
  PRIMARY KEY (`factura`),
  KEY `FK_movimiento_cliente` (`cod_cli`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `movimiento`
--

INSERT INTO `movimiento` (`factura`, `fecha`, `percepcion`, `liquidacion`, `voucher`, `cod_cli`) VALUES
(1234, '2017-09-04', 15, '2017-09-05', 2345, 3),
(1235, '2017-09-06', 15, '2017-09-07', 2347, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL,
  `category` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `quantity` int(11) NOT NULL,
  `purchase` int(11) NOT NULL,
  `retail` int(11) NOT NULL,
  `supplier` varchar(100) NOT NULL,
  `id_supplier` int(11) NOT NULL,
  KEY `id_supplier` (`id_supplier`),
  KEY `id_supplier_2` (`id_supplier`),
  KEY `id_supplier_3` (`id_supplier`),
  KEY `id_supplier_4` (`id_supplier`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `supplier`
--

CREATE TABLE IF NOT EXISTS `supplier` (
  `id` int(11) NOT NULL,
  `suppliername` varchar(100) NOT NULL,
  `contactperson` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `contactno` varchar(11) NOT NULL,
  `note` varchar(200) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `supplier`
--

INSERT INTO `supplier` (`id`, `suppliername`, `contactperson`, `address`, `contactno`, `note`) VALUES
(13, 'Eldom', 'Carla Pacheco', 'Ica', '92542651', '.....'),
(14, 'Onix mobile', 'Sara Carbonero', 'Cañete', '921452352', '.....'),
(15, 'Limpiezabarata.com', 'Yuliana Boga', 'Chinca Alta', '92587562', '.....'),
(18, 'Ferbox', 'Monica Perez', 'Lima I', '92564521', '.......'),
(19, 'GrosSupply', 'Olga Zevallos', 'San Bartolo', '92546852', '.......');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `access` varchar(50) NOT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`userid`, `username`, `password`, `access`) VALUES
(1, 'Solash', '789', 'Admin'),
(2, 'Michael', '123', 'Admin'),
(3, 'Fabiola', '456', 'Admin');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `FK_cliente_base` FOREIGN KEY (`cod_base`) REFERENCES `bases` (`cod_base`);

--
-- Filtros para la tabla `movimiento`
--
ALTER TABLE `movimiento`
  ADD CONSTRAINT `FK_movimiento_cliente` FOREIGN KEY (`cod_cli`) REFERENCES `cliente` (`cod_cli`);

--
-- Filtros para la tabla `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`id_supplier`) REFERENCES `supplier` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
