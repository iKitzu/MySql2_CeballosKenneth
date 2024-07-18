create database autorental;

use autorental;	

CREATE TABLE Sucursal (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ciudad VARCHAR(100) NOT NULL,
    direccion VARCHAR(255) NOT NULL,
    telefono_fijo VARCHAR(20),
    celular VARCHAR(20),
    correo_electronico VARCHAR(100)
);

CREATE TABLE Empleado (
    id INT AUTO_INCREMENT PRIMARY KEY,
    sucursal_id INT,
    cedula VARCHAR(20) NOT NULL UNIQUE,
    nombres VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    direccion VARCHAR(255),
    ciudad_residencia VARCHAR(100),
    celular VARCHAR(20),
    correo_electronico VARCHAR(100),
    FOREIGN KEY (sucursal_id) REFERENCES Sucursal(id)
);

CREATE TABLE Cliente (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cedula VARCHAR(20) NOT NULL UNIQUE,
    nombres VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    direccion VARCHAR(255),
    ciudad_residencia VARCHAR(100),
    celular VARCHAR(20),
    correo_electronico VARCHAR(100)
);

CREATE TABLE Vehiculo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tipo_vehiculo VARCHAR(50) NOT NULL,
    placa VARCHAR(20) NOT NULL UNIQUE,
    referencia VARCHAR(100) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    puertas INT NOT NULL,
    capacidad INT NOT NULL,
    sunroof BOOLEAN,
    motor VARCHAR(50) NOT NULL,
    color VARCHAR(50) NOT NULL
);

CREATE TABLE Alquiler (
    id INT AUTO_INCREMENT PRIMARY KEY,
    vehiculo_id INT,
    cliente_id INT,
    empleado_id INT,
    sucursal_salida_id INT,
    fecha_salida DATE NOT NULL,
    sucursal_llegada_id INT,
    fecha_llegada DATE,
    fecha_esperada_llegada DATE NOT NULL,
    valor_alquiler_semana DECIMAL(10, 2) NOT NULL,
    valor_alquiler_dia DECIMAL(10, 2) NOT NULL,
    porcentaje_descuento DECIMAL(5, 2),
    valor_cotizado DECIMAL(10, 2) NOT NULL,
    valor_pagado DECIMAL(10, 2),
    FOREIGN KEY (vehiculo_id) REFERENCES Vehiculo(id),
    FOREIGN KEY (cliente_id) REFERENCES Cliente(id),
    FOREIGN KEY (empleado_id) REFERENCES Empleado(id),
    FOREIGN KEY (sucursal_salida_id) REFERENCES Sucursal(id),
    FOREIGN KEY (sucursal_llegada_id) REFERENCES Sucursal(id)
);
