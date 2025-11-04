/*
Script: windows_create_tables.sql
Database: Calendario_Laura y Calendario_Santiago

Purpose:
Crear las tablas principales del sistema de calendario para las bases de datos Calendario_Laura y Calendario_Santiago,
incluyendo relaciones mediante claves primarias y foráneas.

Tablas incluidas:
1. Categorias
   - Almacena categorías para clasificar actividades.

2. Actividades
   - Registra eventos/actividades del usuario.
   - Relacionada con Categorias mediante IdCategoria (FK).

3. Recordatorios
   - Almacena recordatorios asociados a una actividad.
   - Relacionada con Actividades mediante IdActividad (FK).

Constraints automáticas definidas:
- PRIMARY KEY en las tres tablas.
- FOREIGN KEY en Actividades.IdCategoria → Categorias.IdCategoria
- FOREIGN KEY en Recordatorios.IdActividad → Actividades.IdActividad

How to run:
Ejecutar conectado a la base de datos master.
IMPORTANTE: Requiere que la base Calendario_Laura exista.
*/

-- ===== Calendario_Laura =====
USE Calendario_Laura;
GO

CREATE TABLE Categorias (
    IdCategoria INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(100) NOT NULL
);
GO

CREATE TABLE Actividades (
    IdActividad INT IDENTITY(1,1) PRIMARY KEY,
    Titulo NVARCHAR(100) NOT NULL,
    Descripcion NVARCHAR(255),
    FechaInicio DATETIME,
    FechaFin DATETIME,
    IdCategoria INT,
    FOREIGN KEY (IdCategoria) REFERENCES Categorias(IdCategoria)
);
GO

CREATE TABLE Recordatorios (
    IdRecordatorio INT IDENTITY(1,1) PRIMARY KEY,
    IdActividad INT NOT NULL,
    FechaRecordatorio DATETIME,
    Metodo NVARCHAR(50),
    FOREIGN KEY (IdActividad) REFERENCES Actividades(IdActividad)
);
GO

-- ===== Calendario_Santiago =====
USE Calendario_Santiago;
GO

CREATE TABLE Categorias (
    IdCategoria INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(100) NOT NULL
);
GO

CREATE TABLE Actividades (
    IdActividad INT IDENTITY(1,1) PRIMARY KEY,
    Titulo NVARCHAR(100) NOT NULL,
    Descripcion NVARCHAR(255),
    FechaInicio DATETIME,
    FechaFin DATETIME,
    IdCategoria INT,
    FOREIGN KEY (IdCategoria) REFERENCES Categorias(IdCategoria)
);
GO

CREATE TABLE Recordatorios (
    IdRecordatorio INT IDENTITY(1,1) PRIMARY KEY,
    IdActividad INT NOT NULL,
    FechaRecordatorio DATETIME,
    Metodo NVARCHAR(50),
    FOREIGN KEY (IdActividad) REFERENCES Actividades(IdActividad)
);
GO