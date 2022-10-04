/* Base de datos proyecto final - Drugstore 24 horas */

-- Esquema de inserción de datos para Drugstore24.sql 
-- Version 1.0 Año 2022
-- Creado como proyecto Final para CODERHOUSE
-- Tutor: Sergio Occhipinti
-- Profesor: Cesar Aracena

-- * Aclaraciones:
-- Este documento fue escrito paso a paso usando como ejemplo el
-- archivo sakila-data.sql y comprendiendo cada una de las
-- partes que componen  el código abajo escrito.
-- * Este documento fue confeccionado unicamente con fines 
-- educativos y no representa una base de datos real ni
-- totalmente funcional. No debe usarse de ninguna manera para
-- fines lucrativos reales.

-- Carga de datos de tablas Drugstore24

SET NAMES utf8mb4;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @old_autocommit=@@autocommit;


-- Se llama a la base de datos Drugstore24

USE Drugstore24;

/*

    Se hace uso del lenguaje TCL para la insercion de los datos en las tablas.

*/

--
-- Volcado de datos para la tabla 'Contacto'
-- VALUES (id_contacto, nombres, apellidos, sexo, fecha_nacimiento, tipo_documento, numero_documento, direccion, telefono, email)
--

SET AUTOCOMMIT=0;
INSERT INTO contacto VALUES 
(1,'Gabriel','Guaimas', 'Masculino', '1970-09-06','DNI','36.000.001','General Paz 87','+54387155000001','contacto1@correo.com'),
(2,'Alberto','Guaimas', 'Masculino', '1971-08-06','DNI','36.000.002','General Paz 86','+54387155000002','contacto2@correo.com'),
(3,'Fernando','Guaimas', 'Masculino', '1972-09-06','DNI','36.000.003','General Paz 85','+54387155000003','contacto3@correo.com'),
(4,'Dario','Olivares', 'Masculino', '1973-07-06','DNI','36.000.004','General Paz 84','+54387155000004','contacto4@correo.com'),
(5,'Luis','Cuello', 'Masculino', '1974-06-06','DNI','36.000.005','General Paz 83','+54387155000005','contacto5@correo.com'),
(6,'Daniel','Lopez', 'Masculino', '1975-05-06','DNI','36.000.006','General Paz 82','+54387155000006','contacto6@correo.com'),
(7,'Maximiliano','Tolaba', 'Masculino', '1976-04-06','DNI','36.000.007','General Paz 81','+54387155000007','contacto7@correo.com'),
(8,'Matias','Granados', 'Masculino', '1976-04-06','DNI','36.000.008','General Paz 80','+54387155000008','contacto8@correo.com'),
(9,'Blanco','Cabo', 'Masculino', '1977-04-06','DNI','36.000.009','General Paz 79','+54387155000009','contacto9@correo.com'),
(10,'Lelia','Salum', 'Femenino', '1980-03-06','DNI','36.000.010','General Paz 78','+54387155000010','contacto10@correo.com'),
(11,'Leila','Guaymas', 'Femenino', '1980-03-06','DNI','36.000.011','General Paz 77','+54387155000011','contacto11@correo.com'),
(12,'Eliana','Salado', 'Femenino', '1980-03-06','DNI','36.000.012','General Paz 76','+54387155000012','contacto12@correo.com'),
(13,'Ely','Salum', 'Femenino', '1980-02-06','DNI','36.000.013','General Paz 75','+54387155000013','contacto13@correo.com'),
(14,'Soledad','Herrera', 'Femenino', '1991-02-06','DNI','36.000.014','General Paz 74','+54387155000014','contacto14@correo.com'),
(15,'Marina','Herrera', 'Femenino', '1991-02-06','DNI','36.000.015','General Paz 73','+54387155000015','contacto15@correo.com'),
(16,'Marcela','Socolich', 'Femenino', '1991-12-06','DNI','36.000.016','General Paz 72','+54387155000016','contacto16@correo.com'),
(17,'Mariana','Gonzales', 'Femenino', '1992-12-06','DNI','36.000.017','General Paz 71','+54387155000017','contacto17@correo.com'),
(18,'Marcos','Bernal', 'Otro', '1992-11-06','DNI','36.000.018','General Paz 70','+54387155000018','contacto18@correo.com'),
(19,'Macarena','Tolaba', 'Otro', '1992-11-06','DNI','36.000.019','General Paz 69','+54387155000019','contacto19@correo.com'),
(20,'Beatriz','Campos', 'Otro', '1999-10-06','DNI','36.000.020','General Paz 68','+54387155000020','contacto20@correo.com'),
(21,'Ramon','Andrade', 'Masculino', '1999-09-06','DNI','36.000.021','General Paz 67','+54387155000021','contacto21@correo.com'),
(22,'Adriana','Diaz', 'Femenino', '2000-09-06','DNI','36.000.022','General Paz 66','+54387155000022','contacto22@correo.com'),
(23,'Andres','Reinaga', 'Otro', '2000-09-06','DNI','36.000.023','General Paz 65','+54387155000023','contacto23@correo.com'),
(24,'Graciela','Galeano', 'Masculino', '2000-09-06','DNI','36.000.024','General Paz 64','+54387155000024','contacto24@correo.com'),
(25,'Nora','Cayo', 'Femenino', '2005-09-06','DNI','36.000.025','General Paz 637','+54387155000025','contacto25@correo.com');
COMMIT;


--
-- Volcado de datos para la tabla 'Clientes'
-- VALUES (id_clientes, id_contacto)
--

SET AUTOCOMMIT=0;
INSERT INTO clientes VALUES (1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9),
(10,10),
(11,11),
(12,12),
(13,13),
(14,14),
(15,15),
(16,16),
(17,17),
(18,18),
(19,19),
(20,20);
COMMIT;


--
-- Volcado de datos para la tabla 'Ventas'
-- VALUES (id_ventas, id_clientes, id_empleados, fecha_venta, tipo_comprobante)
--

SET AUTOCOMMIT=0;
INSERT INTO ventas VALUES (1,1,1,'2021-06-17 19:25:08', 'Factura A'),
(2,2,1,'2021-06-17 18:25:08', 'Factura A'),
(3,3,3,'2020-06-17 17:25:08', 'Factura A'),
(4,4,4,'2019-06-17 16:25:08', 'Factura B'),
(5,5,5,'2018-06-17 15:25:08', 'Factura B'),
(6,6,1,'2017-06-17 14:25:08', 'Factura C'),
(7,7,2,'2016-06-17 13:25:08', 'Factura B'),
(8,8,3,'2021-05-17 12:25:08', 'Factura A'),
(9,9,4,'2021-04-17 11:25:08', 'Factura C'),
(10,10,5,'2021-03-17 10:25:08', 'Factura A'),
(11,11,1,'2018-02-17 09:25:08', 'Factura A'),
(12,12,2,'2017-01-17 08:25:08', 'Factura C'),
(13,13,3,'2016-12-17 07:25:08', 'Factura B'),
(14,14,4,'2015-11-17 19:25:08', 'Factura C'),
(15,15,5,'2014-11-17 20:25:08', 'Factura X'),
(16,16,1,'2015-11-17 21:25:08', 'Factura A'),
(17,17,2,'2018-05-17 22:25:08', 'Factura X'),
(18,18,3,'2018-04-17 22:25:08', 'Factura A'),
(19,19,4,'2017-03-17 16:25:08', 'Factura X'),
(20,20,5,'2017-02-17 15:25:08', 'Remito');
COMMIT;


--
-- Volcado de datos para la tabla 'Empleados'
-- VALUES (id_empleados, id_contacto, usuario, contrasena)
--

SET AUTOCOMMIT=0;
INSERT INTO empleados VALUES (1,21,'Usuario1','Contrasena1'),
(2,22,'Usuario2','Contrasena2'),
(3,23,'Usuario3','Contrasena3'),
(4,24,'Usuario4','Contrasena4'),
(5,25,'Usuario5','Contrasena5');
COMMIT;


--
-- Volcado de datos para la tabla 'Detalle_Ventas'
-- VALUES (id_articulos, id_ventas, cantidad, precio_ventas, descuento)
--

SET AUTOCOMMIT=0;
INSERT INTO detalle_ventas VALUES (1,20,2,'11.00',NULL),
(2,19,4,'50.87', '1.00'),
(3,18,6,'1250.36','120.00'),
(4,17,8,'3100.50',NULL),
(5,16,10,'19.54',NULL),
(6,15,1,'4000.54','150.00'),
(7,14,3,'1360.00',NULL),
(8,13,5,'500.36','50.00'),
(9,12,7,'10000.00', '1000.00'),
(10,11,9,'5.39',NULL),
(11,10,2,'254.19','1.20'),
(12,9,3,'451.30','1.25'),
(13,8,4,'1500.00',NULL),
(14,7,5,'1789.10','148.00'),
(15,6,6,'14000.34','12.32'),
(16,5,7,'25000.00','2500.00'),
(17,4,8,'45.20',NULL),
(18,3,9,'5.21',NULL),
(19,2,10,'1345.36','2.30'),
(20,1,11,'1.25','0.25');
COMMIT;


--
-- Volcado de datos para la tabla 'Proveedores'
-- VALUES (id_proveedores, nombre, razon_social, tipo_documento, numero_documento, direccion, telefono, email, web)
--

SET AUTOCOMMIT=0;
INSERT INTO proveedores VALUES 
(1,'Nombre 1','Responsable Inscripto','CUIT','20-00000000-1','Caseros 1234',3016250517,'proveedor1@proveedores.com','www.proveedor1.com'),
(2,'Nombre 2','Responsable Inscripto','CUIT','20-00000001-1','Espana 1234',2476176979,'proveedor2@proveedores.com','www.proveedor2.com'),
(3,'Nombre 3','Responsable Inscripto','CUIT','20-00000002-1','Vicente Lopez 1234',1364747072,'proveedor3@proveedores.com','www.proveedor3.com'),
(4,'Nombre 4','Responsable Inscripto','CUIT','20-00000003-1','Virrey Toledo 1234',3738763285,'proveedor4@proveedores.com','www.proveedor4.com'),
(5,'Nombre 5','Responsable Inscripto','CUIT','20-00000004-1','Alvarado 1234',3241613739,'proveedor5@proveedores.com','www.proveedor5.com'),
(6,'Nombre 6','Responsable Inscripto','CUIT','20-00000005-1','San Martin 1234',1334971698,'proveedor6@proveedores.com','www.proveedor6.com'),
(7,'Nombre 7','Responsable Inscripto','CUIT','20-00000006-1','Urquiza 1234',2286818454,'proveedor7@proveedores.com','www.proveedor7.com'),
(8,'Nombre 8','Responsable Inscripto','CUIT','20-00000007-1','Chubut 1234',3491286148,'proveedor8@proveedores.com','www.proveedor8.com'),
(9,'Nombre 9','Monotributista','CUIT','20-00000008-1','Corrientes 1234',126524238,'proveedor9@proveedores.com','www.proveedor9.com'),
(10,'Nombre 10','Monotributista','CUIT','20-00000009-1','Jujuy 1234',553503324,'proveedor10@proveedores.com','www.proveedor10.com'),
(11,'Nombre 11','Monotributista','CUIT','20-00000010-1','Misiones 1234',1822978151,'proveedor11@proveedores.com',NULL);
COMMIT;


--
-- Volcado de datos para la tabla 'Ingresos'
-- VALUES (id_ingresos, id_empleados, id_proveedores, fecha_ingreso, tipo_comprobante)
--

SET AUTOCOMMIT=0;
INSERT INTO ingresos VALUES (1,1,1,'2022-02-15 15:25:08','Factura A'),
(2,2,1,'2021-02-17 15:25:08','Factura A'),
(3,3,2,'2020-02-16 15:25:08','Factura A'),
(4,4,3,'2020-02-15 15:25:08','Factura A'),
(5,5,4,'2019-02-17 15:25:08','Factura A'),
(6,1,5,'2019-02-16 15:25:08','Factura A'),
(7,2,6,'2019-02-15 15:25:08','Factura A'),
(8,3,7,'2018-02-17 15:25:08','Factura A'),
(9,4,8,'2018-02-16 15:25:08','Factura A'),
(10,5,9,'2018-02-15 15:25:08','Factura A'),
(11,1,10,'2017-02-17 15:25:08','Factura A'),
(12,2,11,'2017-02-16 15:25:08','Factura A'),
(13,3,1,'2017-02-15 15:25:08','Factura A'),
(14,4,2,'2016-02-17 15:25:08','Factura A'),
(15,5,3,'2016-02-16 15:25:08','Factura A'),
(16,1,4,'2016-02-15 15:25:08','Factura A'),
(17,2,5,'2015-02-17 15:25:08','Factura A'),
(18,3,6,'2015-02-16 15:25:08','Factura A'),
(19,4,7,'2015-02-15 15:25:08','Factura A');
COMMIT;


--
-- Volcado de datos para la tabla 'Detalle_Ingresos'
-- VALUES (id_detalle_ingresos, id_ingresos, id_articulos, cantidad, precio_compra, precio_venta)
--

SET AUTOCOMMIT=0;
INSERT INTO detalle_ingresos VALUES (1,1,50,'80.00','120.50'),
(2,2,50,'110.00','120.50'),
(3,3,50,'200.00','220.50'),
(4,4,50,'3000.00','3400.50'),
(5,5,50,'500.00','550.50'),
(6,6,50,'980.00','990.10'),
(7,7,50,'24000.00','25000.00'),
(8,8,50,'1600.00','120.50'),
(9,9,50,'9000.00','10000.00'),
(10,10,50,'3800.00','4000.00'),
(11,11,50,'1150.00','1250.00'),
(12,12,50,'1145.00','1345.00'),
(13,13,50,'700.00','800.50'),
(14,14,50,'6000.00','8000.00'),
(15,15,50,'850.00','950.00'),
(16,16,50,'30.70','35.70'),
(17,17,50,'1.00','1.50'),
(18,18,50,'70.00','80.00'),
(19,19,9,'13000.00','14000.00');
COMMIT;


--
-- Volcado de datos para la tabla 'Articulos'
-- VALUES (id_articulos, id_categorias, codigo, nombre, descripcion, art_precio)
--

SET AUTOCOMMIT=0;
INSERT INTO articulos VALUES (1,11,'30000','Yerba','Yerba Mate la tranquera Naranja','500.00'),
(2,1,'30001','Tortillas','Tortillas de grasa por kilo','200.00'),
(3,1,'30002','Pan Frances','Pan frances por kilo','250.00'),
(4,1,'30003','Facturas','Facturas de manteca por docena','450.00'),
(5,2,'30004','Jabon para bebe','Jabon para bebe aroma a rosas','320.50'),
(6,2,'30005','Crema Humectante','Crema humectante para pieles oleosas','3200.00'),
(7,2,'30006','Cepillo de dientes OdontoFull','Cepillo de dientes','600.00'),
(8,3,'30007','Gaseosa de granadina','Bebida carbonatada sabor granadina','200.00'),
(9,3,'30008','Vino Rosado','Vino Rosado','420.00'),
(10,3,'30009','Agua en botella','Agua en botella x 1 Litro','100.00'),
(11,4,'30010','Aceite Farolito','Aceite de maiz x 900 ml','180.56'),
(12,4,'30011','Aceite de Oliva','Aceite de oliva Extra Virgen x 500ml','820.35'),
(13,5,'30012','Lavandina','Lavandina x 1 Litro','260.33'),
(14,5,'30013','Trapo de piso','Trapo de piso 45 x 80 cm','50.25'),
(15,6,'30014','Alimento para Perros','Alimento para perros sabor carne x 10kg','2350.00'),
(16,6,'30015','Alimento para Gatos','Alimento para gatos sabor atun x 10kg','3200.00'),
(17,7,'30016','Pizza congelada','Pizza de peperonni','650.14'),
(18,7,'30017','Helado','Helado de 3 sabores x 3 Litros','542.36'),
(19,8,'30018','Atun Fresco','Atun premium x 1kg','320.25'),
(20,8,'30019','Salmon Rosado','Salmon Rosado x 1kg','2600.48'),
(21,9,'30020','Bife Ancho','Corte de carne vacuna x kg','900.00'),
(22,9,'30021','Costilla de Cerdo','Costilla de cerdo x kg','1200.36'),
(23,10,'30022','Atun en lata','Atun en lata desmenuzado','365.20'),
(24,10,'30023','Palmitos en lata','Palmitos enlatados en agua x 300gr','400.00'),
(25,11,'30024','Fideos Monito','Fideos monito para guiso x 500gr','80.00'),
(26,11,'30025','Harina 0000','Harina de panaderia 0000','120.50'),
(27,12,'30026','Bicicleta para niño','Bicicleta para niño/a rodado 20 6 velocidades','40000.00'),
(28,12,'30027','Set de futbol','Juego de futbol (Arco + Red + 3 pelotas + guantes de arquero','14000.00');
COMMIT;


--
-- Volcado de datos para la tabla 'Categorias'
-- VALUES (id_categorias, nombre, descripcion)
--

SET AUTOCOMMIT=0;
INSERT INTO categorias VALUES (1,'Panaderia',''),
(2,'Belleza e higiene',''),
(3,'Bebidas',''),
(4,'Conservas y aceites',''),
(5,'Limpieza',''),
(6,'Mascotas',''),
(7,'Congelados',''),
(8,'Pescaderia',''),
(9,'Carniceria',''),
(10,'Enlatados',''),
(11,'Comestibles',''),
(12,'Jugueteria',''),
(13,'Hogar',''),
(14,'Electronicos','');
COMMIT;



SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET autocommit=@old_autocommit;