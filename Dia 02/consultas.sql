-- *************************
-- Consultas sobre una tabla
-- *************************

-- 1. Lista el primer apellido de todos los empleados.
delimiter //
create procedure lista_primer_apellido()
begin
    select apellido1 from empleado;
end//
delimiter ;
call lista_primer_apellido();

-- 2. Lista el primer apellido de los empleados eliminando los apellidos que estén repetidos.
delimiter //
create procedure lista_primer_apellido_distinct()
begin
    select distinct apellido1 from empleado;
end//
delimiter ;
call lista_primer_apellido_distinct();

-- 3. Lista todas las columnas de la tabla empleado.
delimiter //
create procedure lista_todas_columnas_empleado()
begin
    select * from empleado;
end//
delimiter ;
call lista_todas_columnas_empleado();

-- 4. Lista el nombre y los apellidos de todos los empleados.
delimiter //
create procedure lista_nombre_apellidos_empleados()
begin
    select nombre, apellido1, apellido2 from empleado;
end//
delimiter ;
call lista_nombre_apellidos_empleados();

-- 5. Lista el identificador de los departamentos de los empleados que aparecen en la tabla empleado.
delimiter //
create procedure lista_id_departamentos()
begin
    select id_departamento from empleado;
end//
delimiter ;
call lista_id_departamentos();

-- 6. Lista el identificador de los departamentos de los empleados que aparecen en la tabla empleado, eliminando los identificadores que aparecen repetidos.
delimiter //
create procedure lista_id_departamentos_distinct()
begin
    select distinct id_departamento from empleado;
end//
delimiter ;
call lista_id_departamentos_distinct();

-- 7. Lista el nombre y apellidos de los empleados en una única columna.
delimiter //
create procedure lista_nombre_completo_empleados()
begin
    select concat(nombre, ' ', apellido1, ' ', apellido2) as nombre_completo from empleado;
end//
delimiter ;
call lista_nombre_completo_empleados();

-- 8. Lista el nombre y apellidos de los empleados en una única columna, convirtiendo todos los caracteres en mayúscula.
delimiter //
create procedure lista_nombre_completo_mayuscula()
begin
    select upper(concat(nombre, ' ', apellido1, ' ', apellido2)) as nombre_completo from empleado;
end//
delimiter ;
call lista_nombre_completo_mayuscula();

-- 9. Lista el nombre y apellidos de los empleados en una única columna, convirtiendo todos los caracteres en minúscula.
delimiter //
create procedure lista_nombre_completo_minuscula()
begin
    select lower(concat(nombre, ' ', apellido1, ' ', apellido2)) as nombre_completo from empleado;
end//
delimiter ;
call lista_nombre_completo_minuscula();

-- 10. Lista el identificador de los empleados junto al nif, pero el nif deberá aparecer en dos columnas, una mostrará únicamente los dígitos del nif y la otra la letra.
delimiter //
create procedure lista_id_nif_empleados()
begin
    select id, substring(nif, 1, 8) as nif_digitos, substring(nif, 9, 1) as nif_letra from empleado;
end//
delimiter ;
call lista_id_nif_empleados();

-- 11. Lista el nombre de cada departamento y el valor del presupuesto actual del que dispone.
delimiter //
create procedure lista_presupuesto_actual_departamentos()
begin
    select nombre, (presupuesto - gastos) as presupuesto_actual from departamento;
end//
delimiter ;
call lista_presupuesto_actual_departamentos();

-- 12. Lista el nombre de los departamentos y el valor del presupuesto actual ordenado de forma ascendente.
delimiter //
create procedure lista_presupuesto_asc()
begin
    select nombre, (presupuesto - gastos) as presupuesto_actual from departamento order by presupuesto_actual asc;
end//
delimiter ;
call lista_presupuesto_asc();

-- 13. Lista el nombre de todos los departamentos ordenados de forma ascendente.
delimiter //
create procedure lista_departamentos_asc()
begin
    select nombre from departamento order by nombre asc;
end//
delimiter ;
call lista_departamentos_asc();

-- 14. Lista el nombre de todos los departamentos ordenados de forma descendente.
delimiter //
create procedure lista_departamentos_desc()
begin
    select nombre from departamento order by nombre desc;
end//
delimiter ;
call lista_departamentos_desc();

-- 15. Lista los apellidos y el nombre de todos los empleados, ordenados de forma alfabética tendiendo en cuenta en primer lugar sus apellidos y luego su nombre.
delimiter //
create procedure lista_empleados_ordenados()
begin
    select apellido1, apellido2, nombre from empleado order by apellido1 asc, apellido2 asc, nombre asc;
end//
delimiter ;
call lista_empleados_ordenados();

-- 16. Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos que tienen mayor presupuesto.
delimiter //
create procedure lista_3_departamentos_mayor_presupuesto()
begin
    select nombre, presupuesto from departamento order by presupuesto desc limit 3;
end//
delimiter ;
call lista_3_departamentos_mayor_presupuesto();

-- 17. Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos que tienen menor presupuesto.
delimiter //
create procedure lista_3_departamentos_menor_presupuesto()
begin
    select nombre, presupuesto from departamento order by presupuesto asc limit 3;
end//
delimiter ;
call lista_3_departamentos_menor_presupuesto();

-- 18. Devuelve una lista con el nombre y el gasto, de los 2 departamentos que tienen mayor gasto.
delimiter //
create procedure lista_2_departamentos_mayor_gasto()
begin
    select nombre, gastos from departamento order by gastos desc limit 2;
end//
delimiter ;
call lista_2_departamentos_mayor_gasto();

-- 19. Devuelve una lista con el nombre y el gasto, de los 2 departamentos que tienen menor gasto.
delimiter //
create procedure lista_2_departamentos_menor_gasto()
begin
    select nombre, gastos from departamento order by gastos asc limit 2;
end//
delimiter ;
call lista_2_departamentos_menor_gasto();

-- 20. Devuelve una lista con 5 filas a partir de la tercera fila de la tabla empleado. La tercera fila se debe incluir en la respuesta. La respuesta debe incluir todas las columnas de la tabla empleado.
delimiter //
create procedure lista_5_filas_desde_tercera()
begin
    select * from empleado limit 2, 5;
end//
delimiter ;
call lista_5_filas_desde_tercera();

-- 21. Devuelve una lista con el nombre de los departamentos y el presupuesto, de aquellos que tienen un presupuesto mayor o igual a 150000 euros.
delimiter //
create procedure lista_departamentos_presupuesto_mayor_igual_150000()
begin
    select nombre, presupuesto from departamento where presupuesto >= 150000;
end//
delimiter ;
call lista_departamentos_presupuesto_mayor_igual_150000();

-- 22. Devuelve una lista con el nombre de los departamentos y el gasto, de aquellos que tienen menos de 5000 euros de gastos.
delimiter //
create procedure lista_departamentos_gasto_menor_5000()
begin
    select nombre, gastos from departamento where gastos < 5000;
end//
delimiter ;
call lista_departamentos_gasto_menor_5000();

-- 23. Devuelve una lista con el nombre de los departamentos y el presupuesto, de aquellos que tienen un presupuesto entre 100000 y 200000 euros. Sin utilizar el operador BETWEEN.
delimiter //
create procedure lista_departamentos_presupuesto_entre_100000_200000()
begin
    select nombre, presupuesto from departamento where presupuesto >= 100000 and presupuesto <= 200000;
end//
delimiter ;
call lista_departamentos_presupuesto_entre_100000_200000();

-- 24. Devuelve una lista con el nombre de los departamentos que no tienen un presupuesto entre 100000 y 200000 euros. Sin utilizar el operador BETWEEN.
delimiter //
create procedure lista_departamentos_presupuesto_fuera_100000_200000()
begin
    select nombre from departamento where presupuesto < 100000 or presupuesto > 200000;
end//
delimiter ;
call lista_departamentos_presupuesto_fuera_100000_200000();

-- 25. Devuelve una lista con el nombre de los departamentos que tienen un presupuesto entre 100000 y 200000 euros. Utilizando el operador BETWEEN.
delimiter //
create procedure lista_departamentos_presupuesto_between_100000_200000()
begin
    select nombre from departamento where presupuesto between 100000 and 200000;
end//
delimiter ;
call lista_departamentos_presupuesto_between_100000_200000();

-- 26. Devuelve una lista con el nombre de los departamentos que no tienen un presupuesto entre 100000 y 200000 euros. Utilizando el operador BETWEEN.
delimiter //
create procedure lista_departamentos_presupuesto_not_between_100000_200000()
begin
    select nombre from departamento where presupuesto not between 100000 and 200000;
end//
delimiter ;
call lista_departamentos_presupuesto_not_between_100000_200000();

-- 27. Devuelve una lista con el nombre de los departamentos, gastos y presupuesto, de aquellos departamentos donde los gastos sean mayores que el presupuesto del que disponen.
delimiter //
create procedure lista_departamentos_gastos_mayores_presupuesto()
begin
    select nombre, gastos, presupuesto from departamento where gastos > presupuesto;
end//
delimiter ;
call lista_departamentos_gastos_mayores_presupuesto();

-- 28. Devuelve una lista con el nombre de los departamentos, gastos y presupuesto, de aquellos departamentos donde los gastos sean menores que el presupuesto del que disponen.
delimiter //
create procedure lista_departamentos_gastos_menores_presupuesto()
begin
    select nombre, gastos, presupuesto from departamento where gastos < presupuesto;
end//
delimiter ;
call lista_departamentos_gastos_menores_presupuesto();

-- 29. Devuelve una lista con el nombre de los departamentos, gastos y presupuesto, de aquellos departamentos donde los gastos sean iguales al presupuesto del que disponen.
delimiter //
create procedure lista_departamentos_gastos_iguales_presupuesto()
begin
    select nombre, gastos, presupuesto from departamento where gastos = presupuesto;
end//
delimiter ;
call lista_departamentos_gastos_iguales_presupuesto();

-- 30. Lista todos los datos de los empleados cuyo segundo apellido sea NULL.
delimiter //
create procedure lista_empleados_segundo_apellido_null()
begin
    select * from empleado where apellido2 is null;
end//
delimiter ;
call lista_empleados_segundo_apellido_null();

-- 31. Lista todos los datos de los empleados cuyo segundo apellido no sea NULL.
delimiter //
create procedure lista_empleados_segundo_apellido_no_null()
begin
    select * from empleado where apellido2 is not null;
end//
delimiter ;
call lista_empleados_segundo_apellido_no_null();

-- 32. Lista todos los datos de los empleados cuyo segundo apellido sea López.
delimiter //
create procedure lista_empleados_segundo_apellido_lopez()
begin
    select * from empleado where apellido2 = 'López';
end//
delimiter ;
call lista_empleados_segundo_apellido_lopez();

-- 33. Lista todos los datos de los empleados cuyo segundo apellido sea Díaz o Moreno. Sin utilizar el operador IN.
delimiter //
create procedure lista_empleados_segundo_apellido_diaz_moreno()
begin
    select * from empleado where apellido2 = 'Díaz' or apellido2 = 'Moreno';
end//
delimiter ;
call lista_empleados_segundo_apellido_diaz_moreno();

-- 34. Lista todos los datos de los empleados cuyo segundo apellido sea Díaz o Moreno. Utilizando el operador IN.
delimiter //
create procedure lista_empleados_segundo_apellido_in()
begin
    select * from empleado where apellido2 in ('Díaz', 'Moreno');
end//
delimiter ;
call lista_empleados_segundo_apellido_in();

-- 35. Lista los nombres, apellidos y nif de los empleados que trabajan en el departamento 3.
delimiter //
create procedure lista_empleados_departamento_3()
begin
    select nombre, apellido1, apellido2, nif from empleado where id_departamento = 3;
end//
delimiter ;
call lista_empleados_departamento_3();

-- 36. Lista los nombres, apellidos y nif de los empleados que trabajan en los departamentos 2, 4 o 5.
delimiter //
create procedure lista_empleados_departamentos_2_4_5()
begin
    select nombre, apellido1, apellido2, nif from empleado where id_departamento in (2, 4, 5);
end//
delimiter ;
call lista_empleados_departamentos_2_4_5();

-- *****************************************
-- Consultas multitabla (Composición interna)
-- *****************************************

-- 1. Devuelve un listado con los empleados y los datos de los departamentos donde trabaja cada uno.

-- Quedo mal la wea :c (Bue, tengo trabajo pal finde)