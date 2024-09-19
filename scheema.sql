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
    nombre VARCHAR(50) UNIQUE
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

<<<<<<< HEAD
/* inserte los datos en la tabla de momentos del dia*/
INSERT INTO momentos_dias (momentos_del_dias, descripcion) VALUES
('desayuno', 'Primera comida del día, generalmente por la mañana.'),
('almuerzo', 'Comida principal del día, normalmente al mediodía.'),
('cena', 'Comida que se toma por la noche.'),
('postre', 'Plato dulce que se sirve después de la comida.'),
('snacks', 'Comidas ligeras entre las comidas principales.'),
('merienda', 'Comida ligera que se toma entre la tarde y la cena.');
=======
INSERT INTO usuario (user,email, contrasenia, idioma)
VALUES ('adhara','adhara@gmail.com','111','Español'),
      ('jorge','jorge@gmail.com','777','Ingles'),
      ('rosa','rosa@gmail.com','222','Español');


<<<<<<< HEAD
UPDATE usuario
SET contrasenia = '123'
WHERE id = '4';

DELETE FROM usuario
WHERE id = '5';
=======
INSERT INTO pais (nombre) VALUES ("Argentina"),("Brasil"),("Colombia");

<<<<<<< HEAD
UPDATE pais SET nombre = "brasil " WHERE nombre = "Brasil";

DELETE FROM pais WHERE nombre = "Colombia";

SELECT DISTINCT nombre from pais;
DELETE FROM pais WHERE nombre = "brasil";
DELETE FROM pais WHERE id = 10;

ALTER TABLE pais ADD CONSTRAINT unique_nombre UNIQUE (nombre);
=======

INSERT INTO (nombre)
VALUES ("plancha"),
   	("horno"),
   	("hervido"),
   	("freidora de aire"),
   	("frito"),
   	("microondas"),
   	("parrilla"),
   	("sin cocina");

UPDATE coccion
SET nombre = "batido"
WHERE id = 5;

DELETE FROM coccion
WHERE id = 6;
<<<<<<< HEAD

//sf
//ingredientes
INSERT INTO ingredientes (tipo_de_ingredientes)
 VALUES  ('Verduras'),
                 ( 'Carnes'),
                 ( 'Lácteos');


SELECT * FROM ingredientes;


UPDATE ingredientes
SET tipo_de_ingredientes = 'Frutas'
WHERE ID = 1;


DELETE FROM ingredientes
WHERE ID = 2;
//sf
//medidas
INSERT INTO medidas (recetas) 
VALUES ('Receta 1'); 

INSERT INTO medidas (recetas) 
VALUES ('Receta 2'); 

INSERT INTO medidas (recetas) 
VALUES ( 'Receta 3');


SELECT * FROM medidas;


UPDATE medidas SET recetas = 'Receta Actualizada' WHERE id = 1;

DELETE FROM medidas WHERE id = 2;
//
=======
>>>>>>> 47f91ba62ff0bb6a7681acf6347918f073f36161
>>>>>>> c6deac25d17fd2962adaea4dc39022b00357fab6
>>>>>>> b5a77dab93a7c4b9f7495e7dd33e53a047a2883b
>>>>>>> e619c37bdf74630427c7df9025049295fa68edc2
