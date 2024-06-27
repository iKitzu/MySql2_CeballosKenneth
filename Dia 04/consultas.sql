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

-- Testear despues

-- ->

-- Consulta de Disponibilidad de Vehículos para Alquiler por Tipo de Vehículo, Rango de Precios y Fechas de Disponibilidad

create table disponibilidad (
    vehiculo_id int,
    fecha_disponible_inicio date,
    fecha_disponible_fin date,
    foreign key (vehiculo_id) references vehiculos(id)
);

-- Consulta de disponibilidad de vehículos
select v.*
from vehiculos v
join disponibilidad d on v.id = d.vehiculo_id
where v.tipo_vehiculo = 'sedán'
  and d.fecha_disponible_inicio <= '2024-07-01'
  and d.fecha_disponible_fin >= '2024-07-10'
  and v.precio_dia between 50 and 100;


-- Alquiler de vehículos
-- -Función para calcular el valor de alquiler

create function calcular_valor_alquiler(dias int, precio_dia decimal, precio_semana decimal, descuento decimal)
returns decimal
begin
    declare semanas int;
    declare dias_restantes int;
    declare valor_total decimal;

    set semanas = floor(dias / 7);
    set dias_restantes = mod(dias, 7);
    set valor_total = (semanas * precio_semana) + (dias_restantes * precio_dia);
    set valor_total = valor_total - (valor_total * (descuento / 100));

    return valor_total;
end;


-- -Procedimiento para realizar un alquiler
create procedure realizar_alquiler(
    in vehiculo_id int,
    in cliente_id int,
    in empleado_id int,
    in sucursal_salida_id int,
    in fecha_salida date,
    in fecha_esperada_llegada date,
    in precio_semana decimal,
    in precio_dia decimal,
    in descuento decimal
)
begin
    declare dias_alquiler int;
    declare valor_cotizado decimal;

    set dias_alquiler = datediff(fecha_esperada_llegada, fecha_salida);
    set valor_cotizado = calcular_valor_alquiler(dias_alquiler, precio_dia, precio_semana, descuento);

    insert into alquileres (
        vehiculo_id, cliente_id, empleado_id, sucursal_salida_id, fecha_salida,
        sucursal_llegada_id, fecha_esperada_llegada, valor_alquiler_semana,
        valor_alquiler_dia, porcentaje_descuento, valor_cotizado, valor_pagado
    )
    values (
        vehiculo_id, cliente_id, empleado_id, sucursal_salida_id, fecha_salida,
        null, fecha_esperada_llegada, precio_semana,
        precio_dia, descuento, valor_cotizado, null
    );

    update disponibilidad
    set fecha_disponible_fin = date_sub(fecha_salida, interval 1 day)
    where vehiculo_id = vehiculo_id and fecha_disponible_inicio <= fecha_salida and fecha_disponible_fin >= fecha_salida;
    
    insert into disponibilidad (vehiculo_id, fecha_disponible_inicio, fecha_disponible_fin)
    values (vehiculo_id, date_add(fecha_esperada_llegada, interval 1 day), '2099-12-31');
end;

-- Consulta de historial de alquileres
-- -Consulta de historial de alquileres por cliente
select a.*, v.tipo_vehiculo, v.placa, s_salida.ciudad as ciudad_salida, s_llegada.ciudad as ciudad_llegada
from alquileres a
join vehiculos v on a.vehiculo_id = v.id
join sucursales s_salida on a.sucursal_salida_id = s_salida.id
left join sucursales s_llegada on a.sucursal_llegada_id = s_llegada.id
where a.cliente_id = 1;

-- //FIN 

