/*
  Reto 2: Importando datos a una tabla en formato CSV
  1. Objetivos 🎯
    Aplicar el procedimiento para importación de datos a una tabla
    Validar que la correcta importación de los datos

  2. Requisitos 📋
    Servidor MySQL instalado

  3. Desarrollo 🚀
*/
USE bedu_course;

/*
  1. Usando como base el archivo movies.dat, limpiarlo e importar los datos en 
  la tabla movies creada en el Reto 1.
  Importante: Este archivo presenta un problema muy común de encoding, es decir, 
  la codificación con la que fue definido, no es reconocida por MySQL. 
  Para solucionar este problema, elige una codificación diferente al momento de 
  cargar los datos.
*/
SELECT COUNT(*) FROM movies;
# total = 3383

/*
  2. Usando como base el archivo ratings.dat, limpiarlo e importar los datos 
  en la tabla ratings creada en el Reto 2.

  Importante: Como podrás notar, este archivo tiene demasiados registros, de 
  manera que es normal que la carga sea muy lenta. Esto es algo muy común cuando 
  nos enfrentamos a la carga de archivos. 

  Si ya lleva mucho tiempo y no finaliza, no te preocupes, puedes cancelar la carga.
*/
SELECT COUNT(*) FROM ratings;
# total = 1000209

/* 3. Finalmente, añade un registro en cada tabla usando INSERT INTO. */
INSERT INTO users(id,genero,edad,ocup,cp) VALUES (6041,'F', 25, 17, 61614);
SELECT * FROM users WHERE id=6041;

INSERT INTO movies(id,titulo,genero) VALUES (3953,'Mulan', 'Children\'s');
SELECT * FROM users WHERE id=3953;

-- Si añadiste llaves foráneas, recuerda que debes añadir primero los registros en las tablas users y movies.
INSERT INTO ratings(user_id,movie_id,rating,time_stamp) VALUES (6041,3953,5,978300760);
