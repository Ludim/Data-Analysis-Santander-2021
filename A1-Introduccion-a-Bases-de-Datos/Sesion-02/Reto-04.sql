/*
  Reto 4: Subconsultas
  1. Objetivos  Escribir consultas que permitan responder a algunas preguntas.
  2. Requisitos MySQL Workbench instalado.
  3. Desarrollo Usando la base de datos tienda, escribe consultas que permitan 
     responder las siguientes preguntas:
*/
USE tienda;

/* ¿Cuál es el nombre de los empleados cuyo sueldo es mayor $10,000?*/
SELECT nombre FROM empleado WHERE id_puesto IN 
  (SELECT id_puesto FROM puesto WHERE salario > 10000);

/* ¿Cuál es la cantidad mínima y máxima de ventas de cada empleado? */
SELECT id_empleado, MIN(numero_ventas), MAX(numero_ventas) FROM
  (SELECT clave, id_empleado, count(*) AS numero_ventas
    FROM venta
    GROUP BY clave, id_empleado) AS ventas
GROUP BY id_empleado;

/* ¿Cuál es el nombre del puesto de cada empleado? */
SELECT *, (SELECT nombre FROM puesto WHERE id_puesto = e.id_puesto) AS puesto
  FROM empleado AS e;