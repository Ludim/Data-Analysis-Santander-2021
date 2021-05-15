/*
  Reto 1: Estructura de una tabla
  1. Objetivos Consultar la estructura de algunas tablas.
  2. Requisitos MySQL Workbench instalado.
  3. Desarrollo Usando la base de datos tienda, 
     muestra la descripción de las tablas articulo, puesto y venta. 
     Por cada tipo de dato que encuentres llena la siguiente tabla 
     (a mano, puedes dibujarla en un cuaderno o dónde tú prefieras). 
*/

SHOW databases;
USE tienda;
SHOW tables;

DESCRIBE articulo;
/*
  TIPO        | DESCRIPCIÓN
  --------------------------
  int         | id_articulo
  varchar(45) | nombre 
  double      | precio
  double      | iva
  int         | cantidad
*/

DESCRIBE empleado;
/*
  TIPO          | DESCRIPCIÓN
  --------------------------
  int           | id_empleado
  int           | id_puesto
  varchar(45)   | nombre
  varchar(45)   | apellido_paterno
  varchar(45)   | apellido_materno
  varchar(13)   | rfc
*/

DESCRIBE puesto;
/*
  TIPO        | DESCRIPCIÓN
  --------------------------
  int         | id_puesto
  varchar(45) | nombre
  double      | salario
*/

DESCRIBE venta;
/*
  TIPO        | DESCRIPCIÓN
  --------------------------
  int         | id_venta
  int         | id_articulo 
  int         | id_empleado
  varchar(45) | clave
  timestamp   | fecha
*/


/*
  ******************     RESPUESTA    **********************
  TIPO      | DESCRIPCIÓN
  ----------------------------------------------------------
  int       | Datos de tipo numérico entero
  varchar   | Datos de tipo alfanuméricos
  double    | Datos de tipo numérico con decimales
  timestamp | Datos de tipo fechas (año, mes, día y hora)
*/
