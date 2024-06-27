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

