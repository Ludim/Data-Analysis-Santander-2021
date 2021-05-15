/*
  Reto 2: Funciones de agrupamiento
  1. Objetivos  Escribir consultas que permitan responder a algunas preguntas.
  2. Requisitos MySQL Workbench instalado.
  3. Desarrollo Usando la base de datos tienda, escribe consultas que permitan 
     responder las siguientes preguntas:
*/
USE tienda;

/* ¿Cuál es el promedio de salario de los puestos? */
SELECT AVG(salario) FROM puesto;

/* ¿Cuántos artículos incluyen la palabra Pasta en su nombre? */
SELECT COUNT(*) FROM articulo WHERE nombre LIKE '%Pasta%';

/* ¿Cuál es el salario mínimo y máximo? */
SELECT MIN(salario), MAX(salario) FROM puesto;

/* ¿Cuál es la suma del salario de los últimos cinco puestos agregados? */
SELECT SUM(salario) FROM 
  (SELECT salario FROM puesto ORDER BY id_puesto DESC LIMIT 5) AS salarios;