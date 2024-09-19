CREATE  USER 'AbrilMosquera'@'%' IDENTIFIED BY 'abril17';
GRANT ALL PRIVILEGES ON chefencasa.* TO 'AbrilMosquera'@'%';
SHOW DATABASES;

USE chefencasa;

CREATE TABLE usuario(
   id INT  PRIMARY KEY AUTO_INCREMENT,
   user VARCHAR(50),
   contrasenia VARCHAR(50),
   email VARCHAR(50),
   idioma VARCHAR(50),
   pais_id INT,
   FOREIGN KEY (pais_id) REFERENCES pais(id)
)

CREATE TABLE pais(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50)
)

CREATE TABLE coccion(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50)
)

CREATE TABLE dietas (
	nombre_de_recetas VARCHAR(50),
	id INT PRIMARY KEY AUTO_INCREMENT
)

CREATE TABLE momentos_dias (
    momentos_del_dias VARCHAR(50),
    id INT PRIMARY KEY AUTO_INCREMENT
)

CREATE TABLE ingredientes (
   ID INT PRIMARY KEY AUTO_INCREMENT,
   tipo_de_ingrediente VARCHAR(50)
)

CREATE TABLE recetas(
    cantidad_de_personas INT,
    paso_a_paso TEXT,
    tipo_de_dificultad CHAR(3),
    id INT PRIMARY KEY AUTO_INCREMENT,
    pais_id INT,
    user_id INT,
    ingredientes_id INT,
    cocciones_id INT,
    momentoDia_id INT,
    dietas_id INT,
    FOREIGN KEY (pais_id) REFERENCES pais(id),
    FOREIGN KEY (user_id) REFERENCES usuario(id),
    FOREIGN KEY (ingredientes_id) REFERENCES ingredientes(ID),
    FOREIGN KEY (cocciones_id) REFERENCES coccion(id),
    FOREIGN KEY (momentoDia_id) REFERENCES momentos_dias(id),
    FOREIGN KEY (dietas_id) REFERENCES dietas(id)
)

CREATE TABLE medidas (
    id INT PRIMARY KEY,
    recetas VARCHAR(50),
    recetas_id INT,
    FOREIGN KEY (recetas_id) REFERENCES recetas(id)
)

CREATE TABLE rec_ing(
    id  INT PRIMARY KEY AUTO_INCREMENT,
    recetas_id INT,
    ingredientes_id INT,
    FOREIGN KEY (recetas_id) REFERENCES recetas(id),
    FOREIGN KEY (ingredientes_id) REFERENCES ingredientes(ID)
)

DROP TABLE momentos_dias;
DESCRIBE pais;
SHOW TABLES;

INSERT INTO usuario (user,email, contrasenia, idioma)
VALUES ('adhara','adhara@gmail.com','111','Español'),
      ('jorge','jorge@gmail.com','777','Ingles'),
      ('rosa','rosa@gmail.com','222','Español');


INSERT INTO pais (nombre) VALUES ("Argentina"),("Brasil"),("Colombia");

UPDATE pais SET nombre = "brasil " WHERE nombre = "Brasil";

DELETE FROM pais WHERE nombre = "Colombia";