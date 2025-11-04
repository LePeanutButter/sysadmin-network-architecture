/*
Script: slackware_create_tables_turismo.sql
Purpose:
Crea las tablas 'departamentos', 'ciudades' y 'lugares_turisticos' 
en ambas bases de datos: 'turismo_laura' y 'turismo_santiago'.
Cada bloque se ejecuta tras conectarse a su respectiva base de datos.

How to run:
Ejecutar en la consola psql con un usuario que tenga acceso a ambas bases de datos.
*/

-- ===== TURISMO_LAURA =====
\c turismo_laura

CREATE TABLE departamentos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE ciudades (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    id_departamento INT REFERENCES departamentos(id)
);

CREATE TABLE lugares_turisticos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    descripcion TEXT,
    id_ciudad INT REFERENCES ciudades(id)
);

-- ===== TURISMO_SANTIAGO =====
\c turismo_santiago

CREATE TABLE departamentos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE ciudades (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    id_departamento INT REFERENCES departamentos(id)
);

CREATE TABLE lugares_turisticos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    descripcion TEXT,
    id_ciudad INT REFERENCES ciudades(id)
);
