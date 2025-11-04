/*
Script: slackware_create_databases.sql
Purpose:
Crea las bases de datos 'turismo_laura' y 'turismo_santiago', 
asignando como propietarios a los usuarios previamente creados.

How to run:
Ejecutar en la consola psql con un usuario con permisos de superusuario, 
por ejemplo:
psql -U postgres
Luego copiar y ejecutar este script.

*/

CREATE DATABASE turismo_laura OWNER laura;
CREATE DATABASE turismo_santiago OWNER santiago;
