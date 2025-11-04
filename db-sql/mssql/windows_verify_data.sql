/*
Script: windows_verify_data.sql
Database: Calendario_Laura y Calendario_Santiago

Purpose:
Realizar consultas de verificación para comprobar que las inserciones de datos fueron exitosas
en las tablas Categorias, Actividades y Recordatorios.

How to run:
Ejecutar después del script windows_seed_data.sql para validar los registros insertados.

Expected result:
- Categorias: Deben existir al menos dos registros ('Estudio', 'Trabajo').
- Actividades: Debe existir al menos una actividad ('Clase de SQL').
- Recordatorios: Debe existir al menos un recordatorio asociado a esa actividad.
*/

USE Calendario_Laura;
GO

SELECT * FROM Categorias;
SELECT * FROM Actividades;
SELECT * FROM Recordatorios;
GO

USE Calendario_Santiago;
GO

SELECT * FROM Categorias;
SELECT * FROM Actividades;
SELECT * FROM Recordatorios;
GO                                                            