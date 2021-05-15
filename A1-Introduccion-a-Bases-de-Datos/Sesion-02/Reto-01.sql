/*
  Reto 1: Agrupamientos y subconsultas
  1. Objetivos    Escribir consultas que permitan responder algunas preguntas.
  2. Requisitos   MySQL Workbench instalado.
  3. Desarrollo   Usando la base de datos tienda, escribe consultas que 
     permitan responder las siguientes preguntas:
*/
USE tienda;

/* ¿Qué artículos incluyen la palabra Pasta en su nombre? */
SELECT * FROM articulo WHERE nombre LIKE "%Pasta%";

/* ¿Qué artículos incluyen la palabra Cannelloni en su nombre? */
SELECT * FROM articulo WHERE nombre LIKE "%Cannelloni%";

/* ¿Qué nombres están separados por un guión (-) por ejemplo Puree - Kiwi? */
SELECT * FROM articulo WHERE nombre LIKE "%-%";