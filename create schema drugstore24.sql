/* Base de datos proyecto final - Drugstore 24 horas */

-- Creando la Base de Datos Drugstore24

SET NAMES utf8mb4;
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

DROP SCHEMA IF EXISTS Drugstore24;
CREATE SCHEMA Drugstore24;
USE Drugstore24;


-- Estructura para tabla 'Clientes'

CREATE TABLE clientes (
	id_clientes INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nombres VARCHAR(50) NOT NULL,
    apellidos VARCHAR(50) NOT NULL,
    sexo VARCHAR(20),
    fecha_nacimiento DATETIME NOT NULL,
    tipo_documento VARCHAR(20) NOT NULL,
    numero_documento VARCHAR(20) NOT NULL,
    direccion VARCHAR(50) NOT NULL,
    telefono VARCHAR(25) NOT NULL,
    email VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_clientes)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    

-- Estructura para tabla 'Ventas'

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
    
    
-- Estructura para tabla 'Empleados'

CREATE TABLE empleados (
	id_empleados INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nombres VARCHAR(50) NOT NULL,
    apellidos VARCHAR(50) NOT NULL,
    sexo VARCHAR(20),
    fecha_nacimiento DATETIME NOT NULL,
    tipo_documento VARCHAR(20) NOT NULL,
    numero_documento VARCHAR(20) NOT NULL,
    direccion VARCHAR(50) NOT NULL,
    telefono VARCHAR(25) NOT NULL,
    email VARCHAR(50) NOT NULL,
    usuario VARCHAR(25) NOT NULL,
    contrasena VARBINARY(255),
    PRIMARY KEY (id_empleados)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    
    
    -- Estructura para tabla 'Detalle_Ventas'
    
    CREATE TABLE detalle_ventas (
		id_detalle_ventas INT UNSIGNED NOT NULL AUTO_INCREMENT,
        id_articulos INT UNSIGNED NOT NULL,
        id_ventas INT UNSIGNED NOT NULL,
        cantidad INT UNSIGNED NOT NULL,
        precio_ventas DECIMAL(11,2) NOT NULL,
        descuento DECIMAL(11,2) NOT NULL,
        PRIMARY KEY (id_detalle_ventas),
        CONSTRAINT fk_id_articulos_detventas FOREIGN KEY (id_articulos) REFERENCES articulos (id_articulos) ON DELETE RESTRICT ON UPDATE CASCADE,
        CONSTRAINT fk_id_ventas FOREIGN KEY (id_ventas) REFERENCES ventas (id_ventas) ON DELETE RESTRICT ON UPDATE CASCADE
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    
    
     -- Estructura para tabla 'Proveedores'
     
     CREATE TABLE proveedores (
		id_proveedores INT UNSIGNED NOT NULL AUTO_INCREMENT,
        razon_social VARCHAR(25) NOT NULL,
        tipo_documento VARCHAR(20) NOT NULL,
        numero_documento VARCHAR(20) NOT NULL,
        direccion VARCHAR(50) NOT NULL,
        telefono VARCHAR(25) NOT NULL,
        email VARCHAR(50) NOT NULL,
        web VARCHAR(30) NOT NULL,
        PRIMARY KEY (id_proveedores)
     ) ENGINE= InnoDB DEFAULT CHARSET=utf8mb4;
     
     
     -- Estructura para tabla 'Ingresos'
     
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
    
    
    -- Estructura para tabla Detalle_Ingresos
    
    CREATE TABLE detalle_ingresos (
		id_detalle_ingresos INT UNSIGNED NOT NULL AUTO_INCREMENT,
        id_ingresos INT UNSIGNED NOT NULL,
        id_articulos INT UNSIGNED NOT NULL,
        cantidad INT NOT NULL,
        precio_compra DECIMAL(11,2) NOT NULL,
        precio_venta DECIMAL(11,2) NOT NULL,
        PRIMARY KEY (id_detalle_ingresos),
        CONSTRAINT fk_id_ingresos FOREIGN KEY (id_ingresos) REFERENCES ingresos (id_ingresos) ON DELETE RESTRICT ON UPDATE CASCADE,
        CONSTRAINT fk_id_articulos_deting FOREIGN KEY (id_articulos) REFERENCES articulos (id_articulos) ON DELETE RESTRICT ON UPDATE CASCADE
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    
    
    -- Estructura para tabla 'Articulos'
    
    CREATE TABLE articulos (
		id_articulos INT UNSIGNED NOT NULL AUTO_INCREMENT,
        id_categorias INT UNSIGNED NOT NULL,
        codigo INT NOT NULL,
        nombre VARCHAR(50) NOT NULL,
        descripcion VARCHAR (256),
        tipo_comprobante VARCHAR(20) NOT NULL,
        PRIMARY KEY (id_articulos),
        CONSTRAINT fk_id_categorias FOREIGN KEY (id_categorias) REFERENCES categorias (id_categorias) ON DELETE RESTRICT ON UPDATE CASCADE
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    
    
    -- Estructura para tabla 'Categorias'
    
    CREATE TABLE categorias (
		id_categorias INT UNSIGNED NOT NULL AUTO_INCREMENT,
        nombre VARCHAR(50) NOT NULL,
        Descripcion VARCHAR(256),
        PRIMARY KEY (id_categorias)
    )ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;