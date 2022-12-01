-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-12-2022 a las 03:32:00
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `banco_jcg`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_barrio`
--

CREATE TABLE `tbl_barrio` (
  `ID_Barr` varchar(4) NOT NULL,
  `Nom_Barr` varchar(20) NOT NULL,
  `FK_ID_Local` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_categoria`
--

CREATE TABLE `tbl_categoria` (
  `ID_Cat` varchar(8) NOT NULL,
  `Nom_Cat` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_ciudad`
--

CREATE TABLE `tbl_ciudad` (
  `ID_Ciud` varchar(4) NOT NULL,
  `Nom_Ciud` int(20) NOT NULL,
  `FK_ID_Pais` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_compra_cartera`
--

CREATE TABLE `tbl_compra_cartera` (
  `ID_Compra_Cartera` varchar(9) NOT NULL,
  `Valor` double NOT NULL,
  `Fecha_Com` datetime NOT NULL,
  `FK_ID_Pag_Serv` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_confirmacion_pago`
--

CREATE TABLE `tbl_confirmacion_pago` (
  `ID_Conf_Pag` varchar(10) NOT NULL,
  `Proceso` varchar(30) NOT NULL,
  `Pagado` varchar(20) DEFAULT NULL,
  `No_Pagado` varchar(20) DEFAULT NULL,
  `FK_ID_Form_Pag` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_corresponsal`
--

CREATE TABLE `tbl_corresponsal` (
  `ID_Correspon` varchar(5) NOT NULL,
  `Num_Via` varchar(20) NOT NULL,
  `Tip_Via` varchar(20) NOT NULL,
  `Cuadrante` varchar(20) DEFAULT NULL,
  `FK_ID_Pais` varchar(4) NOT NULL,
  `FK_ID_Ciud` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_cuenta`
--

CREATE TABLE `tbl_cuenta` (
  `ID_Cuenta` varchar(9) NOT NULL,
  `Num_Cuent` varchar(10) NOT NULL,
  `FK_ID_Pers` varchar(11) NOT NULL,
  `FK_ID_Cat` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_dato_adicional_cuenta`
--

CREATE TABLE `tbl_dato_adicional_cuenta` (
  `ID_Dat_Adic_Cuent` varchar(9) NOT NULL,
  `Fecha_Crea` datetime NOT NULL,
  `Tiemp_Activ` date NOT NULL,
  `FK_ID_Cuenta` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_dato_adicional_persona`
--

CREATE TABLE `tbl_dato_adicional_persona` (
  `ID_Dat_Adic_Pers` varchar(11) NOT NULL,
  `Tel` varchar(12) NOT NULL,
  `Correo` varchar(30) NOT NULL,
  `FK_ID_Pers` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_dato_adicional_transaccion`
--

CREATE TABLE `tbl_dato_adicional_transaccion` (
  `ID_Dat_Adic_Transac` varchar(10) NOT NULL,
  `Fecha_Transac` datetime NOT NULL,
  `FK_ID_Transac` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_deposito`
--

CREATE TABLE `tbl_deposito` (
  `ID_Deposito` varchar(10) NOT NULL,
  `Tip_Depos` varchar(20) NOT NULL,
  `Referen_Depos` varchar(30) NOT NULL,
  `Total` double NOT NULL,
  `Cant_Entrant` double NOT NULL,
  `Cant_Sal` double NOT NULL,
  `Moment_Entrad` datetime NOT NULL,
  `Moment_Sal` datetime NOT NULL,
  `Interes` double NOT NULL,
  `FK_ID_Pag_Serv` varchar(8) NOT NULL,
  `FK_ID_Recaudo` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_detalle_factura_pago`
--

CREATE TABLE `tbl_detalle_factura_pago` (
  `ID_Det_Fact_Pag` varchar(10) NOT NULL,
  `Estado` varchar(20) NOT NULL,
  `Cantidad` double NOT NULL,
  `Subtotal` double NOT NULL,
  `Total` double NOT NULL,
  `FK_ID_Fact_Pag` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_estado_transaccion`
--

CREATE TABLE `tbl_estado_transaccion` (
  `ID_Estad_Transac` varchar(10) NOT NULL,
  `Num_Conve` varchar(8) NOT NULL,
  `Num_Ref` varchar(8) NOT NULL,
  `FK_ID_Pag_Serv` varchar(8) NOT NULL,
  `FK_Pers` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_factura_pago`
--

CREATE TABLE `tbl_factura_pago` (
  `ID_Fact_Pag` varchar(10) NOT NULL,
  `Cod_Conf` varchar(10) NOT NULL,
  `FK_ID_Conf_Pag` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_forma_pago`
--

CREATE TABLE `tbl_forma_pago` (
  `ID_Form_Pag` varchar(4) NOT NULL,
  `Efectivo` varchar(20) DEFAULT NULL,
  `Tarjeta` varchar(20) DEFAULT NULL,
  `Din_Digit` varchar(20) DEFAULT NULL,
  `FK_ID_Prest` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_interes`
--

CREATE TABLE `tbl_interes` (
  `ID_Inte` varchar(10) NOT NULL,
  `Iva` double NOT NULL,
  `Tasa_Inte` double NOT NULL,
  `Mora` varchar(15) DEFAULT NULL,
  `Cant_Mora` double DEFAULT NULL,
  `FK_ID_Prest` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_localidad`
--

CREATE TABLE `tbl_localidad` (
  `ID_Local` varchar(4) NOT NULL,
  `Nom_Local` varchar(20) NOT NULL,
  `FK_ID_Ciud` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_pagos_servicios`
--

CREATE TABLE `tbl_pagos_servicios` (
  `ID_Pag_Serv` varchar(8) NOT NULL,
  `Pago` varchar(30) DEFAULT NULL,
  `Servicio` varchar(30) DEFAULT NULL,
  `Fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_pais`
--

CREATE TABLE `tbl_pais` (
  `ID_Pais` varchar(4) NOT NULL,
  `Nom_Pais` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_perfil`
--

CREATE TABLE `tbl_perfil` (
  `ID_Perf` varchar(12) NOT NULL,
  `Nom_Perf` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_persona`
--

CREATE TABLE `tbl_persona` (
  `ID_Pers` varchar(11) NOT NULL,
  `Prim_Nom` varchar(20) NOT NULL,
  `Seg_Nom` varchar(20) DEFAULT NULL,
  `Prim_Apell` varchar(20) NOT NULL,
  `Seg_Apell` varchar(20) DEFAULT NULL,
  `Fecha_Nac` date NOT NULL,
  `FK_ID_Perf` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_prestamo`
--

CREATE TABLE `tbl_prestamo` (
  `ID_Prest` varchar(10) NOT NULL,
  `Cant_Prest` double NOT NULL,
  `Recib` double NOT NULL,
  `Fecha_Prest` datetime NOT NULL,
  `FK_ID_Sucursal` varchar(5) NOT NULL,
  `FK_ID_Transac` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_producto`
--

CREATE TABLE `tbl_producto` (
  `ID_Product` varchar(8) NOT NULL,
  `Nom-Product` varchar(20) NOT NULL,
  `Referencia` varchar(20) NOT NULL,
  `FK_ID_Cat` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_recaudo`
--

CREATE TABLE `tbl_recaudo` (
  `ID_Recaudo` varchar(9) NOT NULL,
  `Cant` double NOT NULL,
  `Fecha_Recaud` datetime NOT NULL,
  `FK_ID_Pers` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_reclamo`
--

CREATE TABLE `tbl_reclamo` (
  `ID_Reclam` varchar(8) NOT NULL,
  `Reclam` varchar(50) NOT NULL,
  `Fecha_Reclam` datetime NOT NULL,
  `FK_ID_Product` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_sucursal`
--

CREATE TABLE `tbl_sucursal` (
  `ID_Sucursal` varchar(5) NOT NULL,
  `Num_Via` varchar(20) NOT NULL,
  `Tip_Via` varchar(20) NOT NULL,
  `Cuadrante` varchar(20) DEFAULT NULL,
  `FK_ID_Ciud` varchar(4) NOT NULL,
  `FK_ID_Local` varchar(4) NOT NULL,
  `FK_ID_Barr` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_tarjeta`
--

CREATE TABLE `tbl_tarjeta` (
  `ID_Tarjeta` varchar(7) NOT NULL,
  `Tip_Tarjeta` varchar(20) NOT NULL,
  `Num_tarjeta` varchar(8) NOT NULL,
  `FK_ID_Cuenta` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_tipo_cuenta`
--

CREATE TABLE `tbl_tipo_cuenta` (
  `ID_Tip_Cuent` varchar(9) NOT NULL,
  `Tipo` varchar(20) NOT NULL,
  `FK_ID_Cuenta` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_transaccion`
--

CREATE TABLE `tbl_transaccion` (
  `ID_Transac` varchar(10) NOT NULL,
  `Cant_Transac` double NOT NULL,
  `Consigna` varchar(20) DEFAULT NULL,
  `Retiro` varchar(20) DEFAULT NULL,
  `FK_ID_Pers` varchar(11) NOT NULL,
  `FK_ID_Estad_Transac` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbl_barrio`
--
ALTER TABLE `tbl_barrio`
  ADD PRIMARY KEY (`ID_Barr`),
  ADD KEY `FK_Local_Barr` (`FK_ID_Local`);

--
-- Indices de la tabla `tbl_categoria`
--
ALTER TABLE `tbl_categoria`
  ADD PRIMARY KEY (`ID_Cat`);

--
-- Indices de la tabla `tbl_ciudad`
--
ALTER TABLE `tbl_ciudad`
  ADD PRIMARY KEY (`ID_Ciud`),
  ADD KEY `FK_Pais_Ciud` (`FK_ID_Pais`);

--
-- Indices de la tabla `tbl_compra_cartera`
--
ALTER TABLE `tbl_compra_cartera`
  ADD PRIMARY KEY (`ID_Compra_Cartera`),
  ADD KEY `FK_Pag_Serv_Comp_Cart` (`FK_ID_Pag_Serv`);

--
-- Indices de la tabla `tbl_confirmacion_pago`
--
ALTER TABLE `tbl_confirmacion_pago`
  ADD PRIMARY KEY (`ID_Conf_Pag`),
  ADD KEY `FK_Form_Pag_Conf_Pag` (`FK_ID_Form_Pag`);

--
-- Indices de la tabla `tbl_corresponsal`
--
ALTER TABLE `tbl_corresponsal`
  ADD PRIMARY KEY (`ID_Correspon`),
  ADD KEY `FK_Pais_Correspon` (`FK_ID_Pais`),
  ADD KEY `FK_Ciud_Correspon` (`FK_ID_Ciud`);

--
-- Indices de la tabla `tbl_cuenta`
--
ALTER TABLE `tbl_cuenta`
  ADD PRIMARY KEY (`ID_Cuenta`),
  ADD KEY `FK_Pers_Cuent` (`FK_ID_Pers`),
  ADD KEY `FK_Cat_Cuent` (`FK_ID_Cat`);

--
-- Indices de la tabla `tbl_dato_adicional_cuenta`
--
ALTER TABLE `tbl_dato_adicional_cuenta`
  ADD PRIMARY KEY (`ID_Dat_Adic_Cuent`),
  ADD KEY `FK_Cuenta_Dat_Adic_Cuent` (`FK_ID_Cuenta`);

--
-- Indices de la tabla `tbl_dato_adicional_persona`
--
ALTER TABLE `tbl_dato_adicional_persona`
  ADD PRIMARY KEY (`ID_Dat_Adic_Pers`),
  ADD KEY `FK_Pers_Dat_Adic_Pers` (`FK_ID_Pers`);

--
-- Indices de la tabla `tbl_dato_adicional_transaccion`
--
ALTER TABLE `tbl_dato_adicional_transaccion`
  ADD PRIMARY KEY (`ID_Dat_Adic_Transac`),
  ADD KEY `FK_Transac_Dat_Adic_Transac` (`FK_ID_Transac`);

--
-- Indices de la tabla `tbl_deposito`
--
ALTER TABLE `tbl_deposito`
  ADD PRIMARY KEY (`ID_Deposito`),
  ADD KEY `FK_Recau_Depos` (`FK_ID_Recaudo`),
  ADD KEY `FK_Pag_Serv_Depos` (`FK_ID_Pag_Serv`);

--
-- Indices de la tabla `tbl_detalle_factura_pago`
--
ALTER TABLE `tbl_detalle_factura_pago`
  ADD PRIMARY KEY (`ID_Det_Fact_Pag`),
  ADD KEY `FK_Fact_Pag_Det_Fact_Pag` (`FK_ID_Fact_Pag`);

--
-- Indices de la tabla `tbl_estado_transaccion`
--
ALTER TABLE `tbl_estado_transaccion`
  ADD PRIMARY KEY (`ID_Estad_Transac`),
  ADD KEY `FK_Pers_Estad_Transac` (`FK_Pers`),
  ADD KEY `FK_Pag_Serv_Estad_Transac` (`FK_ID_Pag_Serv`);

--
-- Indices de la tabla `tbl_factura_pago`
--
ALTER TABLE `tbl_factura_pago`
  ADD PRIMARY KEY (`ID_Fact_Pag`),
  ADD KEY `FK_Conf_Pag_Fact_Pag` (`FK_ID_Conf_Pag`);

--
-- Indices de la tabla `tbl_forma_pago`
--
ALTER TABLE `tbl_forma_pago`
  ADD PRIMARY KEY (`ID_Form_Pag`),
  ADD KEY `FK_Prest_Form_Pag` (`FK_ID_Prest`);

--
-- Indices de la tabla `tbl_interes`
--
ALTER TABLE `tbl_interes`
  ADD PRIMARY KEY (`ID_Inte`),
  ADD KEY `FK_Prest_Inte` (`FK_ID_Prest`);

--
-- Indices de la tabla `tbl_localidad`
--
ALTER TABLE `tbl_localidad`
  ADD PRIMARY KEY (`ID_Local`),
  ADD KEY `FK_Ciud_Local` (`FK_ID_Ciud`);

--
-- Indices de la tabla `tbl_pagos_servicios`
--
ALTER TABLE `tbl_pagos_servicios`
  ADD PRIMARY KEY (`ID_Pag_Serv`);

--
-- Indices de la tabla `tbl_pais`
--
ALTER TABLE `tbl_pais`
  ADD PRIMARY KEY (`ID_Pais`);

--
-- Indices de la tabla `tbl_perfil`
--
ALTER TABLE `tbl_perfil`
  ADD PRIMARY KEY (`ID_Perf`);

--
-- Indices de la tabla `tbl_persona`
--
ALTER TABLE `tbl_persona`
  ADD PRIMARY KEY (`ID_Pers`),
  ADD KEY `FK_Perf_Pers` (`FK_ID_Perf`);

--
-- Indices de la tabla `tbl_prestamo`
--
ALTER TABLE `tbl_prestamo`
  ADD PRIMARY KEY (`ID_Prest`),
  ADD KEY `FK_Transac_Prest` (`FK_ID_Transac`),
  ADD KEY `FK_Sucur_Prest` (`FK_ID_Sucursal`);

--
-- Indices de la tabla `tbl_producto`
--
ALTER TABLE `tbl_producto`
  ADD PRIMARY KEY (`ID_Product`),
  ADD KEY `FK_Cat_Product` (`FK_ID_Cat`);

--
-- Indices de la tabla `tbl_recaudo`
--
ALTER TABLE `tbl_recaudo`
  ADD PRIMARY KEY (`ID_Recaudo`),
  ADD KEY `FK_Pers_Recaud` (`FK_ID_Pers`);

--
-- Indices de la tabla `tbl_reclamo`
--
ALTER TABLE `tbl_reclamo`
  ADD PRIMARY KEY (`ID_Reclam`),
  ADD KEY `FK_Product_Reclam` (`FK_ID_Product`);

--
-- Indices de la tabla `tbl_sucursal`
--
ALTER TABLE `tbl_sucursal`
  ADD PRIMARY KEY (`ID_Sucursal`),
  ADD KEY `FK_Ciud_Sucur` (`FK_ID_Ciud`),
  ADD KEY `FK_Local_Sucur` (`FK_ID_Local`),
  ADD KEY `FK_Barr_Sucur` (`FK_ID_Barr`);

--
-- Indices de la tabla `tbl_tarjeta`
--
ALTER TABLE `tbl_tarjeta`
  ADD PRIMARY KEY (`ID_Tarjeta`),
  ADD KEY `FK_Cuent_Tarjeta` (`FK_ID_Cuenta`);

--
-- Indices de la tabla `tbl_tipo_cuenta`
--
ALTER TABLE `tbl_tipo_cuenta`
  ADD PRIMARY KEY (`ID_Tip_Cuent`),
  ADD KEY `FK_Cuent_Tip_Cuent` (`FK_ID_Cuenta`);

--
-- Indices de la tabla `tbl_transaccion`
--
ALTER TABLE `tbl_transaccion`
  ADD PRIMARY KEY (`ID_Transac`),
  ADD KEY `FK_Pers_Transac` (`FK_ID_Pers`),
  ADD KEY `FK_Estad_Transac_Transac` (`FK_ID_Estad_Transac`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbl_barrio`
--
ALTER TABLE `tbl_barrio`
  ADD CONSTRAINT `FK_Local_Barr` FOREIGN KEY (`FK_ID_Local`) REFERENCES `tbl_localidad` (`ID_Local`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_ciudad`
--
ALTER TABLE `tbl_ciudad`
  ADD CONSTRAINT `FK_Pais_Ciud` FOREIGN KEY (`FK_ID_Pais`) REFERENCES `tbl_pais` (`ID_Pais`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_compra_cartera`
--
ALTER TABLE `tbl_compra_cartera`
  ADD CONSTRAINT `FK_Pag_Serv_Comp_Cart` FOREIGN KEY (`FK_ID_Pag_Serv`) REFERENCES `tbl_pagos_servicios` (`ID_Pag_Serv`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_confirmacion_pago`
--
ALTER TABLE `tbl_confirmacion_pago`
  ADD CONSTRAINT `FK_Form_Pag_Conf_Pag` FOREIGN KEY (`FK_ID_Form_Pag`) REFERENCES `tbl_forma_pago` (`ID_Form_Pag`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_corresponsal`
--
ALTER TABLE `tbl_corresponsal`
  ADD CONSTRAINT `FK_Ciud_Correspon` FOREIGN KEY (`FK_ID_Ciud`) REFERENCES `tbl_ciudad` (`ID_Ciud`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Pais_Correspon` FOREIGN KEY (`FK_ID_Pais`) REFERENCES `tbl_pais` (`ID_Pais`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_cuenta`
--
ALTER TABLE `tbl_cuenta`
  ADD CONSTRAINT `FK_Cat_Cuent` FOREIGN KEY (`FK_ID_Cat`) REFERENCES `tbl_categoria` (`ID_Cat`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Pers_Cuent` FOREIGN KEY (`FK_ID_Pers`) REFERENCES `tbl_persona` (`ID_Pers`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_dato_adicional_cuenta`
--
ALTER TABLE `tbl_dato_adicional_cuenta`
  ADD CONSTRAINT `FK_Cuenta_Dat_Adic_Cuent` FOREIGN KEY (`FK_ID_Cuenta`) REFERENCES `tbl_cuenta` (`ID_Cuenta`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_dato_adicional_persona`
--
ALTER TABLE `tbl_dato_adicional_persona`
  ADD CONSTRAINT `FK_Pers_Dat_Adic_Pers` FOREIGN KEY (`FK_ID_Pers`) REFERENCES `tbl_persona` (`ID_Pers`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_dato_adicional_transaccion`
--
ALTER TABLE `tbl_dato_adicional_transaccion`
  ADD CONSTRAINT `FK_Transac_Dat_Adic_Transac` FOREIGN KEY (`FK_ID_Transac`) REFERENCES `tbl_transaccion` (`ID_Transac`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_deposito`
--
ALTER TABLE `tbl_deposito`
  ADD CONSTRAINT `FK_Pag_Serv_Depos` FOREIGN KEY (`FK_ID_Pag_Serv`) REFERENCES `tbl_pagos_servicios` (`ID_Pag_Serv`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Recau_Depos` FOREIGN KEY (`FK_ID_Recaudo`) REFERENCES `tbl_recaudo` (`ID_Recaudo`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_detalle_factura_pago`
--
ALTER TABLE `tbl_detalle_factura_pago`
  ADD CONSTRAINT `FK_Fact_Pag_Det_Fact_Pag` FOREIGN KEY (`FK_ID_Fact_Pag`) REFERENCES `tbl_factura_pago` (`ID_Fact_Pag`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_estado_transaccion`
--
ALTER TABLE `tbl_estado_transaccion`
  ADD CONSTRAINT `FK_Pag_Serv_Estad_Transac` FOREIGN KEY (`FK_ID_Pag_Serv`) REFERENCES `tbl_pagos_servicios` (`ID_Pag_Serv`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Pers_Estad_Transac` FOREIGN KEY (`FK_Pers`) REFERENCES `tbl_persona` (`ID_Pers`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_factura_pago`
--
ALTER TABLE `tbl_factura_pago`
  ADD CONSTRAINT `FK_Conf_Pag_Fact_Pag` FOREIGN KEY (`FK_ID_Conf_Pag`) REFERENCES `tbl_confirmacion_pago` (`ID_Conf_Pag`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_forma_pago`
--
ALTER TABLE `tbl_forma_pago`
  ADD CONSTRAINT `FK_Prest_Form_Pag` FOREIGN KEY (`FK_ID_Prest`) REFERENCES `tbl_prestamo` (`ID_Prest`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_interes`
--
ALTER TABLE `tbl_interes`
  ADD CONSTRAINT `FK_Prest_Inte` FOREIGN KEY (`FK_ID_Prest`) REFERENCES `tbl_prestamo` (`ID_Prest`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_localidad`
--
ALTER TABLE `tbl_localidad`
  ADD CONSTRAINT `FK_Ciud_Local` FOREIGN KEY (`FK_ID_Ciud`) REFERENCES `tbl_ciudad` (`ID_Ciud`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_persona`
--
ALTER TABLE `tbl_persona`
  ADD CONSTRAINT `FK_Perf_Pers` FOREIGN KEY (`FK_ID_Perf`) REFERENCES `tbl_perfil` (`ID_Perf`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_prestamo`
--
ALTER TABLE `tbl_prestamo`
  ADD CONSTRAINT `FK_Sucur_Prest` FOREIGN KEY (`FK_ID_Sucursal`) REFERENCES `tbl_sucursal` (`ID_Sucursal`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Transac_Prest` FOREIGN KEY (`FK_ID_Transac`) REFERENCES `tbl_transaccion` (`ID_Transac`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_producto`
--
ALTER TABLE `tbl_producto`
  ADD CONSTRAINT `FK_Cat_Product` FOREIGN KEY (`FK_ID_Cat`) REFERENCES `tbl_categoria` (`ID_Cat`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_recaudo`
--
ALTER TABLE `tbl_recaudo`
  ADD CONSTRAINT `FK_Pers_Recaud` FOREIGN KEY (`FK_ID_Pers`) REFERENCES `tbl_persona` (`ID_Pers`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_reclamo`
--
ALTER TABLE `tbl_reclamo`
  ADD CONSTRAINT `FK_Product_Reclam` FOREIGN KEY (`FK_ID_Product`) REFERENCES `tbl_producto` (`ID_Product`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_sucursal`
--
ALTER TABLE `tbl_sucursal`
  ADD CONSTRAINT `FK_Barr_Sucur` FOREIGN KEY (`FK_ID_Barr`) REFERENCES `tbl_barrio` (`ID_Barr`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Ciud_Sucur` FOREIGN KEY (`FK_ID_Ciud`) REFERENCES `tbl_ciudad` (`ID_Ciud`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Local_Sucur` FOREIGN KEY (`FK_ID_Local`) REFERENCES `tbl_localidad` (`ID_Local`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_tarjeta`
--
ALTER TABLE `tbl_tarjeta`
  ADD CONSTRAINT `FK_Cuent_Tarjeta` FOREIGN KEY (`FK_ID_Cuenta`) REFERENCES `tbl_cuenta` (`ID_Cuenta`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_tipo_cuenta`
--
ALTER TABLE `tbl_tipo_cuenta`
  ADD CONSTRAINT `FK_Cuent_Tip_Cuent` FOREIGN KEY (`FK_ID_Cuenta`) REFERENCES `tbl_cuenta` (`ID_Cuenta`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_transaccion`
--
ALTER TABLE `tbl_transaccion`
  ADD CONSTRAINT `FK_Estad_Transac_Transac` FOREIGN KEY (`FK_ID_Estad_Transac`) REFERENCES `tbl_estado_transaccion` (`ID_Estad_transac`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Pers_Transac` FOREIGN KEY (`FK_ID_Pers`) REFERENCES `tbl_persona` (`ID_Pers`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
