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

ALTER TABLE momentos_dias
ADD COLUMN descripcion VARCHAR(100);

CREATE TABLE ingredientes (
   ID INT PRIMARY KEY AUTO_INCREMENT,
   tipo_de_ingrediente VARCHAR(50)
)

CREATE TABLE recetas(
    cantidad_de_personas INT,
    paso_a_paso TEXT,
    tipo_de_dificultad INT,
    id INT PRIMARY KEY AUTO_INCREMENT,
    pais_id INT,
    user_id INT,
    
    FOREIGN KEY (pais_id) REFERENCES pais(id),
    FOREIGN KEY (user_id) REFERENCES usuario(id),
)
    

CREATE TABLE recetas_por_dieta(
    receta_id INT,
    dieta_id INT,
    PRIMARY KEY (receta_id,dieta_id),
    FOREIGN KEY (dieta_id) REFERENCES dietas(id),
    FOREIGN KEY (receta_id) REFERENCES recetas(id)
)

CREATE TABLE recetas_por_momento_de_dia(
    receta_id INT,
    momentoDia_id INT,
    PRIMARY KEY (receta_id,momentoDia_id),
    FOREIGN KEY (momentoDia_id) REFERENCES momentos_dias(id),
    FOREIGN KEY (receta_id) REFERENCES recetas(id)
);

CREATE TABLE recetas_ingredientes(
    receta_id INT,
    ingredientes_id INT,
    PRIMARY KEY (receta_id,ingredientes_id),
    FOREIGN KEY (ingredientes_id) REFERENCES ingredientes(id),
    FOREIGN KEY (receta_id) REFERENCES recetas(id)

)

CREATE TABLE recetas_cocciones (
    receta_id INT,
    cocciones_id INT,
    PRIMARY KEY (receta_id,cocciones_id),
    FOREIGN KEY (cocciones_id) REFERENCES coccion(id),
    FOREIGN KEY (receta_id) REFERENCES recetas(id), 
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

/* inserte los datos en la tabla de momentos del dia*/
INSERT INTO momentos_dias (momentos_del_dias, descripcion) VALUES
('desayuno', 'Primera comida del día, generalmente por la mañana.'),
('almuerzo', 'Comida principal del día, normalmente al mediodía.'),
('cena', 'Comida que se toma por la noche.'),
('postre', 'Plato dulce que se sirve después de la comida.'),
('snacks', 'Comidas ligeras entre las comidas principales.'),
('merienda', 'Comida ligera que se toma entre la tarde y la cena.');

INSERT INTO usuario (user,email, contrasenia, idioma)
VALUES ('adhara','adhara@gmail.com','111','Español'),
       ('jorge','jorge@gmail.com','777','Ingles'),
       ('rosa','rosa@gmail.com','222','Español');




INSERT INTO rec_ing (recetas_id, ingredientes_id, medidas_id) 
VALUES (6, 9, 3), (7, 2, 2), (8, 3, 1);

UPDATE usuario
SET contrasenia = '123'
WHERE id = '4';

DELETE FROM usuario
WHERE id = '5';

INSERT INTO dietas (nombre_de_recetas)
VALUES ('Vegana'),
       ('Fitness'),
       ('Sin T.A.C.C');


UPDATE dietas
SET nombre_de_recetas = 'Vegetariana'
WHERE id = '1';

DELETE FROM dietas
WHERE id = '2';

DELETE FROM dietas
WHERE id = '3';

DELETE FROM dietas
WHERE id = '4';


INSERT INTO pais (nombre) VALUES ("Argentina"),("Brasil"),("Colombia");


UPDATE pais SET nombre = "brasil " WHERE nombre = "Brasil";

DELETE FROM pais WHERE nombre = "Colombia";

SELECT DISTINCT nombre from pais;
DELETE FROM pais WHERE nombre = "brasil";
DELETE FROM pais WHERE id = 10;

ALTER TABLE pais ADD CONSTRAINT unique_nombre UNIQUE (nombre);

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

ALTER TABLE medidas DROP FOREIGN KEY medidas_ibfk_1; 

ALTER TABLE nombre_tabla
DROP COLUMN columna;
--elimine foreing key
ALTER TABLE rec_ing
DROP FOREIGN KEY fk_medidas_id;
--referencie la foreing key nuevamente
ALTER TABLE rec_ing
ADD CONSTRAINT medidas_id
FOREIGN KEY (medidas_id) REFERENCES medidas(id);

ALTER TABLE recetas
CHANGE COLUMN cantidad_de_personas porciones int;

ALTER TABLE medidas
CHANGE COLUMN recetas medidas VARCHAR(50) ;

INSERT INTO dificultades (tipo_de_dificultad)
VALUES ('Facil'),
       ('Medio'),
       ('Dificl');

//



UPDATE usuario
SET pais_id = 1
WHERE id = 1;

UPDATE usuario
SET pais_id = 13
WHERE id = 3;

UPDATE usuario
SET pais_id = 2
WHERE id = 4;

UPDATE usuario
SET pais_id = 1
WHERE id = 6;


UPDATE usuario
SET pais_id = 14
WHERE id = 2;

INSERT INTO pais (nombre) 
VALUES ("Inglaterra")

INSERT INTO medidas(medidas)
VALUES("kilogramos"),
	   ("gramos"), 
       ("litros"),
       ("mililitros"),
       ("miligramos");

DELETE FROM ingredientes WHERE tipo_de_ingrediente = 'Carnes';

INSERT INTO ingredientes (tipo_de_ingrediente)
VALUES ('Fideo'),
    	('Pollo'),
    	('Tomate'),
    	('Cebolla');
       

INSERT INTO recetas_por_momento_de_dia (receta_id,momentoDia_id)
VALUES (8,1),
       (6,2),
       (7,3),
       (8,4),
       (8,5),
       (8,6);
       
INSERT INTO ingredientes (tipo_de_ingrediente)
VALUES  ('Azucar'),
        ('Aceite'),
         ('Leche'),
        ('Harina Leudante'),
        ('Esencia de Vainilla'),
        ('Pimienta'),
        ('Sal'),
        ('Manteca'),
        ('Carne'),
        ('Orégano'),
        ('Comino'),
        ('Queso Rallado'),
        ('Pimentón'),
        ('Salchicha'),
        ('Ajo'),
        ('Caldo de Verduras'),
        ('Fideos'),
        ('Albahaca')
        ;

/*modifique los datos de la tabla de recetas  */
UPDATE recetas
SET paso_a_paso = '1.	Preparar la mezcla: En una licuadora o procesador de alimentos, agrega la avena, la leche, los huevos, banana (si lo usas), el polvo de hornear, la canela, la esencia de vainilla y la sal. Licúa hasta obtener una mezcla suave y homogénea. Si está muy espesa, puedes añadir un poco más de leche para obtener la consistencia deseada.
	2.	Cocinar los hotcakes: Calienta una sartén antiadherente a fuego medio y añade un poco de aceite de coco o mantequilla. Vierte la mezcla en la sartén en pequeñas porciones (aproximadamente 2-3 cucharadas de mezcla por hotcake). Cocina durante 2-3 minutos, hasta que aparezcan burbujas en la superficie, luego voltea con cuidado y cocina durante otro minuto o hasta que estén dorados.
	3.	Servir: Sirve los hotcakes calientes, agregando las frutas frescas encima o dentro de la mezcla antes de cocinar, y si deseas, acompáñalos con miel, o yogur griego.'
WHERE id = 8;

UPDATE recetas
SET paso_a_paso = '.1.Cortamos el ajo y la cebolla lo más picadito que podamos. 
              2.Lo llevamos al fuego junto con un poquito de manteca. Algunos usan aceite para dorarlo, yo prefiero la manteca para darle un gusto diferente.
               También en el caso de tener, agregar la carne cortada en pedacitos pequeños que uno pueda masticar.
              Dejamos que se dore, mientras eso pasa y, si le pusieron manteca, por favor disfruten del aroma que sale de esa combinación, es lo mejor del mundo.
             Tenemos que llegar al punto de la foto adjuntada, bien caramelizada la cebolla. Si le pusieron carne, tomen una y abranla a la mitad para verificar que se haya cocinado.Agregamos el tomate y yo por mi parte la voy a juntar con un poco de la misma salsa que había previamente descongelado. La suya seguramente quedará mucho más roja que la mía, ya que no estaba congelada.Ahora vamos a condimentarla, le agregamos la sal, la pimienta, el comino (este con cuidado que es fuerte) el pimentón y el orégano a gusto. Yo hecho pisquitas y voy probando a que punto me gusta. La prefiero media picantona, así que hecho bastante pimienta. Ustedes como prefieran. No se olviden de mojar un pan en esta salsa mientras se hace, muy importante, a no olvidarse eh!Una vez hierva la dejamos en fuego súper bajo y tapada y nos vamos a hacer los fideos. Para los que no saben hacer pasta instantánea, pues es lo más fácil que hay. Ponemos agua en un recipiente. Agregamos sal, Y SOLO SAL. Por favor, NO PONER ACEITE AL AGUA. Un italiano llora cada vez que hacen eso. Una vez llega a hervir, o sea se presentan burbujitas. Metemos la pasta y la vamos aplastando con un tenedor.Dejamos que se cocine al rededor de 20 minutos hasta que quede como en la foto. Colamos los fideos y ahí, a gusto le agregamos manteca o aceite. Luego servimos con la salsa. Yo le tire un poco de perejil encima, y obviamente le ponemos queso rallado. ¡Que lo disfruten!'
WHERE id =7;

UPDATE recetas
SET paso_a_paso = '1.En una olla colocar abundante agua a hervir.
2.En una sartén dorar en 1 cucharada de aceite la salchicha parrillera, cortar en rodajas de medio centímetro y reservar.
3.En otra sartén saltearen en el resto del aceite caliente, los tomates cortados en cubos junto con el ajo picado, la sal y la pimienta, luego agregar Caldo de Verduras Maggi.
4.Una vez que el tomate se ablande y se forme una salsa, agregar las salchichas cortadas y cocinar de 5 a 10 minutos aproximadamente.
5.Cuando hierva el agua agregar la pasta y cocinar el tiempo que indique el envase.
6.Escurrir la pasta y servir con la salsa y la albahaca cortada en juliana, por arriba.
7.TIP: Una regla fácil de recordar: las porciones de los niños son 2/3 del de un adulto. Porque sus requerimientos nutricionales son menores, serviles porciones más pequeñas. Y acompañá las comidas con verduras frescas o cocidas, 
aportan nutrientes valiosos como vitaminas, minerales y fibra.'
WHERE id =6;



/*AGREGUE MAS INGREDIENTES*/
INSERT INTO ingredientes (ID,tipo_de_ingrediente)
VALUES ('25','Avena'),
       ('26','Banana'),
       ('27','Polvo de hornear'),
       ('28','Miel'),
       ('29','Yogur griego'),
       ('30','Limón'),
       ('31','Naranja'),
       ('32','Pan'),
       ('33','Canela');
=======

UPDATE recetas
SET rec_ing = 6
WHERE ingredientes_id = 9;

UPDATE recetas
SET rec_ing = 7
WHERE ingredientes_id = 2;

UPDATE recetas
SET rec_ing = 7
WHERE ingredientes_id = 3;


UPDATE ingredientes
SET id = 7
WHERE id = 14;

UPDATE ingredientes
SET id = 8
WHERE id = 15;

UPDATE ingredientes
SET id = 9
WHERE id = 16;

UPDATE ingredientes
SET id = 10
WHERE id = 17;

UPDATE ingredientes
SET id = 11
WHERE id = 18;

UPDATE ingredientes
SET id = 12
WHERE id = 19;

UPDATE ingredientes
SET id = 13
WHERE id = 20;

UPDATE ingredientes
SET id = 14
WHERE id = 21;

UPDATE ingredientes
SET id = 15
WHERE id = 22;

UPDATE ingredientes
SET id = 16
WHERE id = 23;

UPDATE ingredientes
SET id = 17
WHERE id = 24;

UPDATE ingredientes
SET id = 18
WHERE id = 25;

UPDATE ingredientes
SET id = 19
WHERE id = 26;

UPDATE ingredientes
SET id = 20
WHERE id = 27;

UPDATE ingredientes
SET id = 21
WHERE id = 28;

UPDATE ingredientes
SET id = 22
WHERE id = 29;

UPDATE ingredientes
SET id = 23
WHERE id = 30;

UPDATE ingredientes
SET id = 24
WHERE id = 31;

/*MODIFIQUE una receta de la tabla recetas*/
UPDATE recetas
SET paso_a_paso = '1. Preparación de ingredientes
Corta el ajo y la cebolla lo más finamente posible.
Si vas a usar carne, córtala en trozos pequeños para que sea fácil de masticar.
2. Sofreír la cebolla, ajo y carne (opcional)
Coloca un poco de manteca en una sartén (también puedes usar aceite, pero la manteca le da un sabor diferente).
Añade el ajo y la cebolla picados, y sofríelos a fuego medio.
Si tienes carne, agrégala a la sartén y dórala junto con la cebolla y el ajo.
Cocina hasta que la cebolla esté bien caramelizada y, si usaste carne, verifica que esté bien cocida abriendo un trozo a la mitad.
3. Incorporar el tomate y hacer la salsa
Agrega el tomate a la sartén. Si tienes salsa de tomate descongelada, también puedes agregar un poco para enriquecer la mezcla.
Condimenta a gusto con sal, pimienta, comino, pimentón y orégano.
Ajusta las especias probando poco a poco; si prefieres un toque picante, añade más pimienta.
Deja que hierva y, luego, reduce el fuego al mínimo, tapa la sartén y deja que la salsa se cocine a fuego lento.
4. Cocinar la pasta
Llena una olla con agua y añade sal (evita agregar aceite al agua).
Lleva el agua a ebullición y, cuando esté burbujeando, agrega la pasta.
Cocina la pasta alrededor de 20 minutos o hasta que esté al dente.
Escurre la pasta y, si deseas, mézclala con un poco de manteca o aceite.
5. Servir
Sirve los fideos en un plato y cúbrelos con la salsa.
Espolvorea con perejil fresco y queso rallado, si prefieres.
6. Disfrutar
¡Aprovecha y disfruta del sabor!'
WHERE id = 7;

/*agregue una receta nueva a la tabla recetas*/
INSERT INTO recetas (porciones, paso_a_paso, tipo_de_dificultad, id , pais_id, user_id, ingredientes _id, cocciones_id, dietas_id , nombre_receta, tiempo_coccion , rec_ing )
VALUES ('8','Preparación:
Preparar el caramelo: En una sartén a fuego medio, colocá el azúcar con unas gotas de agua. Cocina hasta que se disuelva y adquiera un color dorado. Viértelo inmediatamente en el molde donde harás el budín, cubriendo toda la base y las paredes. Deja que se enfríe.
Preparar el pan: Corta el pan en trozos pequeños y colócalo en un bol grande.
Remojar el pan: Calienta la leche y viértela sobre el pan troceado. Deja reposar unos minutos hasta que el pan esté bien empapado y blando.
Batir los ingredientes: Agrega el azúcar, los huevos, la esencia de vainilla y la ralladura de limón o naranja al bol con el pan y la leche. Con una batidora de mano, mezcla todo hasta obtener una mezcla homogénea. Si prefieres una textura más rústica, puedes dejar algunos trozos de pan sin triturar completamente.
Hornear: Vierte la mezcla en el molde caramelizado. Cocina en horno precalentado a 180°C (350°F) en baño María durante aproximadamente 1 hora, o hasta que al insertar un cuchillo en el centro, éste salga limpio.
Enfriar y desmoldar: Deja que el budín de pan se enfríe a temperatura ambiente y luego refrigéralo por al menos 2 horas. Para desmoldarlo, pasa un cuchillo por los bordes y da vuelta el molde sobre un plato.
Sugerencias:
Sirve el budín de pan frío o a temperatura ambiente, y acompáñalo con un poco de crema batida o dulce de leche si quieres un toque extra de sabor.¡Disfrútalo!','fácil','9','1','4','32','3', '1', 'Budín de pan', '1 hora','4');

/*agregue ingrdientes*/
INSERT INTO ingredientes (tipo_de_ingrediente)
VALUES ('Papas'),
       ('Ají molido'),
       ('Morrón'),
       ('Carne picada'),
       ('Queso'),
       ('Nuez moscada');

