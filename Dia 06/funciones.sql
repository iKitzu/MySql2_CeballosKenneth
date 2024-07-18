-- #####################################
-- ### Dia 4 - Funciones de empleado ###
-- #####################################

-- Ver las sucursales registradas

select * from Sucursal;

-- Añadir a la base de datos una nueva sucursal

INSERT INTO Sucursal (ciudad, direccion, telefono_fijo, celular, correo_electronico) VALUES ('', '', '', '', '');

-- Actualizar ciudad en la que se encuentra una sucursal

UPDATE Sucursal
SET ciudad = ''
WHERE id = '';

-- Actualizar dirección de una sucursal

UPDATE Sucursal
SET direccion = ''
WHERE id = '';

-- Actualizar teléfono fijo correspondiente a una sucursal

UPDATE Sucursal
SET telefono_fijo = ''
WHERE id = '';

-- Actualizar celular correspondiente a una sucursal

UPDATE Sucursal
SET celular = ''
WHERE id = '';

-- Actualizar correo electrónico correspondiente a una sucursal

UPDATE Sucursal
SET correo_electronico = ''
WHERE id = '';

-- Ver los vehículos registrados

select * from Vehiculo;

-- Añadir a la base de datos un nuevo vehículo

INSERT INTO Vehiculo (tipo_vehiculo, placa, referencia, modelo, puertas, capacidad, sunroof, motor, color) VALUES ('', '', '', '', '', '', '', '', '');

-- Actualizar el tipo de un vehículo

UPDATE Vehiculo
SET tipo_vehiculo = ''
WHERE id = '';

-- Actualizar la placa de un vehículo

UPDATE Vehiculo
SET placa = ''
WHERE id = '';

-- Actualizar la referencia de un vehículo

UPDATE Vehiculo
SET referencia = ''
WHERE id = '';

-- Actualizar el modelo de un vehículo

UPDATE Vehiculo
SET modelo = ''
WHERE id = '';

-- Actualizar las puertas de un vehículo

UPDATE Vehiculo
SET puertas = ''
WHERE id = '';

-- Actualizar la capacidad de un vehículo

UPDATE Vehiculo
SET capacidad = ''
WHERE id = '';

-- Actualizar el sunroof de un vehículo

UPDATE Vehiculo
SET sunroof = ''
WHERE id = '';

-- Actualizar el motor de un vehículo

UPDATE Vehiculo
SET motor = ''
WHERE id = '';

-- Actualizar el color de un vehículo

UPDATE Vehiculo
SET color = ''
WHERE id = '';

-- Ver los empleados registrados

select * from Empleado;

-- Añadir a la base de datos un nuevo Empleado

INSERT INTO Empleado (sucursal_id, cedula, nombres, apellidos, direccion, ciudad_residencia, celular, correo_electronico) VALUES ('', '', '', '', '', '', '', '');

-- Actualizar el id de sucursal al que está asignado un empleado

UPDATE Empleado
SET sucursal_id = ''
WHERE id = '';

-- Actualizar la cedula de un empleado

UPDATE Empleado
SET cedula = ''
WHERE id = '';

-- Actualizar los nombres un empleado

UPDATE Empleado
SET nombres = ''
WHERE id = '';

-- Actualizar los apellidos un empleado

UPDATE Empleado
SET apellidos = ''
WHERE id = '';

-- Actualizar la direccion de un empleado

UPDATE Empleado
SET direccion = ''
WHERE id = '';

-- Actualizar la ciudad de residencia un empleado

UPDATE Empleado
SET ciudad_residencia = ''
WHERE id = '';

-- Actualizar el celular de un empleado

UPDATE Empleado
SET celular = ''
WHERE id = '';

-- Actualizar el correo electrónico de un empleado

UPDATE Empleado
SET correo_electronico = ''
WHERE id = '';
