/*
Script: slackware_insert_turismo.sql
Purpose:
Inserta datos de ejemplo en las bases de datos 'turismo_laura' y 'turismo_santiago'.
Cada bloque corresponde a una base de datos distinta. 
Los datos reflejan departamentos, ciudades y lugares turísticos diferentes en cada una.

How to run:
1. Ejecutar en la consola psql con usuario postgres.
2. El script usa el comando \c para conectarse a cada base.

*/

-- ===== TURISMO_LAURA =====
\c turismo_laura

INSERT INTO departamentos (nombre) 
VALUES 
    ('Antioquia'),
    ('Guaviare'),
    ('Amazonas');

INSERT INTO ciudades (nombre, id_departamento) 
VALUES 
    ('Medellín', 1),
    ('San José del Guaviare', 2),
    ('Leticia', 3);

INSERT INTO lugares_turisticos (nombre, descripcion, id_ciudad)
VALUES 
    ('Comuna 13', 'Lugar que ha experimentado una transformación social significativa', 1),
    ('Ciudad de piedra', 'Formaciones rocosas impresionantes', 2),
    ('Isla de los Micos', 'Reserva natural con biodiversidad única', 3);



-- ===== TURISMO_SANTIAGO =====
\c turismo_santiago

INSERT INTO departamentos (nombre) 
VALUES 
    ('Cundinamarca'),
    ('Boyacá'),
    ('Nariño');

INSERT INTO ciudades (nombre, id_departamento) 
VALUES 
    ('Bogotá', 1),
    ('Villa de Leyva', 2),
    ('Pasto', 3);

INSERT INTO lugares_turisticos (nombre, descripcion, id_ciudad)
VALUES 
    ('Monserrate', 'Santuario en la cima de los cerros orientales con vista panorámica de Bogotá', 1),
    ('Plaza Mayor', 'Centro histórico con arquitectura colonial', 2),
    ('Laguna de la Cocha', 'Hermoso lago rodeado de montañas y naturaleza', 3);
