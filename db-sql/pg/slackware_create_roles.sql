/*
Script: slackware_create_roles.sql
Purpose:
Crea los roles de usuario 'laura' y 'santiago' en PostgreSQL en Slackware, 
cada uno con la capacidad de iniciar sesión y una contraseña asignada. 

How to run:
Ejecutar en la consola psql con un usuario que tenga permisos de superusuario, 
por ejemplo:
psql -U postgres
Luego copiar y pegar este script.

*/

CREATE ROLE laura WITH LOGIN PASSWORD '1234';
CREATE ROLE santiago WITH LOGIN PASSWORD '1234';
