create database autorental;
use autorental;

create table sucursales (
    id int auto_increment primary key,
    ciudad varchar(50),
    direccion varchar(100),
    telefono_fijo varchar(20),
    celular varchar(20),
    correo_electronico varchar(50)
);

create table empleados (
    id int auto_increment primary key,
    sucursal_id int,
    cedula varchar(20),
    nombres varchar(50),
    apellidos varchar(50),
    direccion varchar(100),
    ciudad_residencia varchar(50),
    celular varchar(20),
    correo_electronico varchar(50),
    foreign key (sucursal_id) references sucursales(id)
);

create table clientes (
    id int auto_increment primary key,
    cedula varchar(20),
    nombres varchar(50),
    apellidos varchar(50),
    direccion varchar(100),
    ciudad_residencia varchar(50),
    celular varchar(20),
    correo_electronico varchar(50)
);

create table vehiculos (
    id int auto_increment primary key,
    tipo_vehiculo varchar(50),
    placa varchar(10),
    referencia varchar(50),
    modelo year,
    puertas int,
    capacidad int,
    sunroof boolean,
    motor varchar(50),
    color varchar(20)
);

create table alquileres (
    id int auto_increment primary key,
    vehiculo_id int,
    cliente_id int,
    empleado_id int,
    sucursal_salida_id int,
    fecha_salida date,
    sucursal_llegada_id int,
    fecha_llegada date,
    fecha_esperada_llegada date,
    valor_alquiler_semana decimal(10, 2),
    valor_alquiler_dia decimal(10, 2),
    porcentaje_descuento decimal(5, 2),
    valor_cotizado decimal(10, 2),
    valor_pagado decimal(10, 2),
    foreign key (vehiculo_id) references vehiculos(id),
    foreign key (cliente_id) references clientes(id),
    foreign key (empleado_id) references empleados(id),
    foreign key (sucursal_salida_id) references sucursales(id),
    foreign key (sucursal_llegada_id) references sucursales(id)
);
