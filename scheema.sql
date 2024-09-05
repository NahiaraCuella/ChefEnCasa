CREATE Usuario {
   user VARCHAR(50),
   contrasenia VARCHAR(50),
   email VARCHAR(50),
   idioma VARCHAR(50),
   ID INT PRIMARY KEY AUTO_INCREMENT,
   id_pais INT FOREIGN KEY
}

CREATE Pais{
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50)
}

CREATE Recetas {
    cantidad_de_personas INT,
    paso_a_paso TEXT,
    tipo_de_dificultad CHAR(3),
    id_user INT FOREIGN KEY,
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_pais INT FOREIGN KEY,
    id_ingredientes INT FOREIGN KEY,
    id_cocciones INT FOREIGN KEY,
    id_momentoDia INT FOREIGN KEY,
    id_dietas INT FOREIGN KEY
}

CREATE TABLE Coccion{
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50),
}

CREATE Ingredientes {
   ID INT PRIMARY KEY AUTO_INCREMENT,
   tipo de ingrediente VARCHAR(50)
}

CREATE TABLE Medidas {
    id INT PRIMARY KEY,
    recetas VARCHAR(50),
    id_recetas INT FOREIGN KEY
}

CREATE rec_ing{
    id  INT PRIMARY KEY AUTO_INCREMENT,
    id_recetas INT FOREIGN KEY,
    id_ingredientes INT FOREIGN KEY
}

CREATE Dietas {
	nombre_de_recetas VARCHAR(50),
	id INT PRIMARY KEY AUTO_INCREMENT
}

CREATE momentos_dias {
    momentos_del_dias VARCHAR(50),
    id INT PRIMARY KEY AUTO_INCREMENT
}
