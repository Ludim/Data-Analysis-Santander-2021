/*
  Reto 2: Definición de vistas
  1. Objetivos  Definir vistas sobre algunas consultas.
  2. Requisitos MySQL Workbench instalado.
  3. Desarrollo 
  IMPORTANTE!!!
  Para este reto necesitarás un identificador único. Tu identificador 
  serán los últimos tres dígitos de tu número de celular. Por ejemplo, 
  si tu número es: 5512345678 tu identificador debe ser 678. 476

  Usando la base de datos tienda, define las siguientes vistas que 
  permitan obtener la siguiente información.

  AÑADE A TODOS LOS NOMBRES DE TUS VISTAS EL SUFIJO _<tu identificador>. 
  Por ejemplo mi_vista_hermosa_123.
*/
USE tienda;

/* Obtener el puesto de un empleado. */
CREATE VIEW puestos_476 AS
  SELECT e.id_empleado, CONCAT(e.nombre, ' ', e.apellido_paterno, ' ', e.apellido_materno) AS nombre, p.nombre AS puesto
    FROM empleado AS e
    JOIN puesto p
      ON e.id_puesto = p.id_puesto;

SELECT * FROM puestos_476;

/* Saber qué artículos ha vendido cada empleado. */
CREATE VIEW empleado_venta_articulos_476 as 
  SELECT e.id_empleado, CONCAT(e.nombre, ' ', e.apellido_paterno, ' ', e.apellido_materno) AS nombre, 
  v.clave, a.id_articulo AS id_articulo, a.nombre AS nombre_articulo
    FROM venta v
    JOIN empleado e
      ON e.id_empleado = v.id_empleado
    JOIN articulo a
      ON a.id_articulo= v.id_articulo;

SELECT * FROM empleado_venta_articulos_476;

/* Saber qué puesto ha tenido más ventas. */
CREATE VIEW puesto_ventas_476 as 
  SELECT p.nombre AS puesto, COUNT(v.clave) AS total_ventas
    FROM venta v
    JOIN empleado e
      ON e.id_empleado = v.id_empleado
    JOIN puesto p
      ON p.id_puesto= e.id_puesto
    GROUP BY p.nombre;

SELECT *
  FROM puesto_ventas_476
  ORDER BY total_ventas DESC
  LIMIT 1;