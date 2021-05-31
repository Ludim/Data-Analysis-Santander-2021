/*
  Ejercicios Sesión 3
  1. Objetivos  Aplicar los conceptos adquiridos durante la sesión.
  2. Requisitos MySQL Workbench instalado.
  3. Desarrollo Todos los ejercicios debes hacerlos usando la base classicmodels.
    Todas las consultas que realices deberás mantenerlas dentro del editor de 
    textos de MySQL Workbench. Al finalizar, guarda este archivo, llendo al menú 
    File > Save script. Recuerda añadir a todos los nombres te tus vistas el sufijo 
    con tu identificador.
*/
USE classicmodels;
/* Para estas consultas usa INNER JOIN */

-- 1. Obtén la cantidad de productos de cada orden. --
SELECT od.orderNumber AS orden, SUM(quantityOrdered) AS total_products
FROM orderdetails od
INNER JOIN orders o
  ON od.orderNumber = o.orderNumber
GROUP BY od.orderNumber;

-- 2. Obtén el número de orden, estado y costo total de cada orden. --
SELECT od.orderNumber AS orden, o.status AS estado,
  SUM(quantityOrdered * priceEach)  AS costo_total
FROM orderdetails od
INNER JOIN orders o
  ON od.orderNumber = o.orderNumber
GROUP BY od.orderNumber;

-- 3. Obtén el número de orden, fecha de orden, línea de orden, --
-- nombre del producto, cantidad ordenada y precio de cada pieza. --
SELECT od.orderNumber AS orden, o.orderDate AS fecha_orden,
od.orderLineNumber AS linea_orden, productName AS nombre_producto,
quantityOrdered AS cantidad_ordenada, priceEach AS precio_por_pieza
FROM orderdetails od
INNER JOIN orders o
  ON od.orderNumber = o.orderNumber
INNER JOIN products p
  ON p.productCode = od.productCode;

-- 4. Obtén el número de orden, nombre del producto,  --
-- el precio sugerido de fábrica (msrp) y precio de cada pieza. --
SELECT od.orderNumber AS orden, productName AS nombre_producto,
MSRP as precio_sugerido_fabrica, priceEach AS precio_por_pieza
FROM orderdetails od
INNER JOIN orders o
  ON od.orderNumber = o.orderNumber
INNER JOIN products p
  ON p.productCode = od.productCode;

/* Para estas consultas usa LEFT JOIN */

-- 5. Obtén el número de cliente, nombre de cliente, número de orden -- 
-- y estado de cada orden hecha por cada cliente. --
-- ¿De que nos sirve hacer LEFT JOIN en lugar de JOIN? --
SELECT c.customerNumber AS numero_cliente, customerName AS nombre_cliente, 
orderNumber AS numero_orden, status AS estado_orden
FROM customers c
LEFT JOIN orders o
  ON o.customerNumber = c.customerNumber;
/*
  ¿De que nos sirve hacer LEFT JOIN en lugar de JOIN? 
  Al hacer uso de LEFT JOIN significa que va a incluir todas las filas 
  de la tabla referenciada en el lado izquierdo y solo los registros
  de la tabla derecha que si existan en la condicion indicada.
  Al usar LEFT JOIN me regresa 350 registros
  Al usar JOIN me regresa 326 registros
*/

-- 6. Obtén los clientes que no tienen una orden asociada. --
SELECT c.customerNumber AS id_cliente, customerName nombre_cliente
FROM customers c
LEFT JOIN orders o
  ON o.customerNumber = c.customerNumber
WHERE orderNumber IS NULL;

-- 7. Obtén el apellido de empleado, nombre de empleado, --
-- nombre de cliente, número de cheque y total, es decir, --
-- los clientes asociados a cada empleado. --
SELECT e.lastName AS apellido_empleado, e.firstName AS nombre_empleado, 
customerName AS nombre_cliente, checkNumber AS numero_cheque,
amount AS total
FROM employees e
LEFT JOIN customers c
  ON e.employeeNumber = c.salesRepEmployeeNumber
LEFT JOIN payments p
  ON p.customerNumber = c.customerNumber
WHERE customerName IS NOT NULL
ORDER BY customerName;

/* Para estas consultas usa RIGHT JOIN */

-- 8. Repite los ejercicios 5 a 7 usando RIGHT JOIN. ¿Representan lo mismo? -- 
-- Explica las diferencias en un comentario. Para poner comentarios usa "--" --

-- 8) 5. Obtén el número de cliente, nombre de cliente, número de orden -- 
-- y estado de cada orden hecha por cada cliente. --
SELECT c.customerNumber AS numero_cliente, customerName AS nombre_cliente, 
orderNumber AS numero_orden, status AS estado_orden
FROM customers c
RIGHT JOIN orders o
  ON o.customerNumber = c.customerNumber;
-- Obtuve la misma cantidad de registros del JOIN = 326 registros--

-- 8) 6. Obtén los clientes que no tienen una orden asociada. --
SELECT c.customerNumber AS id_cliente, customerName nombre_cliente
FROM customers c
RIGHT JOIN orders o
  ON o.customerNumber = c.customerNumber
WHERE orderNumber IS NULL;
-- No me regreso ningun registro, con LEFT me regreso 24 --

-- 8) 7. Obtén el apellido de empleado, nombre de empleado, --
-- nombre de cliente, número de cheque y total, es decir, --
-- los clientes asociados a cada empleado. --
SELECT COUNT(*)/*e.lastName AS apellido_empleado, e.firstName AS nombre_empleado, 
customerName AS nombre_cliente, checkNumber AS numero_cheque,
amount AS total*/
FROM employees e
RIGHT JOIN customers c
  ON e.employeeNumber = c.salesRepEmployeeNumber
RIGHT JOIN payments p
  ON p.customerNumber = c.customerNumber
WHERE customerName IS NOT NULL
ORDER BY customerName;
-- Con LEFT obtuve 275 registros, con RIGHT 273 --

-- 9. Escoge 3 consultas de los ejercicios anteriores, -- 
-- crea una vista y escribe una consulta para cada una. --

-- 9) 1. Obtén la cantidad de productos de cada orden. --
CREATE view productos_ordenes_476 AS 
  SELECT od.orderNumber AS orden, SUM(quantityOrdered) AS total_products
  FROM orderdetails od
  INNER JOIN orders o
    ON od.orderNumber = o.orderNumber
  GROUP BY od.orderNumber;

SELECT * FROM productos_ordenes_476;
-- 9) 2. Obtén el número de orden, estado y costo total de cada orden. --
CREATE view ordenes_costo_476 AS 
  SELECT od.orderNumber AS orden, o.status AS estado,
    SUM(quantityOrdered * priceEach)  AS costo_total
  FROM orderdetails od
  INNER JOIN orders o
    ON od.orderNumber = o.orderNumber
  GROUP BY od.orderNumber;

SELECT * FROM ordenes_costo_476 WHERE estado != "Shipped";

-- 9) 3. Obtén el número de orden, fecha de orden, línea de orden, --
-- nombre del producto, cantidad ordenada y precio de cada pieza. --
CREATE view ordenes_detalles_476 AS 
SELECT od.orderNumber AS orden, o.orderDate AS fecha_orden,
od.orderLineNumber AS linea_orden, productName AS nombre_producto,
quantityOrdered AS cantidad_ordenada, priceEach AS precio_por_pieza
FROM orderdetails od
INNER JOIN orders o
  ON od.orderNumber = o.orderNumber
INNER JOIN products p
  ON p.productCode = od.productCode;

SELECT * FROM ordenes_detalles_476 ORDER BY linea_orden;