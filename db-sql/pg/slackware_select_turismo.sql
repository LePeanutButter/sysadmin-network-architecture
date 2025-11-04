/*
Script: slackware_select_turismo.sql
Purpose:
Consulta los datos de las tablas 'departamentos', 'ciudades' y 'lugares_turisticos' 
en las bases de datos 'turismo_laura' y 'turismo_santiago' para verificar las inserciones realizadas.

How to run:
1. Ejecutar en la consola psql con el usuario postgres.
2. El script usa el comando \c para cambiar de base de datos entre consultas.
*/

-- ===== TURISMO_LAURA =====
\c turismo_laura

SELECT * FROM lugares_turisticos;
SELECT * FROM ciudades;
SELECT * FROM departamentos;


-- ===== TURISMO_SANTIAGO =====
\c turismo_santiago

SELECT * FROM lugares_turisticos;
SELECT * FROM ciudades;
SELECT * FROM departamentos;
