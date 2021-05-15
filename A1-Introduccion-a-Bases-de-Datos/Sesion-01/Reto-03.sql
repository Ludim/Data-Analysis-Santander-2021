/*
  Reto 3: Ordenamientos y Límites
  1. Objetivos   Escribir consultas que permitan responder algunas 
    preguntas mediante ordenamientos y límites.
  2. Requisitos  MySQL Workbench instalado.
  3. Desarrollo  Usando la base de datos tienda, escribe una consulta 
    que permita obtener el top 5 de puestos por salarios.
*/
USE tienda;

SELECT * FROM puesto ORDER BY salario DESC LIMIT 5;