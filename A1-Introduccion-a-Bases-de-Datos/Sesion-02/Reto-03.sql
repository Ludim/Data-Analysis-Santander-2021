/*
  Reto 3: Agrupamientos
  1. Objetivos  Escribir consultas que permitan responder algunas preguntas.
  2. Requisitos MySQL Workbench instalado.
  3. Desarrollo Usando la base de datos tienda, escribe consultas que permitan 
     responder las siguientes preguntas:
*/
USE tienda;

/* ¿Cuántos registros hay por cada uno de los puestos? */
SELECT nombre, COUNT(*) FROM puesto GROUP BY nombre;

/* ¿Cuánto dinero se paga en total por puesto? */
SELECT nombre, SUM(salario) FROM puesto GROUP BY nombre;

/* ¿Cuál es el número total de ventas por vendedor? */
SELECT id_empleado, COUNT(clave) AS ventas FROM venta GROUP BY id_empleado;

/* ¿Cuál es el número total de ventas por artículo? */
SELECT id_articulo, COUNT(clave) AS ventas FROM venta GROUP BY id_articulo;
