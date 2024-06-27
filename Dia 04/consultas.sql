-- *************
-- * Consultas *
-- *************

-- Consulta de disponibilidad de vehículos para alquiler por tipo de vehículo, rango de precios de alquiler y fechas de disponibilidad
-- -Para obtener la disponibilidad de los vehículos por tipo, rango de precios y fechas

select 
    v.tipo_vehiculo,
    v.placa,
    v.referencia,
    v.modelo,
    v.puertas,
    v.capacidad,
    v.sunroof,
    v.motor,
    v.color,
    a.fecha_salida,
    a.fecha_llegada,
    a.valor_alquiler_dia
from 
    vehiculos v
left join 
    alquileres a on v.id = a.vehiculo_id
where 
    v.tipo_vehiculo = 'Sedan' and
    (a.valor_alquiler_dia between 40 and 60) and
    (a.fecha_salida is null or a.fecha_llegada < '2024-07-01' or a.fecha_salida > '2024-07-10');

-- Alquiler de vehículos
-- -Para insertar un nuevo alquiler en la base de datos

insert into alquileres (
    vehiculo_id,
    cliente_id,
    empleado_id,
    sucursal_salida_id,
    fecha_salida,
    sucursal_llegada_id,
    fecha_llegada,
    fecha_esperada_llegada,
    valor_alquiler_semana,
    valor_alquiler_dia,
    porcentaje_descuento,
    valor_cotizado,
    valor_pagado
) values (
    1, -- ID del vehículo
    1, -- ID del cliente
    1, -- ID del empleado
    1, -- ID de la sucursal de salida
    '2024-07-01', -- Fecha de salida
    2, -- ID de la sucursal de llegada
    '2024-07-10', -- Fecha de llegada
    '2024-07-09', -- Fecha esperada de llegada
    300.00, -- Valor del alquiler por semana
    50.00, -- Valor del alquiler por día
    10.00, -- Porcentaje de descuento
    450.00, -- Valor cotizado
    450.00 -- Valor pagado
);

-- Consulta de historial de alquileres
-- -Para obtener el historial de alquileres de un cliente

select 
    c.nombres,
    c.apellidos,
    v.tipo_vehiculo,
    v.placa,
    a.fecha_salida,
    a.fecha_llegada,
    a.valor_pagado
from 
    alquileres a
join 
    clientes c on a.cliente_id = c.id
join 
    vehiculos v on a.vehiculo_id = v.id
where 
    c.cedula = '1234567890';

-- Función para cobrar días adicionales con un incremento del 8%
-- -Función almacenada que calcule el costo adicional si un cliente entrega el vehículo después de la fecha esperada

delimiter //
create function calcular_cargo_adicional(
    fecha_esperada_llegada date,
    fecha_real_llegada date,
    valor_alquiler_dia decimal(10, 2)
) returns decimal(10, 2)
begin
    declare dias_adicionales int;
    declare cargo_adicional decimal(10, 2);
    
    if fecha_real_llegada > fecha_esperada_llegada then
        set dias_adicionales = datediff(fecha_real_llegada, fecha_esperada_llegada);
        set cargo_adicional = dias_adicionales * valor_alquiler_dia * 1.08;
    else
        set cargo_adicional = 0.00;
    end if;
    
    return cargo_adicional;
end //
delimiter ;

-- Aplicación de la función
update alquileres
set valor_pagado = valor_pagado + calcular_cargo_adicional(fecha_esperada_llegada, '2024-07-11', valor_alquiler_dia)
where id = 1;
