/* Base de datos proyecto final - Drugstore 24 horas */

-- Esquema de base de datos para Drugstore24.sql 
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

-- Creando la Base de Datos Drugstore24

SET NAMES utf8mb4;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;


DROP SCHEMA IF EXISTS Drugstore24;
CREATE SCHEMA Drugstore24;

-- Se llama a la base de datos Drugstore24

USE Drugstore24;

--
-- Estructura para tabla 'Clientes'
--

CREATE TABLE clientes (
	id_clientes INT UNSIGNED NOT NULL AUTO_INCREMENT,
    id_contacto INT UNSIGNED NOT NULL,
    PRIMARY KEY (id_clientes),
    CONSTRAINT fk_id_contacto_clientes FOREIGN KEY (id_contacto) REFERENCES contacto (id_contacto) ON DELETE RESTRICT ON UPDATE CASCADE
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    

--
-- Estructura para tabla 'Ventas'
--

CREATE TABLE ventas (
	id_ventas INT UNSIGNED NOT NULL AUTO_INCREMENT,
    id_clientes INT UNSIGNED NOT NULL,
    id_empleados INT UNSIGNED NOT NULL,
    fecha_venta DATETIME NOT NULL,
    tipo_comprobante VARCHAR(20) NOT NULL,
    PRIMARY KEY (id_ventas),
    CONSTRAINT fk_id_clientes FOREIGN KEY (id_clientes) REFERENCES clientes (id_clientes) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_id_empleados_ventas FOREIGN KEY (id_empleados) REFERENCES empleados (id_empleados) ON DELETE RESTRICT ON UPDATE CASCADE
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    

--  
-- Estructura para tabla 'Empleados'
--

CREATE TABLE empleados (
	id_empleados INT UNSIGNED NOT NULL AUTO_INCREMENT,
    id_contacto INT UNSIGNED NOT NULL,
    usuario VARCHAR(25) NOT NULL,
    contrasena VARBINARY(255),
    PRIMARY KEY (id_empleados),
    CONSTRAINT fk_id_contacto_empleados FOREIGN KEY (id_contacto) REFERENCES contacto (id_contacto) ON DELETE RESTRICT ON UPDATE CASCADE
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


--  
-- Estructura para tabla 'Detalle_Ventas'
--

CREATE TABLE detalle_ventas (
	id_articulos INT UNSIGNED NOT NULL,
    id_ventas INT UNSIGNED NOT NULL,
    cantidad INT UNSIGNED NOT NULL,
    precio_ventas DECIMAL(11,2) NOT NULL,
    descuento DECIMAL(11,2),
    PRIMARY KEY (id_articulos, id_ventas),
    CONSTRAINT fk_id_articulos_detventas FOREIGN KEY (id_articulos) REFERENCES articulos (id_articulos) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_id_ventas FOREIGN KEY (id_ventas) REFERENCES ventas (id_ventas) ON DELETE RESTRICT ON UPDATE CASCADE
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    
    
--   
-- Estructura para tabla 'Proveedores'
--

CREATE TABLE proveedores (
	id_proveedores INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(25) NOT NULL,
    razon_social VARCHAR(25) NOT NULL,
    tipo_documento VARCHAR(20) NOT NULL,
    numero_documento VARCHAR(20) NOT NULL,
    direccion VARCHAR(50) NOT NULL,
    telefono VARCHAR(25) NOT NULL,
    email VARCHAR(50) NOT NULL,
    web VARCHAR(30),
    PRIMARY KEY (id_proveedores)
    ) ENGINE= InnoDB DEFAULT CHARSET=utf8mb4;


--    
-- Estructura para tabla 'Log Proveedores'
-- Se usa para el Trigger tr_log_proveedores
--

CREATE TABLE log_proveedores (
	log_id_proveedores INT UNSIGNED NOT NULL AUTO_INCREMENT,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    usuario CHAR(20),
    PRIMARY KEY (log_id_proveedores)
    ) ENGINE= InnoDB DEFAULT CHARSET=utf8mb4;


/* Generacion de Trigger para la tabla Log Proveedores */

DELIMITER ;;
CREATE TRIGGER tr_log_proveedores
AFTER INSERT ON proveedores
FOR EACH ROW
    BEGIN
        INSERT INTO log_proveedores(usuario)
        VALUES(SESSION_USER());
    END
;;
DELIMITER ;


/* Fin Generacion de Trigger para la tabla Log Proveedores */


--    
-- Estructura para tabla 'Ingresos'
--
     
CREATE TABLE Ingresos (
	id_ingresos INT UNSIGNED NOT NULL AUTO_INCREMENT,
    id_empleados INT UNSIGNED NOT NULL,
    id_proveedores INT UNSIGNED NOT NULL,
    fecha_ingreso DATETIME NOT NULL,
    tipo_comprobante VARCHAR(20) NOT NULL,
    PRIMARY KEY (id_ingresos),
    CONSTRAINT fk_id_empleados_ingresos FOREIGN KEY (id_empleados) REFERENCES empleados (id_empleados) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_id_proveedores FOREIGN KEY (id_proveedores) REFERENCES proveedores (id_proveedores) ON DELETE RESTRICT ON UPDATE CASCADE
	) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    

--   
-- Estructura para tabla 'Detalle_Ingresos'
--

CREATE TABLE detalle_ingresos (
	id_ingresos INT UNSIGNED NOT NULL,
    id_articulos INT UNSIGNED NOT NULL,
    cantidad INT NOT NULL,
    precio_compra DECIMAL(11,2) NOT NULL,
    precio_venta DECIMAL(11,2) NOT NULL,
    PRIMARY KEY (id_ingresos, id_articulos),
    CONSTRAINT fk_id_ingresos FOREIGN KEY (id_ingresos) REFERENCES ingresos (id_ingresos) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_id_articulos_deting FOREIGN KEY (id_articulos) REFERENCES articulos (id_articulos) ON DELETE RESTRICT ON UPDATE CASCADE
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    

--    
-- Estructura para tabla 'Articulos'
--

CREATE TABLE articulos (
	id_articulos INT UNSIGNED NOT NULL AUTO_INCREMENT,
    id_categorias INT UNSIGNED NOT NULL,
    codigo INT NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR (256),
    art_precio DECIMAL(11,2) NOT NULL,
    PRIMARY KEY (id_articulos),
    CONSTRAINT fk_id_categorias FOREIGN KEY (id_categorias) REFERENCES categorias (id_categorias) ON DELETE RESTRICT ON UPDATE CASCADE
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


--    
-- Estructura para tabla 'Log Articulos'
-- Se usa para el Trigger tr_log_articulos
--


CREATE TABLE log_articulos (
	log_id_articulos INT UNSIGNED NOT NULL AUTO_INCREMENT,
    art_precio DECIMAL(11,2) NOT NULL,
    art_precio_nuevo DECIMAL(11,2) NOT NULL,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    usuario CHAR(20),
    PRIMARY KEY (log_id_articulos)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    

/* Generacion de Trigger para la tabla Log Articulos */

DELIMITER ;;
CREATE TRIGGER tr_log_articulos
BEFORE UPDATE ON articulos
FOR EACH ROW 
    BEGIN
        INSERT INTO log_articulos(art_precio, art_precio_nuevo, usuario)
        VALUES (OLD.art_precio, NEW.art_precio, SESSION_USER());
    END
;;
DELIMITER ;


--    
-- Prueba para Trigger Log Articulos
-- Se usa para el Trigger tr_log_articulos
--


/*

 UPDATE Articulos SET art_precio = art_precio * 1.35 WHERE nombre = 'Vino Rosado'

*/


/* Fin Generacion de Trigger para la tabla Log Articulos */


--  
-- Estructura para tabla 'Categorias'
--

CREATE TABLE categorias (
	id_categorias INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    Descripcion VARCHAR(256),
    PRIMARY KEY (id_categorias)
    )ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    

--   
-- Estructura para tabla 'Contacto'
--
    
CREATE TABLE contacto (
	id_contacto INT UNSIGNED NOT NULL AUTO_INCREMENT,
	nombres VARCHAR(50) NOT NULL,
	apellidos VARCHAR(50) NOT NULL,
	sexo VARCHAR(20),
	fecha_nacimiento DATE NOT NULL,
	tipo_documento VARCHAR(20) NOT NULL,
	numero_documento VARCHAR(20) NOT NULL,
	direccion VARCHAR(50) NOT NULL,
	telefono VARCHAR(25) NOT NULL,
	email VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_contacto)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



-- Fin de Creacion de tablas para Drugstore24



/* Generacion de Views para la base de datos Drugstore24 */


--
-- Estructura de vista 'articulos_precios_altos'
-- Se muestra la categoria de los articulos con precios superiores a $1000.00
--

CREATE VIEW articulos_precios_altos 
AS
SELECT 
    C.nombre AS 'Nombre de categorias', 
    A.art_precio AS 'Precio de Articulos'
FROM categorias C
JOIN articulos A
    ON C.id_categorias = A.id_categorias
GROUP BY C.nombre, A.art_precio
HAVING A.art_precio > 1000;


--
-- Estructura de vista 'margen_ganancias'
-- Se muestra que proveedor es el que deja mas 'margen de ganancias'.
--

CREATE VIEW margen_ganancias
AS
SELECT  
    P.nombre AS 'Nombre del Proveedor',
    -- DING.precio_compra AS 'Precio de Compra',
    -- DING.precio_venta AS 'Precio de Venta',
    MAX(DING.precio_venta - DING.precio_compra) AS 'Mayor margen de Ganancias'
FROM proveedores P
JOIN ingresos I
    ON P.id_proveedores = I.id_proveedores
JOIN detalle_ingresos DING
    ON DING.id_ingresos = I.id_ingresos;


--
-- Estructura de vista 'empleado_supremo'
-- Se muestra el Empleado que tiene mas ventas.
--

CREATE VIEW empleado_supremo
AS
SELECT  
    (SELECT DISTINCT CONCAT(C.nombres, ' ', C.apellidos)) AS 'Nombre Empleado',
    COUNT(DISTINCT(V.id_empleados)) AS 'Cantidad Ventas Supremo Vendedor'
FROM empleados E
JOIN ventas V    
    ON E.id_empleados = V.id_empleados
JOIN contacto C
    ON E.id_contacto = C.id_contacto;


--
-- Estructura de vista 'mas_vendidos'
-- Se muestran el top 5 de los articulos mas vendidos
--

CREATE VIEW mas_vendidos
AS
SELECT 
    A.nombre AS 'Articulo',
    DV.cantidad AS 'Cantidad de productos vendidos'
FROM detalle_ventas DV    
JOIN articulos A
    ON A.id_articulos = DV.id_articulos
ORDER BY DV.cantidad Desc
LIMIT 5;

--
-- Estructura de vista 'clientes_premiados'
-- Se muestran las ultimas 2 ventas para premiar a los clientes
--

CREATE VIEW clientes_premiados
AS
SELECT 
    CONCAT(CONT.nombres, ' ', CONT.apellidos) AS 'Nombre Cliente',
    CONT.telefono AS 'Numero de Telefono',
    VEN.fecha_venta AS 'Fecha de venta'
FROM clientes CLI
JOIN contacto CONT
    ON CLI.id_contacto = CONT.id_contacto
JOIN ventas VEN
    ON VEN.id_clientes = CLI.id_clientes
order by VEN.fecha_venta DESC
Limit 2;

/* Fin de Generacion de Views para la base de datos Drugstore24 */



/* Generacion de funciones para la base de datos Drugstore24 */


--
-- Funcion 1 "Calculo de ganancia de ventas por producto"
-- Se muestran las ganancias por cada producto del drugstore
-- 

DELIMITER $$
CREATE FUNCTION func_calcularGanancias(costo FLOAT, precio FLOAT) 
RETURNS DECIMAL (9,2)
DETERMINISTIC
    BEGIN   
        DECLARE ganancias DECIMAL (9,2);
        SET ganancias = costo - precio;
        RETURN ganancias;
    END
$$
DELIMITER ;


--
-- Prueba de la Funcion de calculo de ganancias con una Vista
-- Se muestran las ganancias que deja cada articulo utilizando la funcion almacenada calcularGanancias
-- Estructura de vista calculo de ganancias
--

CREATE VIEW view_ganancias
AS
SELECT
    ARTI.nombre as 'Articulo',
	precio_compra as 'Precio de Compra',
    precio_venta as 'Precio de Venta',
    func_calcularGanancias(precio_venta,precio_compra) as Ganancias
FROM detalle_ingresos ING 
JOIN articulos ARTI 
    ON ING.id_articulos = ARTI.id_articulos
ORDER BY nombre;

-- Fin de Prueba

 
--
-- Funcion 2 "Ventas por Categoria"
-- Se muestra la cantidad total de ventas ingresando la categoria correspondiente.
-- 

DELIMITER $$
CREATE FUNCTION func_cantvent (param_categoria VARCHAR(20))
RETURNS INT
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
    END
$$
DELIMITER ;

--
-- Prueba de la Funcion Ventas por Categoria
-- Estructura de prueba
--

/*

 SELECT func_cantvent("Pescaderia") as "Ventas Totales";

*/


-- Fin de Prueba


/* Fin de Generacion de Funciones para la base de datos Drugstore24 */



/* Generacion de Stored Procedures para la base de datos Drugstore24 */


--
-- Stored Procedure 1 "Limite Stock"
-- Retorna todos los productos que tengan menos de 10 unidades disponibles.
-- 

DELIMITER //
CREATE PROCEDURE pr_limite_stock()
    BEGIN   
        SELECT Ar.codigo, Ar.nombre, dig.cantidad
        FROM detalle_ingresos dig
	    	JOIN articulos Ar
	    ON dig.id_articulos = Ar.id_articulos
             WHERE dig.cantidad<=10;
    END
//
DELIMITER ;

--
-- Prueba de Stored Procedure "Limite Stock"
-- Estructura de prueba
--

/*

 call pr_limite_stock();

*/


-- Fin de Prueba


--
-- Stored Procedure 2 "Insertar datos en Proveedores"
-- Inserta datos en la tabla "Proveedores".
-- 

DELIMITER //
CREATE PROCEDURE pr_insert_prov(IN pr_id_proveedores INT, IN pr_nombre VARCHAR(25), IN pr_razon_social VARCHAR(25), IN pr_tipo_documento VARCHAR(20), 
IN pr_numero_documento VARCHAR(20), IN pr_direccion VARCHAR(50), IN pr_telefono VARCHAR(25), IN pr_email VARCHAR(50), IN pr_web VARCHAR(30))
    BEGIN   
        INSERT INTO proveedores(id_proveedores, nombre, razon_social, tipo_documento, numero_documento, direccion, telefono, email, web)
        VALUES (pr_id_proveedores, pr_nombre, pr_razon_social, pr_tipo_documento, pr_numero_documento, pr_direccion, pr_telefono, pr_email, pr_web);
    END
//
DELIMITER ;

--
-- Prueba de Stored Procedure "Insertar datos en Proveedores"
-- Estructura de prueba
--

/*

 call pr_insert_prov(12,'Nombre 12','Monotributista','CUIT','20-00000012-1','Peron 1234',553503384,'proveedor12@proveedores.com','www.proveedor12.com');

*/


-- Fin de Prueba


/* Fin de Generacion de Stored Procedures para la base de datos Drugstore24 */


SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
