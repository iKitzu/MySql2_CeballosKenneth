-- *************
-- * Consultas *
-- *************

-- Consulta de disponibilidad de vehículos para alquiler por tipo de vehículo, rango de precios de alquiler y fechas de disponibilidad
SELECT *
FROM Vehiculos
WHERE Tipo_Vehiculo = 'Sedan'  -- Tipo de vehículo deseado
    AND Valor_Alquiler_Dia BETWEEN 50 AND 100  -- Rango de precios de alquiler por día
    AND ID NOT IN (
        SELECT Vehiculo_ID
        FROM Alquileres
        WHERE Fecha_Salida <= '2024-07-01'  -- Fecha de inicio del periodo de alquiler deseado
            AND Fecha_Llegada >= '2024-07-10'  -- Fecha de fin del periodo de alquiler deseado
    );

-- Alquiler de vehículos
insert into alquileres (vehiculo_id, cliente_id, empleado_id, sucursal_salida_id, fecha_salida, sucursal_llegada_id, fecha_llegada, fecha_esperada_llegada, valor_alquiler_dia, valor_cotizado, valor_pagado)
values (1, 101, 5, 3, '2024-07-01', 2, '2024-07-10', '2024-07-09', 80.00, 560.00, 560.00);

-- Consulta de historial de alquileres
SELECT *
FROM alquileres
WHERE cliente_id = 13;  -- ID del cliente del cual se desea consultar el historial de alquileres
-- -->ARREGLAR EN REVIEW!!!
