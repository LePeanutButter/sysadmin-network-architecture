/*
Script: windows_create_logins_and_users.sql
Purpose:
Crea los LOGINS a nivel de servidor para los usuarios Laura y Santiago.
Luego, crea los usuarios correspondientes dentro de las bases de datos
Calendario_Laura y Calendario_Santiago, y les asigna permisos de propietario (db_owner).

How to run:
Ejecutar conectado a la instancia SQL Server.
*/


CREATE LOGIN Laura WITH PASSWORD = 'Segura123';
CREATE LOGIN Santiago WITH PASSWORD = 'Segura123';
GO

USE Calendario_Laura;
GO
CREATE USER Laura FOR LOGIN Laura;
ALTER ROLE db_owner ADD MEMBER Laura;
GO

USE Calendario_Santiago;
GO
CREATE USER Santiago FOR LOGIN Santiago;
ALTER ROLE db_owner ADD MEMBER Santiago;
GO
