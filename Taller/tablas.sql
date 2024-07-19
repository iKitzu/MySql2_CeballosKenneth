create database TallerViernesMySql;

use TallerViernesMySql;

create table departamento (
    codigo int(10) not null primary key,
    nombre varchar(100) not null,
    presupuesto double not null,
    gastos double not null
);

create table empleado (
    codigo int(10) not null primary key,
    nif varchar(9) not null,
    nombre varchar(100) not null,
    apellido1 varchar(100) not null,
    apellido2 varchar(100),
    codigo_departamento int(10),
    foreign key (codigo_departamento) references departamento(codigo)
);