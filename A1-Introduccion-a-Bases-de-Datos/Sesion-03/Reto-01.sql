/*
  Reto 1: Agrupamientos y subconsultas
  1. Objetivos  Escribir consultas que permitan responder a algunas preguntas.
  2. Requisitos MySQL Workbench instalado.
  3. Desarrollo Usando la base de datos tienda, escribe consultas que permitan 
    responder las siguientes preguntas:
*/
USE tienda;

/* ¿Cuál es el nombre de los empleados que realizaron cada venta? */
SELECT e.id_empleado AS id_empleado, 
  CONCAT(nombre, ' ', apellido_paterno, ' ', apellido_materno) AS nombre
  FROM empleado AS e
  LEFT JOIN venta AS v
    ON e.id_empleado = v.id_empleado;

/* ¿Cuál es el nombre de los artículos que se han vendido? */
SELECT a.id_articulo, nombre
  FROM venta AS v
  RIGHT JOIN articulo AS a
    ON v.id_articulo = a.id_articulo;

/* ¿Cuál es el total de cada venta? */
SELECT clave, ROUND(SUM(precio), 2) AS total_venta
  FROM venta AS v
  INNER JOIN articulo AS a
    ON v.id_articulo = a.id_articulo
  GROUP BY clave;