# Ejercicios Sesi贸n 4

## 1. Objetivos 馃幆
* Que el alumno comprenda la estructura de documentos de una base de datos MongoDB
* Que el alumno se familiarice con la notaci贸n JSON

## 2. Requisitos 馃搵

* MongoDB Compass iniciado y conectado al servidor de MongoDB
* Base de datos MiNombre y Colecciones users, movies y ratings creadas

## 3. Desarrollo 馃殌
A continuaci贸n se realizar谩n algunas operaciones de agregar, modificar y eliminar un documento JSON en una Colecci贸n.

Agregar los siguientes registros en formato CSV a la Colecci贸n movies

  4000,Avengers: Endgame (2019),Fantasy|Sci-Fi
  4001,Glass (2019),Drama|Fantasy

Incluyendo nombres de columnas quedar铆a:

  id,titulo,genres
  4000,Avengers: Endgame (2019),Fantasy|Sci-Fi
  4001,Glass (2019),Drama|Fantasy

Y entonces el correspondiente formato JSON ser谩:

{
  id:"4000",
  titulo:"Avengers: Endgame (2019)",
  genres:"Fantasy|Sci-Fi"
}
{
  id:"4001",
  titulo:"Glass (2019)",
  genres:"Drama|Fantasy"
}

Ahora ir a MongoDB Compass y agregar ambos documentos:

Adicionando campos u objetos

Al final presionar el bot贸n INSERT

Para poder observar nuestros documentos en la lista hay que realizar un filtro

{id: {$in: ["4000", "4001"]}}

Documentos en la colecci贸n

Modificar el documento con id=4001 en la Colecci贸n movies para que contenga la siguiente informaci贸n:

{
  id:"4001",
  titulo:"Glass (2019)",
  genres:"Drama|Fantasy",
  valoraciones: [
    {
      userid: "1563",
      movieid: "4001",
      rating: "4"
    },
    {
      userid: "434",
      movieid: "4001",
      rating: "5"
    }
  ]
}

Luego de presionar el bot贸n INSERT la lista de los dos documentos deber谩 de ser la siguiente:
El resultado final se puede ver en [Ejercicios.PNG](evidences/Ejercicios.PNG)

[`Anterior`](Reto-03.md) | [`Siguiente`](../Sesion-05/README.md)