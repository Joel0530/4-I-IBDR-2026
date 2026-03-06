/* 
Implementacion de una base de datos en un sistema de informacion
2026/03/04 4-I
Sanoval Camacho Joel Alejandr
Practices.sql
*/

CREATE TABLE departamentos (
  id int NOT NULL,
  name varchar(25) NOT NULL,
  location date NOT NULL,
  PRIMARY KEY (id, name));
-- Crear una tabla llamaba "empleados" con las columnas  id, nombre, edad, and salario.
  CREATE TABLE empleados(
  id int NOT NULL,
  nombre varchar(50) NOT NULL,
  edad int NOT NULL,
  salario float NOT NULL,
  PRIMARY KEY (id,nombre)
);
-- Insertar 5 registros en la tabla "emplados".
INSERT INTO empleados  (id, nombre, edad,salario)
VALUES
	(40,'Carlos Gallardo Ledesma',22 ,5000.34),
	(41,'Job Esau Torres Jimenez', 24,8800.82),
	(42,'Alan Dwii Angeles Hernandez',21,4600.56),
	(43,'Rodrigo Hernandez Hernandez',24,3800.47),
	(44,'Juan Antonio Ortega Sandoval',36,7900.89),
	(45,'Luis Fernando Gonzalez Gonzalez',23,7600.45 ),
	(46,'Brisa Esmeralda Castellanos Hernandez',22,6097.23 ),
	(47,'Aries Miguel Angel Riebelling Macias',24,5947.09 ),
	(47,'Fernanda Lizeth Gonzalez Hernandez',20,4848.54);

-- Agregar una nueva columna "departamento" a la tabla "empleados".
ALTER TABLE empleados ADD COLUMN departamento varchar(50) NOT NULL;
-- Cambiar el tipo de dato de la columna "salario" a Integer.
ALTER TABLE empleados MODIFY COLUMN salario int NOT NULL;
-- Eliminar la columna "departamento de la tabla "empleados".
ALTER TABLE empleados DROP COLUMN departamento;
-- Eliminar la tabla "departamentos" permanentemente.
DROP TABLE departamentos ;
-- Eliminar todos los registros de la tabla "empleados" pero mantener la tabla.
TRUNCATE TABLE empleados ;
-- Renombrar la tabla "empleados" a "staff".
RENAME TABLE empleados to staff;
-- Definir 0 como valor predeterminado en la comlumna "salario".
ALTER TABLE empleados ALTER COLUMN salario  SET default(0);
-- Crear un nuevo esquema llamado "rh_db".
CREATE SCHEMA "rh_db";
-- Mover la tabla "empleados" al esquema "rh_db".
RENAME TABLE empleados to rh_db.empleados;