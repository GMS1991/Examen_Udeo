-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-06-2024 a las 01:45:30
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
-- Base de datos: `udeo`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ALTA_INSCRIPCION` (IN `CUI` INT, IN `NOMBRES` TEXT, IN `APELLIDOS` TEXT, IN `FECHANAC` DATE, IN `TELEFONO` TEXT, IN `IDMUNICIPIO` INT, IN `DOMICILIO` TEXT, IN `IDDIVERSIFICADO` INT, IN `IDLICENCIATURA` INT, IN `IDJORNADA` INT)   BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;

    INSERT INTO INSCRIPCION (
        CUI,
        NOMBRES,
        APELLIDOS,
        FECHANAC,
        TELEFONO,
        IDMUNICIPIO,
        DOMICILIO,
        IDDIVERSIFICADO,
        IDLICENCIATURA,
        IDJORNADA
    ) VALUES (
        CUI,
        NOMBRES,
        APELLIDOS,
        FECHANAC,
        TELEFONO,
        IDMUNICIPIO,
        DOMICILIO,
        IDDIVERSIFICADO,
        IDLICENCIATURA,
        IDJORNADA
    );

    COMMIT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_BAJA_INSCRIPCION` (IN `ID` INT)   BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;

    DELETE FROM INSCRIPCION
    WHERE ID = ID;

    COMMIT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CAMBIO_INSCRIPCION` (IN `ID` INT, IN `CUI` INT, IN `NOMBRES` TEXT, IN `APELLIDOS` TEXT, IN `FECHANAC` DATE, IN `TELEFONO` TEXT, IN `IDMUNICIPIO` INT, IN `DOMICILIO` TEXT, IN `IDDIVERSIFICADO` INT, IN `IDLICENCIATURA` INT, IN `IDJORNADA` INT)   BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;

    UPDATE INSCRIPCION
    SET
        CUI = CUI,
        NOMBRES = NOMBRES,
        APELLIDOS = APELLIDOS,
        FECHANAC = FECHANAC,
        TELEFONO = TELEFONO,
        IDMUNICIPIO = IDMUNICIPIO,
        DOMICILIO = DOMICILIO,
        IDDIVERSIFICADO = IDDIVERSIFICADO,
        IDLICENCIATURA = IDLICENCIATURA,
        IDJORNADA = IDJORNADA
    WHERE ID = ID;

    COMMIT;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE `departamento` (
  `ID` int(11) NOT NULL,
  `DEPARTAMENTO` text NOT NULL,
  `IDPAIS` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `departamento`
--

INSERT INTO `departamento` (`ID`, `DEPARTAMENTO`, `IDPAIS`) VALUES
(1, 'QUETZALTENANGO', 1),
(2, 'HUEHUETENANGO', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `diversificado`
--

CREATE TABLE `diversificado` (
  `ID` int(11) NOT NULL,
  `DIVERSIFICADO` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripcion`
--

CREATE TABLE `inscripcion` (
  `ID` int(11) NOT NULL,
  `CUI` int(11) NOT NULL,
  `NOMBRES` text NOT NULL,
  `APELLIDOS` text NOT NULL,
  `FECHANAC` date NOT NULL,
  `TELEFONO` text NOT NULL,
  `IDMUNICIPIO` int(11) NOT NULL,
  `DOMICILIO` text NOT NULL,
  `IDDIVERSIFICADO` int(11) NOT NULL,
  `IDLICENCIATURA` int(11) NOT NULL,
  `IDJORNADA` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jornada`
--

CREATE TABLE `jornada` (
  `ID` int(11) NOT NULL,
  `JORNADA` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `licenciatura`
--

CREATE TABLE `licenciatura` (
  `ID` int(11) NOT NULL,
  `LICENCIATURA` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipio`
--

CREATE TABLE `municipio` (
  `ID` int(11) NOT NULL,
  `MUNICIPIO` text NOT NULL,
  `IDDEPARTAMENTO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `municipio`
--

INSERT INTO `municipio` (`ID`, `MUNICIPIO`, `IDDEPARTAMENTO`) VALUES
(1, 'LA ESPERANZA', 1),
(2, 'LA DEMOCRACIA', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pais`
--

CREATE TABLE `pais` (
  `ID` int(11) NOT NULL,
  `PAIS` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pais`
--

INSERT INTO `pais` (`ID`, `PAIS`) VALUES
(1, 'GUATEMALA');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_DEPARTAMENTO_PAIS` (`IDPAIS`);

--
-- Indices de la tabla `diversificado`
--
ALTER TABLE `diversificado`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `inscripcion`
--
ALTER TABLE `inscripcion`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_INSCRIPCION_DIVERSIFICADO` (`IDDIVERSIFICADO`),
  ADD KEY `FK_INSCRIPCION_JORNADA` (`IDJORNADA`),
  ADD KEY `FK_INSCRIPCION_LICENCIATURA` (`IDLICENCIATURA`),
  ADD KEY `FK_INSCRIPCION_MUNICIPIO` (`IDMUNICIPIO`);

--
-- Indices de la tabla `jornada`
--
ALTER TABLE `jornada`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `licenciatura`
--
ALTER TABLE `licenciatura`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `municipio`
--
ALTER TABLE `municipio`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_MUNICIPIO_DEPARTAMENTO` (`IDDEPARTAMENTO`);

--
-- Indices de la tabla `pais`
--
ALTER TABLE `pais`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `departamento`
--
ALTER TABLE `departamento`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `diversificado`
--
ALTER TABLE `diversificado`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inscripcion`
--
ALTER TABLE `inscripcion`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `jornada`
--
ALTER TABLE `jornada`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `licenciatura`
--
ALTER TABLE `licenciatura`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `municipio`
--
ALTER TABLE `municipio`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `pais`
--
ALTER TABLE `pais`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD CONSTRAINT `FK_DEPARTAMENTO_PAIS` FOREIGN KEY (`IDPAIS`) REFERENCES `pais` (`ID`);

--
-- Filtros para la tabla `inscripcion`
--
ALTER TABLE `inscripcion`
  ADD CONSTRAINT `FK_INSCRIPCION_DIVERSIFICADO` FOREIGN KEY (`IDDIVERSIFICADO`) REFERENCES `diversificado` (`ID`),
  ADD CONSTRAINT `FK_INSCRIPCION_JORNADA` FOREIGN KEY (`IDJORNADA`) REFERENCES `jornada` (`ID`),
  ADD CONSTRAINT `FK_INSCRIPCION_LICENCIATURA` FOREIGN KEY (`IDLICENCIATURA`) REFERENCES `licenciatura` (`ID`),
  ADD CONSTRAINT `FK_INSCRIPCION_MUNICIPIO` FOREIGN KEY (`IDMUNICIPIO`) REFERENCES `municipio` (`ID`);

--
-- Filtros para la tabla `municipio`
--
ALTER TABLE `municipio`
  ADD CONSTRAINT `FK_MUNICIPIO_DEPARTAMENTO` FOREIGN KEY (`IDDEPARTAMENTO`) REFERENCES `departamento` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
