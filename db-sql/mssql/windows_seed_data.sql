/*
Script: windows_seed_data.sql
Database: Calendario_Laura y Calendario_Santiago

Purpose:
Insertar datos de ejemplo en las tablas Categorias, Actividades y Recordatorios
para pruebas y demostraciones.

Preconditions:
- La bases de datos Calendario_Laura, Calendario_Santiago y las tablas Categorias, Actividades y Recordatorios
  deben existir.

How to run:
Ejecutar en SSMS con la conexión apuntando a la instancia que contiene Calendario_Laura y Calendario_Santiago
*/

USE Calendario_Laura;
GO

INSERT INTO Categorias (Nombre) VALUES ('Estudio');
INSERT INTO Categorias (Nombre) VALUES ('Trabajo');
GO

INSERT INTO Actividades (Titulo, Descripcion, FechaInicio, FechaFin, IdCategoria)
VALUES ('Clase de SQL', 'Aprender consultas básicas', '2025-10-10 08:00', '2025-10-10 10:00', 1);
GO

INSERT INTO Recordatorios (IdActividad, FechaRecordatorio, Metodo)
VALUES (1, '2025-10-10 07:00', 'Correo');
GO

USE Calendario_Santiago;
GO

INSERT INTO Categorias (Nombre) VALUES ('Ejercicio');
INSERT INTO Categorias (Nombre) VALUES ('Proyecto');
GO

INSERT INTO Actividades (Titulo, Descripcion, FechaInicio, FechaFin, IdCategoria)
VALUES ('Entrenamiento', 'Corner 5km', '2025-10-09 06:00:00', '2025-10-09 07:00:00', 1);
GO

INSERT INTO Recordatorios (IdActividad, FechaRecordatorio, Metodo)
VALUES (1, '2025-10-09 05:30', 'Alarma')
GO