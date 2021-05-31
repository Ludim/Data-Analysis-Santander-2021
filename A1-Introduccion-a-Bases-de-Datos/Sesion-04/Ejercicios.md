# Ejercicios Sesión 4

## 1. Objetivos 🎯
* Que el alumno comprenda la estructura de documentos de una base de datos MongoDB
* Que el alumno se familiarice con la notación JSON

## 2. Requisitos 📋

* MongoDB Compass iniciado y conectado al servidor de MongoDB
* Base de datos MiNombre y Colecciones users, movies y ratings creadas

## 3. Desarrollo 🚀
A continuación se realizarán algunas operaciones de agregar, modificar y eliminar un documento JSON en una Colección.

Agregar los siguientes registros en formato CSV a la Colección movies

  4000,Avengers: Endgame (2019),Fantasy|Sci-Fi
  4001,Glass (2019),Drama|Fantasy

Incluyendo nombres de columnas quedaría:

  id,titulo,genres
  4000,Avengers: Endgame (2019),Fantasy|Sci-Fi
  4001,Glass (2019),Drama|Fantasy

Y entonces el correspondiente formato JSON será:

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

Al final presionar el botón INSERT

Para poder observar nuestros documentos en la lista hay que realizar un filtro

{id: {$in: ["4000", "4001"]}}

Documentos en la colección

Modificar el documento con id=4001 en la Colección movies para que contenga la siguiente información:

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

Luego de presionar el botón INSERT la lista de los dos documentos deberá de ser la siguiente:
El resultado final se puede ver en [Ejercicios.PNG](evidences/Ejercicios.PNG)