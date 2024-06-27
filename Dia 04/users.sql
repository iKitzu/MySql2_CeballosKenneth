-- ************************
-- * Creación de usuarios *
-- ************************

create user 'admin'@'%' identified by 'soyadmin123';
create user 'empleado'@'%' identified by 'soyempleado123';
create user 'cliente'@'%' identified by 'soycliente123';

-- **************************
-- * Asignación de permisos *
-- **************************

grant all privileges on Actividad_Dia04_MySql2_CeballosKenneth.* to 'admin'@'%';
grant select, insert, update on Actividad_Dia04_MySql2_CeballosKenneth.* to 'empleado'@'%';
grant select on Actividad_Dia04_MySql2_CeballosKenneth.* to 'cliente'@'%';

-- **************
-- * CRUD ADMIN *
-- **************

-- Crear (Insertar):

-- Insertar en la tabla sucursales
insert into sucursales (ciudad, direccion, telefono_fijo, celular, correo_electronico)
values ('cali', 'avenida 5 #45-30', '6023456789', '3123456789', 'cali@example.com');

-- Insertar en la tabla empleados
insert into empleados (sucursal_id, cedula, nombres, apellidos, direccion, ciudad_residencia, celular, correo_electronico)
values (3, '1000000008', 'andres', 'ramirez', 'calle 8 #50-60', 'cali', '3000000008', 'andres.ramirez@example.com');

-- Insertar en la tabla clientes
insert into clientes (cedula, nombres, apellidos, direccion, ciudad_residencia, celular, correo_electronico)
values ('3456789012', 'lucia', 'moreno', 'carrera 9 #15-25', 'barranquilla', '3209876543', 'luciamoreno@example.com');

-- Insertar en la tabla vehiculos
insert into vehiculos (tipo_vehiculo, placa, referencia, modelo, puertas, capacidad, sunroof, motor, color)
values ('Camioneta', 'JKL012', 'Chevrolet Tahoe', 2020, 4, 7, false, 'Gasolina', 'Rojo');

-- Insertar en la tabla alquileres
insert into alquileres (vehiculo_id, cliente_id, empleado_id, sucursal_salida_id, fecha_salida, sucursal_llegada_id, fecha_llegada, fecha_esperada_llegada, valor_alquiler_semana, valor_alquiler_dia, porcentaje_descuento, valor_cotizado, valor_pagado)
values (4, 2, 2, 2, '2024-07-01', 3, '2024-07-10', '2024-07-09', 400.00, 70.00, 5.00, 450.00, 450.00);


-- Leer (Seleccionar):

-- Consultar todas las sucursales
select * from sucursales;

-- Consultar todos los empleados
select * from empleados;

-- Consultar todos los clientes
select * from clientes;

-- Consultar todos los vehículos
select * from vehiculos;

-- Consultar todos los alquileres
select * from alquileres;


-- Actualizar:

-- Actualizar la dirección de una sucursal
update sucursales
set direccion = 'calle 50 #30-45'
where id = 1;

-- Actualizar el nombre de un empleado
update empleados
set nombres = 'carlos alberto'
where id = 2;

-- Actualizar el teléfono celular de un cliente
update clientes
set celular = '3111234567'
where id = 1;

-- Actualizar el color de un vehículo
update vehiculos
set color = 'Azul'
where id = 3;

-- Actualizar el valor pagado en un alquiler
update alquileres
set valor_pagado = 500.00
where id = 1;


-- Eliminar:

-- Eliminar una sucursal
delete from sucursales
where id = 5;

-- Eliminar un empleado
delete from empleados
where id = 6;

-- Eliminar un cliente
delete from clientes
where id = 2;

-- Eliminar un vehículo
delete from vehiculos
where id = 4;

-- Eliminar un alquiler
delete from alquileres
where id = 1;


-- ********************************************************
-- *Consultas específicas y complejas para otros usuarios *
-- ********************************************************
