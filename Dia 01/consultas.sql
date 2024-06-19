show tables;

-- 1. Número de pacientes atendidos por cada médico

select Medico_ID, 
count(*) as Numero_Pacientes
from pacientes
group by Medico_ID;

-- 2. Total de días de vacaciones planificadas y disfrutadas por cada empleado

select Empleado_ID,
sum(datediff(Fecha_Fin, Fecha_Inicio) + 1) as Dias_Vacaciones
from vacaciones
group by Empleado_ID;

-- 3. Médicos con mayor cantidad de horas de consulta en la semana

select Medico_ID, 
sum(timestampdiff(hour, Hora_Inicio, Hora_Fin)) as Horas_Semanales
from horarios_medicos
group by Medico_ID
order by Horas_Semanales desc
limit 1;

-- 4. Número de sustituciones realizadas por cada médico sustituto

select Medico_ID, 
count(*) as Numero_Sustituciones
from sustituciones
group by Medico_ID;

-- 5. Número de médicos que están actualmente en sustitución

select count(distinct Medico_ID) as Medicos_En_Sustitucion
from sustituciones
where Fecha_Alta > Fecha_Baja OR Fecha_Baja IS NULL;

-- 6. Horas totales de consulta por médico por día de la semana

SELECT 
    Medico_ID,
    Dia_Semana,
    SUM(TIMESTAMPDIFF(HOUR,
        Hora_Inicio,
        Hora_Fin)) AS Horas_Totales
FROM
    horarios_medicos
GROUP BY Medico_ID , Dia_Semana;

-- 7. Médico con mayor cantidad de pacientes asignados

select Medico_ID, 
count(*) as Numero_Pacientes
from pacientes
group by Medico_ID
order by Numero_Pacientes DESC
limit 1;

-- 8. Empleados con más de 10 días de vacaciones disfrutadas

select Empleado_ID, 
sum(datediff(Fecha_Fin, Fecha_Inicio) + 1) as Dias_Disfrutados
from vacaciones
where Estado = 'Disfrutadas'
group by Empleado_ID
having Dias_Disfrutados > 10;

-- 9. Médicos que actualmente están realizando una sustitución

select distinct Medico_ID
from sustituciones
where Fecha_Alta > Fecha_Baja OR Fecha_Baja IS NULL;

-- 10. Promedio de horas de consulta por médico por día de la semana

select Medico_ID, Dia_Semana, 
AVG(TIMESTAMPDIFF(HOUR, Hora_Inicio, Hora_Fin)) as Promedio_Horas
from horarios_medicos
group by Medico_ID, Dia_Semana;
