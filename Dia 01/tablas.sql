create database Dia01_MySql2_CeballosKenneth;

use Dia01_MySql2_CeballosKenneth;

-- Tabla de Médicos
create table medicos (
    id int primary key,
    nombre varchar(100),
    direccion varchar(255),
    telefono varchar(20),
    poblacion varchar(100),
    provincia varchar(100),
    codigo_postal varchar(10),
    nif varchar(20),
    num_seguridad_social varchar(20),
    num_colegiado varchar(20),
    tipo_medico varchar(20) -- titular, interino, sustituto
);

-- Tabla de Horarios de Médicos
create table horarios_medicos (
    id int primary key,
    medico_id int,
    dia_semana varchar(20),
    hora_inicio time,
    hora_fin time,
    foreign key (medico_id) references medicos(id)
);

-- Tabla de Sustituciones
create table sustituciones (
    id int primary key,
    medico_id int,
    fecha_alta date,
    fecha_baja date,
    foreign key (medico_id) references medicos(id)
);

-- Tabla de Empleados
create table empleados (
    id int primary key,
    nombre varchar(100),
    direccion varchar(255),
    telefono varchar(20),
    poblacion varchar(100),
    provincia varchar(100),
    codigo_postal varchar(10),
    nif varchar(20),
    num_seguridad_social varchar(20),
    tipo_empleado varchar(50) -- ats, ats de zona, auxiliar de enfermería, celador, administrativo
);

-- Tabla de Vacaciones
create table vacaciones (
    id int primary key,
    empleado_id int,
    fecha_inicio date,
    fecha_fin date,
    estado varchar(20), -- planificadas, disfrutadas
    foreign key (empleado_id) references empleados(id)
);

-- Tabla de Pacientes
create table pacientes (
    id int primary key,
    nombre varchar(100),
    direccion varchar(255),
    telefono varchar(20),
    codigo_postal varchar(10),
    nif varchar(20),
    num_seguridad_social varchar(20),
    medico_id int,
    foreign key (medico_id) references medicos(id)
);