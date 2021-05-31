/*
  Reto 1: Realizando operaciones con tablas
  1. Objetivos
    Realizar operaciones SQL para administrar tablas
    Crear tablas acorde a los datos
  2. Requisitos
    Servidor MySQL instalado
  3. Desarrollo:
*/
USE bedu_course;
/*
  1. Definir los campos y tipos de datos para la tabla movies haciendo uso de los 
    archivos movies.dat y README:

    $ head movies.dat
      1::Toy Story (1995)::Animation|Children's|Comedy
      2::Jumanji (1995)::Adventure|Children's|Fantasy
      3::Grumpier Old Men (1995)::Comedy|Romance
      4::Waiting to Exhale (1995)::Comedy|Drama
      5::Father of the Bride Part II (1995)::Comedy
      6::Heat (1995)::Action|Crime|Thriller
      7::Sabrina (1995)::Comedy|Romance
      8::Tom and Huck (1995)::Adventure|Children's
      9::Sudden Death (1995)::Action
      10::GoldenEye (1995)::Action|Adventure|Thriller

    $ cat README
      [...]
      MOVIES FILE DESCRIPTION
      ==========================================================================

      Movie information is in the file "movies.dat" and is in the following
      format:

      MovieID::Title::Genres

      - Titles are identical to titles provided by the IMDB (including
      year of release)
      - Genres are pipe-separated and are selected from the following genres:
          * Action
          * Adventure
          * Animation
          * Children's
          * Comedy
          * Crime
          * Documentary
          * Drama
          * Fantasy
          * Film-Noir
          * Horror
          * Musical
          * Mystery
          * Romance
          * Sci-Fi
          * Thriller
          * War
          * Western
*/
/*
  TABLA: movies
  CAMPO  | TIPO DE DATO
  id     | int primary key
  titulo | varchar 
  genero | varchar
*/

/*
  2. Crear la tabla movies (recuerda usar el mismo nombre del archivo sin la 
    extensión para vincular nombres de tablas con archivos).
*/
CREATE TABLE movies (
  `id` INT NOT NULL,
  `titulo` VARCHAR(80) NULL,
  `genero` VARCHAR(100) NULL,
  PRIMARY KEY (`id`));

/*
  3. Definir los campos y tipos de datos para la tabla ratings haciendo uso de 
    los archivos ratings.dat y README.
    $ head ratings.dat
      1::1193::5::978300760
      1::661::3::978302109
      1::914::3::978301968
      1::3408::4::978300275
      1::2355::5::978824291
      1::1197::3::978302268
      1::1287::5::978302039
      1::2804::5::978300719
      1::594::4::978302268
      1::919::4::978301368
    $ cat README
      RATINGS FILE DESCRIPTION
      ==========================================================================

      All ratings are contained in the file "ratings.dat" and are in the
      following format:

      UserID::MovieID::Rating::Timestamp

      - UserIDs range between 1 and 6040
      - MovieIDs range between 1 and 3952
      - Ratings are made on a 5-star scale (whole-star ratings only)
      - Timestamp is represented in seconds since the epoch as returned by time(2)
      - Each user has at least 20 ratings
*/

/*
  TABLA: ratings
  CAMPO     | TIPO DE DATO
  user_id   | int foreign key
  movie_id  | int foreign key
  rating    | tinyint
  timestamp | bigint
*/

/*
  4. Crear la tabla ratings (recuerda usar el mismo nombre del archivo sin la 
    extensión para vincular nombres de tablas con archivos)
  Nota: Observa que la tabla ratings requiere llaves foráneas. Revisa esta 
  referencia o pregunta a tu experta(o): 
  https://www.w3schools.com/sql/sql_foreignkey.asp
*/
CREATE TABLE ratings (
  `user_id` INT NULL,
  `movie_id` INT NULL,
  `rating` TINYINT NULL,
  `timestamp` BIGINT NULL,
  INDEX `user_id_idx` (`user_id` ASC) VISIBLE,
  INDEX `movie_id_idx` (`movie_id` ASC) VISIBLE,
  CONSTRAINT `user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `bedu_course`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `movie_id`
    FOREIGN KEY (`movie_id`)
    REFERENCES `bedu_course`.`movies` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
