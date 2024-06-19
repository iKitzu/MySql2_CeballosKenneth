-- Estos datos no son mas para comprobar que las consultas funcionen (esta prohibido preguntar de donde se sacaron los datos)

-- Datos de Médicos
insert into medicos (id, nombre, direccion, telefono, poblacion, provincia, codigo_postal, nif, num_seguridad_social, num_colegiado, tipo_medico) values
(1, 'Dr. Carlos Gomez', 'Calle Falsa 123', '555-1234', 'Madrid', 'Madrid', '28001', '12345678A', 'SS12345678', '1001', 'titular'),
(2, 'Dr. Ana Lopez', 'Avenida Siempre Viva 742', '555-5678', 'Barcelona', 'Barcelona', '08001', '23456789B', 'SS23456789', '1002', 'interino'),
(3, 'Dr. Pedro Martinez', 'Calle Gran Via 100', '555-8765', 'Sevilla', 'Sevilla', '41001', '34567890C', 'SS34567890', '1003', 'sustituto'),
(4, 'Dr. Lucia Hernandez', 'Calle Sol 56', '555-2345', 'Valencia', 'Valencia', '46001', '45678901D', 'SS45678901', '1004', 'titular'),
(5, 'Dr. Javier Ruiz', 'Avenida Luna 89', '555-6789', 'Bilbao', 'Bizkaia', '48001', '56789012E', 'SS56789012', '1005', 'interino'),
(6, 'Dr. Maria Sanchez', 'Calle Estrella 12', '555-4321', 'Zaragoza', 'Zaragoza', '50001', '67890123F', 'SS67890123', '1006', 'sustituto'),
(7, 'Dr. Alberto Torres', 'Avenida Mar 34', '555-5670', 'Alicante', 'Alicante', '03001', '78901234G', 'SS78901234', '1007', 'titular'),
(8, 'Dr. Elena Morales', 'Calle Rio 78', '555-0987', 'Valladolid', 'Valladolid', '47001', '89012345H', 'SS89012345', '1008', 'interino'),
(9, 'Dr. Fernando Gil', 'Calle Montaña 45', '555-7654', 'Murcia', 'Murcia', '30001', '90123456I', 'SS90123456', '1009', 'sustituto'),
(10, 'Dr. Sara Vega', 'Avenida Playa 32', '555-3456', 'Granada', 'Granada', '18001', '01234567J', 'SS01234567', '1010', 'titular'),
(11, 'Dr. Ricardo Mendez', 'Calle Lago 29', '555-8760', 'Toledo', 'Toledo', '45001', '12345678K', 'SS12345678', '1011', 'interino'),
(12, 'Dr. Isabel Nuñez', 'Avenida Sierra 51', '555-2340', 'Pamplona', 'Navarra', '31001', '23456789L', 'SS23456789', '1012', 'sustituto'),
(13, 'Dr. Victor Perez', 'Calle Nieve 88', '555-6780', 'Santander', 'Cantabria', '39001', '34567890M', 'SS34567890', '1013', 'titular'),
(14, 'Dr. Laura Flores', 'Avenida Campo 17', '555-0980', 'Oviedo', 'Asturias', '33001', '45678901N', 'SS45678901', '1014', 'interino'),
(15, 'Dr. David Castro', 'Calle Bosque 21', '555-5432', 'Logroño', 'La Rioja', '26001', '56789012O', 'SS56789012', '1015', 'sustituto');

-- Datos de Horarios de Médicos
insert into horarios_medicos (id, medico_id, dia_semana, hora_inicio, hora_fin) values
(1, 1, 'lunes', '09:00:00', '13:00:00'),
(2, 1, 'miercoles', '15:00:00', '19:00:00'),
(3, 2, 'martes', '10:00:00', '14:00:00'),
(4, 2, 'jueves', '10:00:00', '14:00:00'),
(5, 3, 'lunes', '09:00:00', '13:00:00'),
(6, 3, 'viernes', '09:00:00', '13:00:00'),
(7, 4, 'martes', '09:00:00', '13:00:00'),
(8, 4, 'jueves', '15:00:00', '19:00:00'),
(9, 5, 'miercoles', '10:00:00', '14:00:00'),
(10, 5, 'viernes', '10:00:00', '14:00:00'),
(11, 6, 'lunes', '09:00:00', '13:00:00'),
(12, 6, 'jueves', '09:00:00', '13:00:00'),
(13, 7, 'martes', '09:00:00', '13:00:00'),
(14, 7, 'viernes', '15:00:00', '19:00:00'),
(15, 8, 'miercoles', '09:00:00', '13:00:00');

-- Datos de Sustituciones
insert into sustituciones (id, medico_id, fecha_alta, fecha_baja) values
(1, 3, '2023-01-01', '2023-01-31'),
(2, 3, '2023-03-01', '2023-03-31'),
(3, 3, '2024-01-01', null),
(4, 6, '2023-04-01', '2023-04-15'),
(5, 6, '2023-05-01', '2023-05-15'),
(6, 6, '2024-02-01', null),
(7, 9, '2023-02-01', '2023-02-28'),
(8, 9, '2023-08-01', '2023-08-31'),
(9, 9, '2024-03-01', null),
(10, 12, '2023-06-01', '2023-06-30'),
(11, 12, '2023-09-01', '2023-09-15'),
(12, 12, '2024-04-01', null),
(13, 15, '2023-11-01', '2023-11-30'),
(14, 15, '2024-01-01', '2024-01-15'),
(15, 15, '2024-05-01', null);

-- Datos de Empleados
insert into empleados (id, nombre, direccion, telefono, poblacion, provincia, codigo_postal, nif, num_seguridad_social, tipo_empleado) values
(1, 'Laura Perez', 'Calle Sol 15', '555-3456', 'Madrid', 'Madrid', '28001', '45678901D', 'SS45678901', 'ats'),
(2, 'Juan Rodriguez', 'Avenida Luna 30', '555-7890', 'Barcelona', 'Barcelona', '08001', '56789012E', 'SS56789012', 'administrativo'),
(3, 'Sara Martinez', 'Calle Estrella 22', '555-4321', 'Sevilla', 'Sevilla', '41001', '67890123F', 'SS67890123', 'auxiliar de enfermería'),
(4, 'Miguel Fernandez', 'Calle Mar 10', '555-1111', 'Madrid', 'Madrid', '28001', '78901234G', 'SS78901234', 'celador'),
(5, 'Lucia Suarez', 'Avenida Rio 25', '555-2222', 'Barcelona', 'Barcelona', '08001', '89012345H', 'SS89012345', 'ats de zona'),
(6, 'Carlos Ruiz', 'Calle Nieve 12', '555-3333', 'Sevilla', 'Sevilla', '41001', '90123456I', 'SS90123456', 'ats'),
(7, 'Marta Ortega', 'Calle Montaña 8', '555-4444', 'Madrid', 'Madrid', '28001', '01234567J', 'SS01234567', 'administrativo'),
(8, 'Sofia Torres', 'Avenida Playa 6', '555-5555', 'Barcelona', 'Barcelona', '08001', '12345678K', 'SS12345678', 'auxiliar de enfermería'),
(9, 'Pablo Jimenez', 'Calle Lago 4', '555-6666', 'Sevilla', 'Sevilla', '41001', '23456789L', 'SS23456789', 'celador'),
(10, 'Ana Sanchez', 'Avenida Sierra 7', '555-7777', 'Madrid', 'Madrid', '28001', '34567890M', 'SS34567890', 'ats de zona'),
(11, 'David Lopez', 'Calle Bosque 1', '555-8888', 'Barcelona', 'Barcelona', '08001', '45678901N', 'SS45678901', 'ats'),
(12, 'Elena Romero', 'Avenida Campo 9', '555-9999', 'Sevilla', 'Sevilla', '41001', '56789012O', 'SS56789012', 'administrativo'),
(13, 'Roberto Garcia', 'Calle Lluvia 14', '555-1212', 'Madrid', 'Madrid', '28001', '67890123P', 'SS67890123', 'auxiliar de enfermería'),
(14, 'Laura Torres', 'Avenida Sol 2', '555-1313', 'Barcelona', 'Barcelona', '08001', '78901234Q', 'SS78901234', 'celador'),
(15, 'Javier Fernandez', 'Calle Viento 5', '555-1414', 'Sevilla', 'Sevilla', '41001', '89012345R', 'SS89012345', 'ats de zona');

-- Datos de Vacaciones
insert into vacaciones (id, empleado_id, fecha_inicio, fecha_fin, estado) values
(1, 1, '2023-07-01', '2023-07-15', 'disfrutadas'),
(2, 1, '2024-08-01', '2024-08-15', 'planificadas'),
(3, 2, '2023-06-01', '2023-06-10', 'disfrutadas'),
(4, 3, '2023-12-01', '2023-12-20', 'disfrutadas'),
(5, 4, '2023-11-01', '2023-11-10', 'disfrutadas'),
(6, 5, '2024-09-01', '2024-09-15', 'planificadas'),
(7, 6, '2023-10-01', '2023-10-15', 'disfrutadas'),
(8, 7, '2023-08-01', '2023-08-20', 'disfrutadas'),
(9, 8, '2023-05-01', '2023-05-10', 'disfrutadas'),
(10, 9, '2024-04-01', '2024-04-10', 'planificadas'),
(11, 10, '2023-03-01', '2023-03-15', 'disfrutadas'),
(12, 11, '2024-02-01', '2024-02-10', 'planificadas'),
(13, 12, '2023-01-01', '2023-01-10', 'disfrutadas'),
(14, 13, '2024-07-01', '2024-07-10', 'planificadas'),
(15, 14, '2023-09-01', '2023-09-15', 'disfrutadas');

-- Datos de Pacientes
insert into pacientes (id, nombre, direccion, telefono, codigo_postal, nif, num_seguridad_social, medico_id) values
(1, 'Miguel Fernandez', 'Calle Mar 10', '555-1111', '28001', '78901234G', 'SS78901234', 1),
(2, 'Lucia Suarez', 'Avenida Rio 25', '555-2222', '08001', '89012345H', 'SS89012345', 1),
(3, 'Carlos Ruiz', 'Calle Nieve 12', '555-3333', '41001', '90123456I', 'SS90123456', 2),
(4, 'Marta Ortega', 'Calle Montaña 8', '555-4444', '41001', '01234567J', 'SS01234567', 2),
(5, 'Sofia Torres', 'Avenida Playa 6', '555-5555', '28001', '12345678K', 'SS12345678', 3),
(6, 'Pablo Jimenez', 'Calle Lago 4', '555-6666', '48001', '23456789L', 'SS23456789', 4),
(7, 'Ana Sanchez', 'Avenida Sierra 7', '555-7777', '46001', '34567890M', 'SS34567890', 5),
(8, 'David Lopez', 'Calle Bosque 1', '555-8888', '03001', '45678901N', 'SS45678901', 6),
(9, 'Elena Romero', 'Avenida Campo 9', '555-9999', '47001', '56789012O', 'SS56789012', 7),
(10, 'Roberto Garcia', 'Calle Lluvia 14', '555-1212', '30001', '67890123P', 'SS67890123', 8),
(11, 'Laura Torres', 'Avenida Sol 2', '555-1313', '18001', '78901234Q', 'SS78901234', 9),
(12, 'Javier Fernandez', 'Calle Viento 5', '555-1414', '45001', '89012345R', 'SS89012345', 10),
(13, 'Miguel Gomez', 'Avenida Mar 15', '555-1515', '28001', '90123456S', 'SS90123456', 11),
(14, 'Sara Lopez', 'Calle Rio 20', '555-1616', '08001', '01234567T', 'SS01234567', 12),
(15, 'Carlos Martinez', 'Avenida Montaña 25', '555-1717', '41001', '12345678U', 'SS12345678', 13);
