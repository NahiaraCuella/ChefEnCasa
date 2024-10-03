/* Modifique las columnas */
UPDATE momentos_dias
SET momentos_del_dias = "Desayuno"
WHERE id = 1;

UPDATE momentos_dias
SET momentos_del_dias = "Almuerzo"
WHERE id = 2;

UPDATE momentos_dias
SET momentos_del_dias = "Cena"
WHERE id = 3;

UPDATE momentos_dias
SET momentos_del_dias = "Postre"
WHERE id = 4;

UPDATE momentos_dias
SET momentos_del_dias = "Merienda"
WHERE id = 6;

/*Borre un registro*/
DELETE FROM momentos_dias
WHERE id = 5;

/*Inserte la columna eliminada */
INSERT INTO momentos_dias (id,momentos_del_dias, descripcion) 
VALUES ('5','Snacks', 'Comidas ligeras entre las comidas principales.');