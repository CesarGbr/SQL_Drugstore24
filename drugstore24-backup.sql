/*

  Se adiciona al inicio del documento la sentencia CREATE SCHEMA IF NOT EXISTS
  para que el sistema de importacion de MySQL Server pueda ingresar todas las tablas 
  respaldadas en una nueva base de datos

*/

CREATE SCHEMA IF NOT EXISTS Drugstore24;
USE Drugstore24;

/* Backup - Drugstore 24 horas */

-- Esquema de Backup para Drugstore24.sql 
-- Generado por MySQL Server
-- Version 1.0 Año 2022
-- Creado como proyecto Final para CODERHOUSE
-- Tutor: Sergio Occhipinti
-- Profesor: Cesar Aracena

-- Aclaraciones:
-- * Este documento fue escrito paso a paso usando como ejemplo el
-- archivo sakila-schema.sql y comprendiendo cada una de las
-- partes que componen  el código abajo escrito.
-- * Este documento fue confeccionado únicamente con fines 
-- educativos y no representa una base de datos real ni
-- totalmente funcional. No debe usarse de ninguna manera para
-- fines lucrativos reales.

/*

  Se realiza un backup de las siguientes tablas:
  - 'Articulos', 'Categorias', 'Clientes', 'Contacto', 'Detalle_Ingresos', 'Detalle_Ventas', 'Empleados'
    'Ingresos', 'Proveedores' y 'Ventas', 
  Ademas se hace backup de las tablas auditables 'Log_Articulos' y 'Log_Proveedores'

*/
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: drugstore24
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `articulos`
--

DROP TABLE IF EXISTS `articulos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articulos` (
  `id_articulos` int unsigned NOT NULL AUTO_INCREMENT,
  `id_categorias` int unsigned NOT NULL,
  `codigo` int NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(256) DEFAULT NULL,
  `art_precio` decimal(11,2) NOT NULL,
  PRIMARY KEY (`id_articulos`),
  KEY `fk_id_categorias` (`id_categorias`),
  CONSTRAINT `fk_id_categorias` FOREIGN KEY (`id_categorias`) REFERENCES `categorias` (`id_categorias`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articulos`
--

LOCK TABLES `articulos` WRITE;
/*!40000 ALTER TABLE `articulos` DISABLE KEYS */;
INSERT INTO `articulos` VALUES (1,11,30000,'Yerba','Yerba Mate la tranquera Naranja',500.00),(2,1,30001,'Tortillas','Tortillas de grasa por kilo',200.00),(3,1,30002,'Pan Frances','Pan frances por kilo',250.00),(4,1,30003,'Facturas','Facturas de manteca por docena',450.00),(5,2,30004,'Jabon para bebe','Jabon para bebe aroma a rosas',320.50),(6,2,30005,'Crema Humectante','Crema humectante para pieles oleosas',3200.00),(7,2,30006,'Cepillo de dientes OdontoFull','Cepillo de dientes',600.00),(8,3,30007,'Gaseosa de granadina','Bebida carbonatada sabor granadina',200.00),(9,3,30008,'Vino Rosado','Vino Rosado',567.00),(10,3,30009,'Agua en botella','Agua en botella x 1 Litro',100.00),(11,4,30010,'Aceite Farolito','Aceite de maiz x 900 ml',180.56),(12,4,30011,'Aceite de Oliva','Aceite de oliva Extra Virgen x 500ml',820.35),(13,5,30012,'Lavandina','Lavandina x 1 Litro',260.33),(14,5,30013,'Trapo de piso','Trapo de piso 45 x 80 cm',50.25),(15,6,30014,'Alimento para Perros','Alimento para perros sabor carne x 10kg',2350.00),(16,6,30015,'Alimento para Gatos','Alimento para gatos sabor atun x 10kg',3200.00),(17,7,30016,'Pizza congelada','Pizza de peperonni',650.14),(18,7,30017,'Helado','Helado de 3 sabores x 3 Litros',542.36),(19,8,30018,'Atun Fresco','Atun premium x 1kg',320.25),(20,8,30019,'Salmon Rosado','Salmon Rosado x 1kg',2600.48),(21,9,30020,'Bife Ancho','Corte de carne vacuna x kg',900.00),(22,9,30021,'Costilla de Cerdo','Costilla de cerdo x kg',1200.36),(23,10,30022,'Atun en lata','Atun en lata desmenuzado',365.20),(24,10,30023,'Palmitos en lata','Palmitos enlatados en agua x 300gr',400.00),(25,11,30024,'Fideos Monito','Fideos monito para guiso x 500gr',80.00),(26,11,30025,'Harina 0000','Harina de panaderia 0000',120.50),(27,12,30026,'Bicicleta para niño','Bicicleta para niño/a rodado 20 6 velocidades',40000.00),(28,12,30027,'Set de futbol','Juego de futbol (Arco + Red + 3 pelotas + guantes de arquero',14000.00);
/*!40000 ALTER TABLE `articulos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_log_articulos` BEFORE UPDATE ON `articulos` FOR EACH ROW BEGIN
        INSERT INTO log_articulos(art_precio, art_precio_nuevo, usuario)
        VALUES (OLD.art_precio, NEW.art_precio, SESSION_USER());
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `articulos_precios_altos`
--

DROP TABLE IF EXISTS `articulos_precios_altos`;
/*!50001 DROP VIEW IF EXISTS `articulos_precios_altos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `articulos_precios_altos` AS SELECT 
 1 AS `Nombre de categorias`,
 1 AS `Precio de Articulos`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `id_categorias` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `Descripcion` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id_categorias`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Panaderia',''),(2,'Belleza e higiene',''),(3,'Bebidas',''),(4,'Conservas y aceites',''),(5,'Limpieza',''),(6,'Mascotas',''),(7,'Congelados',''),(8,'Pescaderia',''),(9,'Carniceria',''),(10,'Enlatados',''),(11,'Comestibles',''),(12,'Jugueteria',''),(13,'Hogar',''),(14,'Electronicos','');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id_clientes` int unsigned NOT NULL AUTO_INCREMENT,
  `id_contacto` int unsigned NOT NULL,
  PRIMARY KEY (`id_clientes`),
  KEY `fk_id_contacto_clientes` (`id_contacto`),
  CONSTRAINT `fk_id_contacto_clientes` FOREIGN KEY (`id_contacto`) REFERENCES `contacto` (`id_contacto`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(11,11),(12,12),(13,13),(14,14),(15,15),(16,16),(17,17),(18,18),(19,19),(20,20);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `clientes_premiados`
--

DROP TABLE IF EXISTS `clientes_premiados`;
/*!50001 DROP VIEW IF EXISTS `clientes_premiados`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `clientes_premiados` AS SELECT 
 1 AS `Nombre Cliente`,
 1 AS `Numero de Telefono`,
 1 AS `Fecha de venta`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `contacto`
--

DROP TABLE IF EXISTS `contacto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacto` (
  `id_contacto` int unsigned NOT NULL AUTO_INCREMENT,
  `nombres` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `sexo` varchar(20) DEFAULT NULL,
  `fecha_nacimiento` date NOT NULL,
  `tipo_documento` varchar(20) NOT NULL,
  `numero_documento` varchar(20) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `telefono` varchar(25) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`id_contacto`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacto`
--

LOCK TABLES `contacto` WRITE;
/*!40000 ALTER TABLE `contacto` DISABLE KEYS */;
INSERT INTO `contacto` VALUES (1,'Gabriel','Guaimas','Masculino','1970-09-06','DNI','36.000.001','General Paz 87','+54387155000001','contacto1@correo.com'),(2,'Alberto','Guaimas','Masculino','1971-08-06','DNI','36.000.002','General Paz 86','+54387155000002','contacto2@correo.com'),(3,'Fernando','Guaimas','Masculino','1972-09-06','DNI','36.000.003','General Paz 85','+54387155000003','contacto3@correo.com'),(4,'Dario','Olivares','Masculino','1973-07-06','DNI','36.000.004','General Paz 84','+54387155000004','contacto4@correo.com'),(5,'Luis','Cuello','Masculino','1974-06-06','DNI','36.000.005','General Paz 83','+54387155000005','contacto5@correo.com'),(6,'Daniel','Lopez','Masculino','1975-05-06','DNI','36.000.006','General Paz 82','+54387155000006','contacto6@correo.com'),(7,'Maximiliano','Tolaba','Masculino','1976-04-06','DNI','36.000.007','General Paz 81','+54387155000007','contacto7@correo.com'),(8,'Matias','Granados','Masculino','1976-04-06','DNI','36.000.008','General Paz 80','+54387155000008','contacto8@correo.com'),(9,'Blanco','Cabo','Masculino','1977-04-06','DNI','36.000.009','General Paz 79','+54387155000009','contacto9@correo.com'),(10,'Lelia','Salum','Femenino','1980-03-06','DNI','36.000.010','General Paz 78','+54387155000010','contacto10@correo.com'),(11,'Leila','Guaymas','Femenino','1980-03-06','DNI','36.000.011','General Paz 77','+54387155000011','contacto11@correo.com'),(12,'Eliana','Salado','Femenino','1980-03-06','DNI','36.000.012','General Paz 76','+54387155000012','contacto12@correo.com'),(13,'Ely','Salum','Femenino','1980-02-06','DNI','36.000.013','General Paz 75','+54387155000013','contacto13@correo.com'),(14,'Soledad','Herrera','Femenino','1991-02-06','DNI','36.000.014','General Paz 74','+54387155000014','contacto14@correo.com'),(15,'Marina','Herrera','Femenino','1991-02-06','DNI','36.000.015','General Paz 73','+54387155000015','contacto15@correo.com'),(16,'Marcela','Socolich','Femenino','1991-12-06','DNI','36.000.016','General Paz 72','+54387155000016','contacto16@correo.com'),(17,'Mariana','Gonzales','Femenino','1992-12-06','DNI','36.000.017','General Paz 71','+54387155000017','contacto17@correo.com'),(18,'Marcos','Bernal','Otro','1992-11-06','DNI','36.000.018','General Paz 70','+54387155000018','contacto18@correo.com'),(19,'Macarena','Tolaba','Otro','1992-11-06','DNI','36.000.019','General Paz 69','+54387155000019','contacto19@correo.com'),(20,'Beatriz','Campos','Otro','1999-10-06','DNI','36.000.020','General Paz 68','+54387155000020','contacto20@correo.com'),(21,'Ramon','Andrade','Masculino','1999-09-06','DNI','36.000.021','General Paz 67','+54387155000021','contacto21@correo.com'),(22,'Adriana','Diaz','Femenino','2000-09-06','DNI','36.000.022','General Paz 66','+54387155000022','contacto22@correo.com'),(23,'Andres','Reinaga','Otro','2000-09-06','DNI','36.000.023','General Paz 65','+54387155000023','contacto23@correo.com'),(24,'Graciela','Galeano','Masculino','2000-09-06','DNI','36.000.024','General Paz 64','+54387155000024','contacto24@correo.com'),(25,'Nora','Cayo','Femenino','2005-09-06','DNI','36.000.025','General Paz 637','+54387155000025','contacto25@correo.com');
/*!40000 ALTER TABLE `contacto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_ingresos`
--

DROP TABLE IF EXISTS `detalle_ingresos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_ingresos` (
  `id_ingresos` int unsigned NOT NULL,
  `id_articulos` int unsigned NOT NULL,
  `cantidad` int NOT NULL,
  `precio_compra` decimal(11,2) NOT NULL,
  `precio_venta` decimal(11,2) NOT NULL,
  PRIMARY KEY (`id_ingresos`,`id_articulos`),
  KEY `fk_id_articulos_deting` (`id_articulos`),
  CONSTRAINT `fk_id_articulos_deting` FOREIGN KEY (`id_articulos`) REFERENCES `articulos` (`id_articulos`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_id_ingresos` FOREIGN KEY (`id_ingresos`) REFERENCES `ingresos` (`id_ingresos`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_ingresos`
--

LOCK TABLES `detalle_ingresos` WRITE;
/*!40000 ALTER TABLE `detalle_ingresos` DISABLE KEYS */;
INSERT INTO `detalle_ingresos` VALUES (1,1,50,80.00,120.50),(2,2,50,110.00,120.50),(3,3,50,200.00,220.50),(4,4,50,3000.00,3400.50),(5,5,50,500.00,550.50),(6,6,50,980.00,990.10),(7,7,50,24000.00,25000.00),(8,8,50,1600.00,120.50),(9,9,50,9000.00,10000.00),(10,10,50,3800.00,4000.00),(11,11,50,1150.00,1250.00),(12,12,50,1145.00,1345.00),(13,13,50,700.00,800.50),(14,14,50,6000.00,8000.00),(15,15,50,850.00,950.00),(16,16,50,30.70,35.70),(17,17,50,1.00,1.50),(18,18,50,70.00,80.00),(19,19,9,13000.00,14000.00);
/*!40000 ALTER TABLE `detalle_ingresos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_ventas`
--

DROP TABLE IF EXISTS `detalle_ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_ventas` (
  `id_articulos` int unsigned NOT NULL,
  `id_ventas` int unsigned NOT NULL,
  `cantidad` int unsigned NOT NULL,
  `precio_ventas` decimal(11,2) NOT NULL,
  `descuento` decimal(11,2) DEFAULT NULL,
  PRIMARY KEY (`id_articulos`,`id_ventas`),
  KEY `fk_id_ventas` (`id_ventas`),
  CONSTRAINT `fk_id_articulos_detventas` FOREIGN KEY (`id_articulos`) REFERENCES `articulos` (`id_articulos`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_id_ventas` FOREIGN KEY (`id_ventas`) REFERENCES `ventas` (`id_ventas`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_ventas`
--

LOCK TABLES `detalle_ventas` WRITE;
/*!40000 ALTER TABLE `detalle_ventas` DISABLE KEYS */;
INSERT INTO `detalle_ventas` VALUES (1,20,2,11.00,NULL),(2,19,4,50.87,1.00),(3,18,6,1250.36,120.00),(4,17,8,3100.50,NULL),(5,16,10,19.54,NULL),(6,15,1,4000.54,150.00),(7,14,3,1360.00,NULL),(8,13,5,500.36,50.00),(9,12,7,10000.00,1000.00),(10,11,9,5.39,NULL),(11,10,2,254.19,1.20),(12,9,3,451.30,1.25),(13,8,4,1500.00,NULL),(14,7,5,1789.10,148.00),(15,6,6,14000.34,12.32),(16,5,7,25000.00,2500.00),(17,4,8,45.20,NULL),(18,3,9,5.21,NULL),(19,2,10,1345.36,2.30),(20,1,11,1.25,0.25);
/*!40000 ALTER TABLE `detalle_ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `empleado_supremo`
--

DROP TABLE IF EXISTS `empleado_supremo`;
/*!50001 DROP VIEW IF EXISTS `empleado_supremo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `empleado_supremo` AS SELECT 
 1 AS `Nombre Empleado`,
 1 AS `Cantidad Ventas Supremo Vendedor`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `id_empleados` int unsigned NOT NULL AUTO_INCREMENT,
  `id_contacto` int unsigned NOT NULL,
  `usuario` varchar(25) NOT NULL,
  `contrasena` varbinary(255) DEFAULT NULL,
  PRIMARY KEY (`id_empleados`),
  KEY `fk_id_contacto_empleados` (`id_contacto`),
  CONSTRAINT `fk_id_contacto_empleados` FOREIGN KEY (`id_contacto`) REFERENCES `contacto` (`id_contacto`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (1,21,'Usuario1',_binary 'Contrasena1'),(2,22,'Usuario2',_binary 'Contrasena2'),(3,23,'Usuario3',_binary 'Contrasena3'),(4,24,'Usuario4',_binary 'Contrasena4'),(5,25,'Usuario5',_binary 'Contrasena5');
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingresos`
--

DROP TABLE IF EXISTS `ingresos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingresos` (
  `id_ingresos` int unsigned NOT NULL AUTO_INCREMENT,
  `id_empleados` int unsigned NOT NULL,
  `id_proveedores` int unsigned NOT NULL,
  `fecha_ingreso` datetime NOT NULL,
  `tipo_comprobante` varchar(20) NOT NULL,
  PRIMARY KEY (`id_ingresos`),
  KEY `fk_id_empleados_ingresos` (`id_empleados`),
  KEY `fk_id_proveedores` (`id_proveedores`),
  CONSTRAINT `fk_id_empleados_ingresos` FOREIGN KEY (`id_empleados`) REFERENCES `empleados` (`id_empleados`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_id_proveedores` FOREIGN KEY (`id_proveedores`) REFERENCES `proveedores` (`id_proveedores`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingresos`
--

LOCK TABLES `ingresos` WRITE;
/*!40000 ALTER TABLE `ingresos` DISABLE KEYS */;
INSERT INTO `ingresos` VALUES (1,1,1,'2022-02-15 15:25:08','Factura A'),(2,2,1,'2021-02-17 15:25:08','Factura A'),(3,3,2,'2020-02-16 15:25:08','Factura A'),(4,4,3,'2020-02-15 15:25:08','Factura A'),(5,5,4,'2019-02-17 15:25:08','Factura A'),(6,1,5,'2019-02-16 15:25:08','Factura A'),(7,2,6,'2019-02-15 15:25:08','Factura A'),(8,3,7,'2018-02-17 15:25:08','Factura A'),(9,4,8,'2018-02-16 15:25:08','Factura A'),(10,5,9,'2018-02-15 15:25:08','Factura A'),(11,1,10,'2017-02-17 15:25:08','Factura A'),(12,2,11,'2017-02-16 15:25:08','Factura A'),(13,3,1,'2017-02-15 15:25:08','Factura A'),(14,4,2,'2016-02-17 15:25:08','Factura A'),(15,5,3,'2016-02-16 15:25:08','Factura A'),(16,1,4,'2016-02-15 15:25:08','Factura A'),(17,2,5,'2015-02-17 15:25:08','Factura A'),(18,3,6,'2015-02-16 15:25:08','Factura A'),(19,4,7,'2015-02-15 15:25:08','Factura A');
/*!40000 ALTER TABLE `ingresos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_articulos`
--

DROP TABLE IF EXISTS `log_articulos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_articulos` (
  `log_id_articulos` int unsigned NOT NULL AUTO_INCREMENT,
  `art_precio` decimal(11,2) NOT NULL,
  `art_precio_nuevo` decimal(11,2) NOT NULL,
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `usuario` char(20) DEFAULT NULL,
  PRIMARY KEY (`log_id_articulos`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_articulos`
--

LOCK TABLES `log_articulos` WRITE;
/*!40000 ALTER TABLE `log_articulos` DISABLE KEYS */;
INSERT INTO `log_articulos` VALUES (1,420.00,567.00,'2022-09-08 11:28:20','root@localhost');
/*!40000 ALTER TABLE `log_articulos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_proveedores`
--

DROP TABLE IF EXISTS `log_proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_proveedores` (
  `log_id_proveedores` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `usuario` char(20) DEFAULT NULL,
  PRIMARY KEY (`log_id_proveedores`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_proveedores`
--

LOCK TABLES `log_proveedores` WRITE;
/*!40000 ALTER TABLE `log_proveedores` DISABLE KEYS */;
INSERT INTO `log_proveedores` VALUES (1,'2022-09-08 02:02:22','root@localhost'),(2,'2022-09-08 02:02:22','root@localhost'),(3,'2022-09-08 02:02:22','root@localhost'),(4,'2022-09-08 02:02:22','root@localhost'),(5,'2022-09-08 02:02:22','root@localhost'),(6,'2022-09-08 02:02:22','root@localhost'),(7,'2022-09-08 02:02:22','root@localhost'),(8,'2022-09-08 02:02:22','root@localhost'),(9,'2022-09-08 02:02:22','root@localhost'),(10,'2022-09-08 02:02:22','root@localhost'),(11,'2022-09-08 02:02:22','root@localhost'),(12,'2022-09-08 11:31:36','root@localhost');
/*!40000 ALTER TABLE `log_proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `margen_ganancias`
--

DROP TABLE IF EXISTS `margen_ganancias`;
/*!50001 DROP VIEW IF EXISTS `margen_ganancias`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `margen_ganancias` AS SELECT 
 1 AS `Nombre del Proveedor`,
 1 AS `Mayor margen de Ganancias`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mas_vendidos`
--

DROP TABLE IF EXISTS `mas_vendidos`;
/*!50001 DROP VIEW IF EXISTS `mas_vendidos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `mas_vendidos` AS SELECT 
 1 AS `Articulo`,
 1 AS `Cantidad de productos vendidos`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `id_proveedores` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) NOT NULL,
  `razon_social` varchar(25) NOT NULL,
  `tipo_documento` varchar(20) NOT NULL,
  `numero_documento` varchar(20) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `telefono` varchar(25) NOT NULL,
  `email` varchar(50) NOT NULL,
  `web` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_proveedores`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'Nombre 1','Responsable Inscripto','CUIT','20-00000000-1','Caseros 1234','3016250517','proveedor1@proveedores.com','www.proveedor1.com'),(2,'Nombre 2','Responsable Inscripto','CUIT','20-00000001-1','Espana 1234','2476176979','proveedor2@proveedores.com','www.proveedor2.com'),(3,'Nombre 3','Responsable Inscripto','CUIT','20-00000002-1','Vicente Lopez 1234','1364747072','proveedor3@proveedores.com','www.proveedor3.com'),(4,'Nombre 4','Responsable Inscripto','CUIT','20-00000003-1','Virrey Toledo 1234','3738763285','proveedor4@proveedores.com','www.proveedor4.com'),(5,'Nombre 5','Responsable Inscripto','CUIT','20-00000004-1','Alvarado 1234','3241613739','proveedor5@proveedores.com','www.proveedor5.com'),(6,'Nombre 6','Responsable Inscripto','CUIT','20-00000005-1','San Martin 1234','1334971698','proveedor6@proveedores.com','www.proveedor6.com'),(7,'Nombre 7','Responsable Inscripto','CUIT','20-00000006-1','Urquiza 1234','2286818454','proveedor7@proveedores.com','www.proveedor7.com'),(8,'Nombre 8','Responsable Inscripto','CUIT','20-00000007-1','Chubut 1234','3491286148','proveedor8@proveedores.com','www.proveedor8.com'),(9,'Nombre 9','Monotributista','CUIT','20-00000008-1','Corrientes 1234','126524238','proveedor9@proveedores.com','www.proveedor9.com'),(10,'Nombre 10','Monotributista','CUIT','20-00000009-1','Jujuy 1234','553503324','proveedor10@proveedores.com','www.proveedor10.com'),(11,'Nombre 11','Monotributista','CUIT','20-00000010-1','Misiones 1234','1822978151','proveedor11@proveedores.com',NULL),(12,'Nombre 12','Monotributista','CUIT','20-00000012-1','Peron 1234','553503384','proveedor12@proveedores.com','www.proveedor12.com');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_log_proveedores` AFTER INSERT ON `proveedores` FOR EACH ROW BEGIN
        INSERT INTO log_proveedores(usuario)
        VALUES(SESSION_USER());
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `id_ventas` int unsigned NOT NULL AUTO_INCREMENT,
  `id_clientes` int unsigned NOT NULL,
  `id_empleados` int unsigned NOT NULL,
  `fecha_venta` datetime NOT NULL,
  `tipo_comprobante` varchar(20) NOT NULL,
  PRIMARY KEY (`id_ventas`),
  KEY `fk_id_clientes` (`id_clientes`),
  KEY `fk_id_empleados_ventas` (`id_empleados`),
  CONSTRAINT `fk_id_clientes` FOREIGN KEY (`id_clientes`) REFERENCES `clientes` (`id_clientes`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_id_empleados_ventas` FOREIGN KEY (`id_empleados`) REFERENCES `empleados` (`id_empleados`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (1,1,1,'2021-06-17 19:25:08','Factura A'),(2,2,1,'2021-06-17 18:25:08','Factura A'),(3,3,3,'2020-06-17 17:25:08','Factura A'),(4,4,4,'2019-06-17 16:25:08','Factura B'),(5,5,5,'2018-06-17 15:25:08','Factura B'),(6,6,1,'2017-06-17 14:25:08','Factura C'),(7,7,2,'2016-06-17 13:25:08','Factura B'),(8,8,3,'2021-05-17 12:25:08','Factura A'),(9,9,4,'2021-04-17 11:25:08','Factura C'),(10,10,5,'2021-03-17 10:25:08','Factura A'),(11,11,1,'2018-02-17 09:25:08','Factura A'),(12,12,2,'2017-01-17 08:25:08','Factura C'),(13,13,3,'2016-12-17 07:25:08','Factura B'),(14,14,4,'2015-11-17 19:25:08','Factura C'),(15,15,5,'2014-11-17 20:25:08','Factura X'),(16,16,1,'2015-11-17 21:25:08','Factura A'),(17,17,2,'2018-05-17 22:25:08','Factura X'),(18,18,3,'2018-04-17 22:25:08','Factura A'),(19,19,4,'2017-03-17 16:25:08','Factura X'),(20,20,5,'2017-02-17 15:25:08','Remito');
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `view_ganancias`
--

DROP TABLE IF EXISTS `view_ganancias`;
/*!50001 DROP VIEW IF EXISTS `view_ganancias`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_ganancias` AS SELECT 
 1 AS `Articulo`,
 1 AS `Precio de Compra`,
 1 AS `Precio de Venta`,
 1 AS `Ganancias`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'drugstore24'
--

--
-- Dumping routines for database 'drugstore24'
--
/*!50003 DROP FUNCTION IF EXISTS `func_calcularGanancias` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `func_calcularGanancias`(costo FLOAT, precio FLOAT) RETURNS decimal(9,2)
    DETERMINISTIC
BEGIN   
        DECLARE ganancias DECIMAL (9,2);
        SET ganancias = costo - precio;
        RETURN ganancias;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `func_cantvent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `func_cantvent`(param_categoria VARCHAR(20)) RETURNS int
    READS SQL DATA
BEGIN   
        DECLARE cantidadventas INT;

        SELECT SUM(DV.cantidad) INTO cantidadventas
        FROM detalle_ventas DV    
			JOIN articulos A
		ON A.id_articulos = DV.id_articulos
			JOIN categorias Cat 
		ON Cat.id_categorias = A.id_categorias
		WHERE Cat.nombre = param_categoria;
        
        RETURN cantidadventas;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pr_insert_prov` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pr_insert_prov`(IN pr_id_proveedores INT, IN pr_nombre VARCHAR(25), IN pr_razon_social VARCHAR(25), IN pr_tipo_documento VARCHAR(20), 
IN pr_numero_documento VARCHAR(20), IN pr_direccion VARCHAR(50), IN pr_telefono VARCHAR(25), IN pr_email VARCHAR(50), IN pr_web VARCHAR(30))
BEGIN   
        INSERT INTO proveedores(id_proveedores, nombre, razon_social, tipo_documento, numero_documento, direccion, telefono, email, web)
        VALUES (pr_id_proveedores, pr_nombre, pr_razon_social, pr_tipo_documento, pr_numero_documento, pr_direccion, pr_telefono, pr_email, pr_web);
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pr_limite_stock` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pr_limite_stock`()
BEGIN   
        SELECT Ar.codigo, Ar.nombre, dig.cantidad
        FROM detalle_ingresos dig
	    	JOIN articulos Ar
	    ON dig.id_articulos = Ar.id_articulos
             WHERE dig.cantidad<=10;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `articulos_precios_altos`
--

/*!50001 DROP VIEW IF EXISTS `articulos_precios_altos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `articulos_precios_altos` AS select `c`.`nombre` AS `Nombre de categorias`,`a`.`art_precio` AS `Precio de Articulos` from (`categorias` `c` join `articulos` `a` on((`c`.`id_categorias` = `a`.`id_categorias`))) group by `c`.`nombre`,`a`.`art_precio` having (`a`.`art_precio` > 1000) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `clientes_premiados`
--

/*!50001 DROP VIEW IF EXISTS `clientes_premiados`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `clientes_premiados` AS select concat(`cont`.`nombres`,' ',`cont`.`apellidos`) AS `Nombre Cliente`,`cont`.`telefono` AS `Numero de Telefono`,`ven`.`fecha_venta` AS `Fecha de venta` from ((`clientes` `cli` join `contacto` `cont` on((`cli`.`id_contacto` = `cont`.`id_contacto`))) join `ventas` `ven` on((`ven`.`id_clientes` = `cli`.`id_clientes`))) order by `ven`.`fecha_venta` desc limit 2 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `empleado_supremo`
--

/*!50001 DROP VIEW IF EXISTS `empleado_supremo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `empleado_supremo` AS select (select distinct concat(`c`.`nombres`,' ',`c`.`apellidos`)) AS `Nombre Empleado`,count(distinct `v`.`id_empleados`) AS `Cantidad Ventas Supremo Vendedor` from ((`empleados` `e` join `ventas` `v` on((`e`.`id_empleados` = `v`.`id_empleados`))) join `contacto` `c` on((`e`.`id_contacto` = `c`.`id_contacto`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `margen_ganancias`
--

/*!50001 DROP VIEW IF EXISTS `margen_ganancias`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `margen_ganancias` AS select `p`.`nombre` AS `Nombre del Proveedor`,max((`ding`.`precio_venta` - `ding`.`precio_compra`)) AS `Mayor margen de Ganancias` from ((`proveedores` `p` join `ingresos` `i` on((`p`.`id_proveedores` = `i`.`id_proveedores`))) join `detalle_ingresos` `ding` on((`ding`.`id_ingresos` = `i`.`id_ingresos`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mas_vendidos`
--

/*!50001 DROP VIEW IF EXISTS `mas_vendidos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mas_vendidos` AS select `a`.`nombre` AS `Articulo`,`dv`.`cantidad` AS `Cantidad de productos vendidos` from (`detalle_ventas` `dv` join `articulos` `a` on((`a`.`id_articulos` = `dv`.`id_articulos`))) order by `dv`.`cantidad` desc limit 5 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_ganancias`
--

/*!50001 DROP VIEW IF EXISTS `view_ganancias`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_ganancias` AS select `arti`.`nombre` AS `Articulo`,`ing`.`precio_compra` AS `Precio de Compra`,`ing`.`precio_venta` AS `Precio de Venta`,`func_calcularGanancias`(`ing`.`precio_venta`,`ing`.`precio_compra`) AS `Ganancias` from (`detalle_ingresos` `ing` join `articulos` `arti` on((`ing`.`id_articulos` = `arti`.`id_articulos`))) order by `arti`.`nombre` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-14 18:50:40
