-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-11-2022 a las 13:09:57
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `appcomida`
--
CREATE DATABASE IF NOT EXISTS `appcomida` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `appcomida`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `codPedido` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fechaPedido` date DEFAULT current_timestamp(),
  `idProducto` int(11) NOT NULL,
  `idEmpresa` varchar(10) NOT NULL,
  `idCliente` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `idProducto` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `stock` int(11) NOT NULL,
  `kg_ud` DECIMAL(3,2) NOT NULL,
  `fechaCaducidad` date NOT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `imgSRC` varchar(50) DEFAULT "imgDefault.jpg" NOT NULL,
  `idEmpresa` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`idProducto`, `nombre`, `stock`, `kg_ud`, `fechaCaducidad`, `descripcion`, `imgSRC`, `idEmpresa`) VALUES
(1, 'Barra de Pan', 15, 3.54, '2023-01-01', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', 'pan.jpg', 'empresa1'),
(2, 'Phoskitos', 30, 5.12, '2023-10-01', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.', 'phoskitos.jpg', 'empresa1'),
(3, 'Weikis', 25, 0.95, '2022-12-28', '', 'weikis.jpg', 'empresa1'),
(4, 'Haribo', 15, 1.23, '2023-02-01', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.', 'haribo.jpg', 'empresa1'),
(5, 'Acelgas', 5, 0.89, '2023-01-27', '', 'acelgas.jpg', 'empresa2'),
(6, 'Manzanas', 6, 1.16, '2022-12-03', 'Latin words, combined with a handful of model sentence structures', 'manzanas.jpg', 'empresa2'),
(7, 'Naranjas', 30, 1.59, '2022-11-30', 'The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested.', 'naranjas.jpg', 'empresa2'),
(8, 'Napolitanas', 42, 0.95, '2022-12-01', '', 'napolitanas.jpg', 'empresa2'),
(9, 'Leche Entera', 16, 1.79, '2022-12-07', 'The standard chunk of Lorem Ipsum used since the 1500s', 'leche.jpg', 'empresa2');


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `userId` varchar(20) NOT NULL,
  `pass` varchar(200) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `email` varchar(50) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `rol` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`userId`, `pass`, `nombre`, `email`, `direccion`, `rol`) VALUES
('admin1', '25f43b1486ad95a1398e3eeb3d83bc4010015fcc9bedb35b432e00298d5021f7', 'Paco', 'pacopaquete@gmail.com', 'Calle Comuneros de Castilla', 'admin'),
('admin2', '1c142b2d01aa34e9a36bde480645a57fd69e14155dacfab5a3f9257b77fdc8d8', 'Roberto', 'roberto@gmail.com', 'Calle Mejorada', 'admin'),
('empresa1', '4b0e27ca51d536eb87c843ebfdc2fdfc18496ec10bf9bb46bde9f91db67e5911', 'Panadería Robles', 'marcopolo@gmail.com', 'Calle San Antón', 'empresa'),
('empresa2', '78fdb75ac5b4892826eab5943c54fe3238afe62fd5a81e0d7bb233ed4d86c64f', 'Supermercado Paqui', 'ruben@gmail.com', 'Calle San Vicente', 'empresa'),
('user1', '0a041b9462caa4a31bac3567e0b6e6fd9100787db2ab433d96f6d178cabfce90', 'Antonio', 'anton@gmail.com', 'Av. Pio XII', 'cliente'),
('user2', '6025d18fe48abd45168528f18a82e265dd98d421a7084aa09f61b341703901a3', 'Manolo', 'manolete@gmail.com', 'Calle Lagartera', 'cliente');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`codPedido`),
  ADD KEY `pedidos_cliente` (`idCliente`),
  ADD KEY `pedidos_empresa` (`idEmpresa`),
  ADD KEY `pedidos_producto` (`idProducto`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`idProducto`),
  ADD KEY `productos_emoresaFK` (`idEmpresa`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`userId`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `codPedido` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `idProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_cliente` FOREIGN KEY (`idCliente`) REFERENCES `usuarios` (`userId`),
  ADD CONSTRAINT `pedidos_empresa` FOREIGN KEY (`idEmpresa`) REFERENCES `usuarios` (`userId`),
  ADD CONSTRAINT `pedidos_producto` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_emoresaFK` FOREIGN KEY (`idEmpresa`) REFERENCES `usuarios` (`userId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
