[`Introducción a Bases de Datos`](../README.md) > [`Sesión 05`](README.md) > `Reto 2`
    
## Reto 2: Filtros básicos


### 1. Objetivos :dart:

- Proyectar columnas sobre distintos documentos para repasar algunos conceptos.

### 2. Requisitos :clipboard:

1. MongoDB Compass instalado.

### 3. Desarrollo :rocket:

Usando la base de datos `sample_mflix`, agrega proyeccciones, filtros, ordenamientos y límites que permitan contestar las siguientes preguntas:

a) ¿Qué comentarios ha hecho Greg Powell?
* Usar colección comments
  ```json
    {name: "Greg Powell"}
  ```

  ![imagen](evidences/Reto-02-a.PNG)


b) ¿Qué comentarios han hecho Greg Powell o Mercedes Tyler?
* Usar colección comments
  ```json
    {$or:
      [
        {name: "Greg Powell"},
        {name: "Mercedes Tyler"}
      ]
    }
  ```

  ![imagen](evidences/Reto-02-b.PNG)


c) ¿Cuál es el máximo número de comentarios en una película?
* Usar colección movies
* Proyectar
  ```json
    {num_mflix_comments:1}
  ```
* Ordenar
  ```json
    {num_mflix_comments:-1}
  ```
* Limitar a 1

  ![imagen](evidences/Reto-02-c.PNG)


d) ¿Cuál es título de las cinco películas más comentadas?
* Usar colección movies
* Proyectar
  ```json
    {num_mflix_comments:1, title:1  }
  ```
* Ordenar
  ```json
    {num_mflix_comments:-1}
  ```
* Limitar a 5

  ![imagen](evidences/Reto-02-d.PNG)


[`Anterior`](Reto-01.md) | [`Siguiente`](Ejercicios.md)

