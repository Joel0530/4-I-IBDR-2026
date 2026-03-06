/* 
Implementacion de una base de datos en un sistema de informacion
2026/03/03 4-I
Sandoval Camacho Joel Alejandro
FIXXED-Library (Identificación de errores)
*/
CREATE TABLE BOOKS (
	ID INT 	NOT NULL,
	name VARCHAR(50) NOT NULL ,
	price INT NOT NULL ,
	category_id INT DEFAULT  NULL ,
	author_id INT NOT NULL,
PRIMARY KEY (ID));

CREATE TABLE CATEGORIES (
ID INT NOT NULL, 
NAME VARCHAR(50) NOT NULL,
PRIMARY KEY (ID));

CREATE TABLE AUTHORS (
ID INT NOT NULL  ,
NAME VARCHAR(50) NOT NULL ,
PRIMARY KEY (ID));

SELECT * FROM BOOKS inner JOIN CATEGORIES ON BOOKS.name  = CATEGORIES.NAME

SELECT * FROM BOOKS left OUTER JOIN CATEGORIES ON BOOKS.name = CATEGORIES.NAME WHERE CATEGORIES.NAME

SELECT * FROM BOOKS right OUTER JOIN CATEGORIES ON BOOKS.name = CATEGORIES.NAME WHERE BOOKS.name 

SELECT * FROM BOOKS left OUTER JOIN CATEGORIES ON BOOKS.name = CATEGORIES.NAME WHERE CATEGORIES.NAME 
UNION ALL
SELECT * FROM BOOKS right OUTER JOIN CATEGORIES ON BOOKS.name = CATEGORIES.NAME WHERE BOOKS.name 

SELECT * FROM BOOKS right JOIN CATEGORIES ON BOOKS.name = CATEGORIES.NAME WHERE CATEGORIES.NAME IS NULL

SELECT * FROM BOOKS left JOIN CATEGORIES ON BOOKS.name = CATEGORIES.NAME WHERE BOOKS.name  IS NULL

INSERT INTO CATEGORIES
VALUES
	(1, 'Cat-A'),
	(2, 'Cat-B'),
	(3, 'Cat-C'),
	(7, 'Cat-D'),
	(8, 'Cat-E'),
	(4, 'Cat-F'),
	(10, 'Cat-G'),
	(12, 'Cat-H'),
	(6, 'Cat-I');

INSERT INTO AUTHORS
VALUES
	(1, 'Author-A'),
	(2, 'Author-B'),
	(3, 'Author-C'),
	(10, 'Author-D'),
	(12, 'Author-E');

INSERT INTO BOOKS
VALUES
	(23,'Book-A', 100, 1, 2),
	(24,'Book-B', 200, 2, 10),
	(25,'Book-C', 150, 3, 12),
	(26,'Book-D', 100, 3, 10),
	(27,'Book-E', 200, 3, 12),
	(28,'Book-F', 150, 4, 10),
	(29,'Book-G', 100, 5, 3),
	(30,'Book-H', 200, 5, 1),
	(31,'Book-I', 150, 7, 3);
	
/** Encontrar los fallos en el script, hacer las correcciones, realizar las siguientes operaciones y guardar las consultas**/
/** --INNER JOIN
 --LEFT OUTER JOIN
 --RIGHT OUTER JOIN
 --JOIN NATURAL
 --LEFT EXCLUDING JOIN
 --LEFT EXCLUDING JOIN**