CREATE TABLE A (
  id int NOT NULL,
  pilotos varchar(25) NOT NULL,
  PRIMARY KEY (id, pilotos)
);
 
SELECT * from A inner join B on A.pilotos  =
B.pilotos ;

SELECT * from A left outer join B on
A.pilotos  = B.pilotos  where B.pilotos  is Null
UNION ALL 
SELECT * from A right outer join B on
A.pilotos  = B.pilotos  where A.pilotos  is Null

SELECT id, pilotos
FROM defaultdb. A ;
}
INSERT INTO defaultdb.A
(id, pilotos)
VALUES
(1, 'S. Perez'),
(2, 'M. Botas'),
(3, 'M. Verstappen'),
(4, 'I. Hadjar'),
(5, ' C. Leclerk'),
(6, 'L. Hamilton'),
(7, ' L.Norris');