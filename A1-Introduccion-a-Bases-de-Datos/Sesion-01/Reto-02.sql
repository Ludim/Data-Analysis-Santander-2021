/*
  Reto 2: Estructura básica de una consulta
  1. Objetivos    Escribir consultas que permitan responder a algunas preguntas.
  2. Requisitos   MySQL Workbench instalado.
  3. Desarrollo   Usando la base de datos tienda, escribe consultas
    que permitan responder las siguientes preguntas.
    - ¿Cuál es el nombre de los empleados con el puesto 4?
    - ¿Qué puestos tienen un salario mayor a $10,000?
    - ¿Qué artículos tienen un precio mayor a $1,000 y un iva mayor a 100?
    - ¿Qué ventas incluyen los artículos 135 o 963 y fueron hechas por los empleados 835 o 369?
*/
USE tienda;
SHOW tables;

/* ¿Cuál es el nombre de los empleados con el puesto 4? */
SELECT nombre FROM empleado WHERE id_puesto = 4;

/* ¿Qué puestos tienen un salario mayor a $10,000? */
SELECT * FROM puesto WHERE salario > 10000;

/* ¿Qué artículos tienen un precio mayor a $1,000 y un iva mayor a 100? */
SELECT * FROM articulo WHERE precio > 1000 AND iva > 100;

/* ¿Qué ventas incluyen los artículos 135 o 963 y fueron hechas por los empleados 835 o 369? */
SELECT * FROM venta WHERE (id_articulo IN (135,963) AND id_empleado IN (835, 369));