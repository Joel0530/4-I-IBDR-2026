CREATE TABLE Proceso(
 flujo varchar(25) NOT NULL,
 paso int NOT NULL,
 estado varchar(25) NOT NULL ,
  PRIMARY KEY (flujo,paso,estado)
);

INSERT INTO Proceso
VALUES
	('Alpha',1 ,'Error'),
	('Alpha',2,'Finalizado'),
	('Alpha',3,'Corriendo'),
	('Bravo',1,'Finalizado'),
	('Bravo',2,'Finalizado'),
	('Charlie',1,'Corriendo'),
	('Charlie',2,'Corriendo'),
	('Delta',1,'Error'),
	('Delta',2,'Error'),
	('Echo',1,'Corriendo'),
	('Echo',2,'Finalizado');

SELECT flujo,
	CASE 
		WHEN COUNT (DISTINCT estado) = 1
			THEN MAX (estado)
		WHEN SUM (estado = 'Error') > 0 AND (SUM(estado = 'Finalizado') > 0 OR SUM (estado = 'Corriendo') > 0)
			THEN 'Indeterminado'
		WHEN SUM (estado = 'Finalizado' ) > 0 AND SUM(estado = 'Corriendo') > 0
			THEN 'Corriendo'
		ELSE 'Indeterminado'
			END AS estado
FROM Proceso
GROUP BY flujo;
	