-- phpMyAdmin SQL Dump
-- version 4.4.12
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-08-2015 a las 09:05:08
-- Versión del servidor: 5.6.25
-- Versión de PHP: 5.6.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `quimicas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoriaherramienta`
--

CREATE TABLE IF NOT EXISTS `categoriaherramienta` (
  `idCategoriaHerramienta` int(11) NOT NULL,
  `Nombre` varchar(300) NOT NULL,
  `Descripcion` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoriamaterial`
--

CREATE TABLE IF NOT EXISTS `categoriamaterial` (
  `idCategoriaMaterial` int(11) NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `Descripcion` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categoriamaterial`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `herramienta`
--

CREATE TABLE IF NOT EXISTS `herramienta` (
  `idHerramienta` int(11) NOT NULL ,
  `idInventario_UACH` int(11) DEFAULT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `Condicion` varchar(45) DEFAULT NULL,
  `Observaciones_Generales` text,
  `Foto` blob,
  `CategoriaHerramienta_idCategoriaHerramienta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `material`
--

CREATE TABLE IF NOT EXISTS `material` (
  `idMaterial` int(11) NOT NULL ,
  `Nombre` varchar(45) DEFAULT NULL,
  `Composicion` varchar(45) DEFAULT NULL,
  `CantidadUnidad` varchar(45) DEFAULT NULL,
  `CantidadGramos` varchar(45) DEFAULT NULL,
  `Estante` varchar(45) DEFAULT NULL,
  `CategoriaMaterial_idCategoriaMaterial` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `material`
--



-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reporte`
--

CREATE TABLE IF NOT EXISTS `reporte` (
  `idReporte` int(11) NOT NULL,
  `Titulo` varchar(45) DEFAULT NULL,
  `Descripcion` text,
  `FechaInicio` date DEFAULT NULL,
  `FechaFin` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reporte_has_herramienta`
--

CREATE TABLE IF NOT EXISTS `reporte_has_herramienta` (
  `Reporte_idReporte` int(11) NOT NULL,
  `Herramienta_idHerramienta` int(11) NOT NULL,
  `Herramienta_cantidad` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reporte_has_material`
--

CREATE TABLE IF NOT EXISTS `reporte_has_material` (
  `Reporte_idReporte` int(11) NOT NULL,
  `Material_idMaterial` int(11) NOT NULL,
  `Material_cantidad` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoriaherramienta`
--
ALTER TABLE `categoriaherramienta`
  ADD PRIMARY KEY (`idCategoriaHerramienta`);


ALTER TABLE `categoriaherramienta`
  MODIFY `idCategoriaHerramienta` int(11) NOT NULL AUTO_INCREMENT;

--
-- Indices de la tabla `categoriamaterial`
--
ALTER TABLE `categoriamaterial`
  ADD PRIMARY KEY (`idCategoriaMaterial`) ;

ALTER TABLE `categoriamaterial`
  MODIFY `idCategoriaMaterial` int(11) NOT NULL AUTO_INCREMENT;
--
--
-- Indices de la tabla `herramienta`
--
ALTER TABLE `herramienta`
  ADD PRIMARY KEY (`idHerramienta`),
  ADD KEY `fk_Herramienta_CategoriaHerramienta1_idx` (`CategoriaHerramienta_idCategoriaHerramienta`);

ALTER TABLE `herramienta`
  MODIFY `idHerramienta` int(11) NOT NULL AUTO_INCREMENT;
--
-- Indices de la tabla `material`
--
ALTER TABLE `material`
  ADD PRIMARY KEY (`idMaterial`) ,
  ADD KEY `fk_Material_CategoriaMaterial_idx` (`CategoriaMaterial_idCategoriaMaterial`);

ALTER TABLE `material`
  MODIFY `idMaterial` int(11) NOT NULL AUTO_INCREMENT;

--
-- Indices de la tabla `reporte`
--
ALTER TABLE `reporte`
  ADD PRIMARY KEY (`idReporte`) ;

  ALTER TABLE `reporte`
  MODIFY `idReporte` int(11) NOT NULL AUTO_INCREMENT;

--
-- Indices de la tabla `reporte_has_herramienta`
--
ALTER TABLE `reporte_has_herramienta`
  ADD PRIMARY KEY (`Reporte_idReporte`,`Herramienta_idHerramienta`),
  ADD KEY `fk_Reporte_has_Herramienta_Herramienta1_idx` (`Herramienta_idHerramienta`),
  ADD KEY `fk_Reporte_has_Herramienta_Reporte1_idx` (`Reporte_idReporte`);

--
-- Indices de la tabla `reporte_has_material`
--
ALTER TABLE `reporte_has_material`
  ADD PRIMARY KEY (`Reporte_idReporte`,`Material_idMaterial`),
  ADD KEY `fk_Reporte_has_Material_Material1_idx` (`Material_idMaterial`),
  ADD KEY `fk_Reporte_has_Material_Reporte1_idx` (`Reporte_idReporte`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `herramienta`
--
ALTER TABLE `herramienta`
  ADD CONSTRAINT `fk_Herramienta_CategoriaHerramienta1` FOREIGN KEY (`CategoriaHerramienta_idCategoriaHerramienta`) REFERENCES `categoriaherramienta` (`idCategoriaHerramienta`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `material`
--
ALTER TABLE `material`
  ADD CONSTRAINT `fk_Material_CategoriaMaterial` FOREIGN KEY (`CategoriaMaterial_idCategoriaMaterial`) REFERENCES `categoriamaterial` (`idCategoriaMaterial`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `reporte_has_herramienta`
--
ALTER TABLE `reporte_has_herramienta`
  ADD CONSTRAINT `fk_Reporte_has_Herramienta_Herramienta1` FOREIGN KEY (`Herramienta_idHerramienta`) REFERENCES `herramienta` (`idHerramienta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Reporte_has_Herramienta_Reporte1` FOREIGN KEY (`Reporte_idReporte`) REFERENCES `reporte` (`idReporte`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `reporte_has_material`
--
ALTER TABLE `reporte_has_material`
  ADD CONSTRAINT `fk_Reporte_has_Material_Material1` FOREIGN KEY (`Material_idMaterial`) REFERENCES `material` (`idMaterial`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Reporte_has_Material_Reporte1` FOREIGN KEY (`Reporte_idReporte`) REFERENCES `reporte` (`idReporte`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
