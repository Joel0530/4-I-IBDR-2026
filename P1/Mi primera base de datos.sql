DESC detalle_horarios;
DESC horarios;
DESC plantilla_detalle_horarios;

SELECT horario_id, hora_salida, hora_entrada, codigo_incapacidad
FROM defaultdb.detalle_horarios;

SELECT horario_id, plantilla_id
FROM defaultdb.horarios;

SELECT plantilla_id, dia, codigo_incapacidad, turno
FROM defaultdb.plantilla_detalle_horarios;

INSERT INTO defaultdb.detalle_horarios
(horario_id, hora_salida, hora_entrada, codigo_incapacidad)
VALUES(0, '2026-02-18 09:00:00', '2026-02-18 17:00:00', '0');

CREATE TABLE usuarios (
  id int NOT NULL,
  nombres varchar(25) NOT NULL,
  apellidos varchar(25) DEFAULT NULL,
  departamento varchar(25) DEFAULT NULL,
  PRIMARY KEY (id, nombres)
);
 

SELECT id, nombres, apellidos, departamento
FROM defaultdb.usuarios;

INSERT INTO defaultdb.usuarios
(id, nombres, apellidos, departamento)
VALUES
(0, 'Carlos', 'Gallardo Ledesma', 'Mantenimiento'),
(1, 'Job Esau', 'Torres Jimenez', 'Informatica'),
(2, 'Alan Dwii', 'Angeles Hernandez', 'Limpieza'),
(3, 'Rodrigo', 'Hernandez Hernandez', 'Mantenimiento'),
(4, 'Juan Antonio', 'Ortega Sandoval', 'Infromatica'),
(5, 'Luis Fernando', 'Gonzalez Gonzalez', 'Secretaria'),
(6, 'Brisa Esmeralda', 'Castellanos Hernandez', 'Diseño'),
(7, 'Aries Miguel Angel', 'Riebelling Macias', 'Mantenimiento'),
(8, 'Fernanda Lizeth', 'Gonzalez Hernandez', 'Secretaria'),
(9, 'Joel Alejandro', 'Sandoval Camacho', 'Informatica');
