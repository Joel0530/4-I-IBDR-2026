-- Ejercicio 1 - Desagrupación --

CREATE TABLE Productos (
  Producto VARCHAR(50) PRIMARY KEY,
  Cantidad INT 
);

INSERT INTO Productos (Producto,Cantidad)
VALUES
('Lapiz',3),
('Borrador',6),
('Cuaderno',3);


WITH Numeros AS (
  SELECT 1 AS Numero UNION ALL 
SELECT 2 UNION ALL
  SELECT 3 UNION ALL
SELECT 4 UNION ALL
  SELECT 5
)
SELECT Producto, 1 AS Cantidad
FROM Productos
JOIN Numeros ON Numero <= Cantidad;

TRUNCATE  Productos;

-- Ejercicios 2 - Tabla de Asientos --

CREATE TABLE asientos (
    num_asiento INT PRIMARY KEY
);


INSERT INTO asientos (num_asiento) VALUES
    (7), (13), (14), (15), (27), (28), (29), (30), 
    (31), (32), (33), (34), (35), (52), (53), (54);

WITH RECURSIVE numeros AS (
    SELECT 1 AS num
    UNION ALL
    SELECT num + 1
    FROM numeros
    WHERE num + 1 <= 54
),
disponibles AS (
    SELECT num
    FROM numeros
    WHERE num NOT IN (SELECT num_asiento FROM asientos)
),
agrupados AS (
    SELECT 
        num,
        num - ROW_NUMBER() OVER (ORDER BY num) AS grupo
    FROM disponibles
)
SELECT
    MIN(num) AS espacio_inicio,
    MAX(num) AS espacio_final
FROM agrupados
GROUP BY grupo;

SELECT 
    COUNT(*) AS disponibles
FROM (
    SELECT 1 + units.i + tens.i * 10 AS num
    FROM
        (SELECT 0 i UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
         UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) units,
        (SELECT 0 i UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4) tens
    WHERE 1 + units.i + tens.i * 10 <= 54
) AS numeros
WHERE num NOT IN (SELECT num_asiento FROM asientos);


SELECT 
    CASE WHEN num % 2 = 0 THEN 'pares' ELSE 'impares' END AS tipo,
    COUNT(*) AS total
FROM (
    SELECT 1 + units.i + tens.i * 10 AS num
    FROM
        (SELECT 0 i UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
         UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) units,
        (SELECT 0 i UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4) tens
    WHERE 1 + units.i + tens.i * 10 <= 54
) AS numeros
WHERE num NOT IN (SELECT num_asiento FROM asientos)
GROUP BY tipo;

# Volver al futuro
CREATE TABLE Fechas_futuras(
 inicio DATE NOT NULL ,
 final DATE NOT NULL ,
 id int NOT NULL,
  PRIMARY KEY (inicio,final,id)
);





INSERT INTO Fechas_futuras
VALUES
	('2025-01-01','2025-01-05',2),
	('2025-01-03','2025-01-09',3),
	('2025-01-10','2025-01-11',4),
	('2025-01-12','2025-01-16',5),
	('2025-01-15','2025-01-19',6);

SELECT DATE_FORMAT(inicio,'%Y-%m-%d') as inicio, DATE_FORMAT(final,'%Y-%m-%d') as final FROM Fechas_futuras WHERE '2025-01-01' <= final AND '2025-01-05' >= inicio ;

with CTE as (
SELECT inicio, final
FROM Fechas_futuras
UNION ALL
SELECT
	 LEAST(t1.inicio, t2.inicio) as inicio,
	 GREATEST(t1.final, t2.final) as final
FROM Fechas_futuras t1
JOIN Fechas_futuras t2 ON t1.final >= t2.inicio AND t1.inicio <= t2.final
)
SELECT MIN(inicio) as inicio, MAX(final) as final
FROM CTE
GROUP BY inicio
ORDER BY inicio;

SELECT inicio, final
	FROM Fechas_futuras
	UNION ALL
	SELECT
		LEAST(t1.inicio, t2.inicio) as inicio,
		GREATEST(t1.final, t2.final) as final
FROM Fechas_futuras t1
JOIN Fechas_futuras t2 ON t1.final >= t2.inicio AND t1.inicio <= t2.final
WHERE t1.id < t2.id