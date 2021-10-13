CREATE DATABASE notas_DB;
USE notas_DB;

CREATE TABLE estatus(
id_eliminable INT NOT NULL AUTO_INCREMENT,
descripcion VARCHAR(20) NOT NULL,
PRIMARY KEY (id_eliminable)
);
CREATE TABLE usuarios(
id_usuarios INT NOT NULL AUTO_INCREMENT,
email VARCHAR(100) NOT NULL UNIQUE,
nombre VARCHAR(100) NOT NULL,
PRIMARY KEY (id_usuarios)
);
CREATE TABLE categorias(
id_categoria INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR(100) NOT NULL,
PRIMARY KEY (id_categoria)
);
CREATE TABLE notas(
id_notas INT NOT NULL AUTO_INCREMENT,
titulo VARCHAR(100) NOT NULL,
fecha_creacion DATE NOT NULL,
ultima_modificacion DATE NOT NULL,
descripcion TEXT NOT NULL,
id_eliminable INT NOT NULL,
id_usuarios INT NOT NULL,
PRIMARY KEY (id_notas),
FOREIGN KEY (id_eliminable) REFERENCES estatus(id_eliminable),
FOREIGN KEY (id_usuarios) REFERENCES usuarios(id_usuarios)
);
CREATE TABLE notas_categorias(
id_notas INT NOT NULL,
id_categoria INT NOT NULL,
PRIMARY KEY (id_notas,id_categoria),
FOREIGN KEY (id_notas) REFERENCES notas(id_notas),
FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);

INSERT INTO estatus (descripcion) VALUES ('eliminable');
INSERT INTO estatus (descripcion) VALUES ('no eliminable');
SELECT * FROM estatus;

INSERT INTO usuarios (email,nombre) VALUES ('chris@hotmail.com','Christian Gomez');
INSERT INTO usuarios (email,nombre) VALUES ('ana@hotmail.com','Ana Hernandez');
INSERT INTO usuarios (email,nombre) VALUES ('axel@hotmail.com','Axel Juarez');
INSERT INTO usuarios (email,nombre) VALUES ('ale@hotmail.com','Alejandro Gonzalez');
INSERT INTO usuarios (email,nombre) VALUES ('itzel@hotmail.com','Itzel Gonzalez');
INSERT INTO usuarios (email,nombre) VALUES ('david@hotmail.com','David Montes de Oca');
INSERT INTO usuarios (email,nombre) VALUES ('diego@hotmail.com','Diego Avila');
INSERT INTO usuarios (email,nombre) VALUES ('karim@hotmail.com','Karim Angeles');
INSERT INTO usuarios (email,nombre) VALUES ('lupe@hotmail.com','Guadalupe Hernandez');
INSERT INTO usuarios (email,nombre) VALUES ('abby@hotmail.com','Abigail Gomez');
SELECT * FROM usuarios;

INSERT INTO categorias (nombre) VALUES ('Musica');
INSERT INTO categorias (nombre) VALUES ('Escuela');
INSERT INTO categorias (nombre) VALUES ('Trabajo');
INSERT INTO categorias (nombre) VALUES ('Tareas');
INSERT INTO categorias (nombre) VALUES ('Notas en General');
SELECT * FROM categorias;

INSERT INTO notas (titulo,fecha_creacion,ultima_modificacion,descripcion,id_eliminable,id_usuarios) 
VALUES ('Nota numero 1','2021-10-12','2021-10-12','Esta nota es la 1 en la lista', 1, 1);
INSERT INTO notas (titulo,fecha_creacion,ultima_modificacion,descripcion,id_eliminable,id_usuarios) 
VALUES ('Nota numero 2','2021-9-12','2021-9-12','Esta nota es la 2 en la lista', 1, 2);
INSERT INTO notas (titulo,fecha_creacion,ultima_modificacion,descripcion,id_eliminable,id_usuarios) 
VALUES ('Nota numero 3','2021-8-12','2021-8-12','Esta nota es la 3 en la lista', 1, 3);
INSERT INTO notas (titulo,fecha_creacion,ultima_modificacion,descripcion,id_eliminable,id_usuarios) 
VALUES ('Nota numero 4','2021-7-12','2021-7-12','Esta nota es la 4 en la lista', 1, 4);
INSERT INTO notas (titulo,fecha_creacion,ultima_modificacion,descripcion,id_eliminable,id_usuarios) 
VALUES ('Nota numero 5','2021-6-12','2021-6-12','Esta nota es la 5 en la lista', 1, 5);
INSERT INTO notas (titulo,fecha_creacion,ultima_modificacion,descripcion,id_eliminable,id_usuarios) 
VALUES ('Nota numero 6','2021-5-12','2021-5-12','Esta nota es la 6 en la lista', 2, 6);
INSERT INTO notas (titulo,fecha_creacion,ultima_modificacion,descripcion,id_eliminable,id_usuarios) 
VALUES ('Nota numero 7','2021-4-12','2021-4-12','Esta nota es la 7 en la lista', 2, 7);
INSERT INTO notas (titulo,fecha_creacion,ultima_modificacion,descripcion,id_eliminable,id_usuarios) 
VALUES ('Nota numero 8','2021-3-12','2021-3-12','Esta nota es la 8 en la lista', 2, 8);
INSERT INTO notas (titulo,fecha_creacion,ultima_modificacion,descripcion,id_eliminable,id_usuarios) 
VALUES ('Nota numero 9','2021-2-12','2021-2-12','Esta nota es la 9 en la lista', 2, 9);
INSERT INTO notas (titulo,fecha_creacion,ultima_modificacion,descripcion,id_eliminable,id_usuarios) 
VALUES ('Nota numero 10','2021-1-12','2021-1-12','Esta nota es la 10 en la lista', 2, 10);
SELECT * FROM notas;

INSERT INTO notas_categorias (id_notas,id_categoria) VALUES (1,1);
INSERT INTO notas_categorias (id_notas,id_categoria) VALUES (1,2);
INSERT INTO notas_categorias (id_notas,id_categoria) VALUES (2,3);
INSERT INTO notas_categorias (id_notas,id_categoria) VALUES (3,4);
INSERT INTO notas_categorias (id_notas,id_categoria) VALUES (3,5);
INSERT INTO notas_categorias (id_notas,id_categoria) VALUES (3,1);
INSERT INTO notas_categorias (id_notas,id_categoria) VALUES (4,2);
INSERT INTO notas_categorias (id_notas,id_categoria) VALUES (4,3);
INSERT INTO notas_categorias (id_notas,id_categoria) VALUES (4,4);
INSERT INTO notas_categorias (id_notas,id_categoria) VALUES (4,5);
INSERT INTO notas_categorias (id_notas,id_categoria) VALUES (5,4);
INSERT INTO notas_categorias (id_notas,id_categoria) VALUES (5,5);
INSERT INTO notas_categorias (id_notas,id_categoria) VALUES (6,1);
INSERT INTO notas_categorias (id_notas,id_categoria) VALUES (6,2);
INSERT INTO notas_categorias (id_notas,id_categoria) VALUES (7,3);
INSERT INTO notas_categorias (id_notas,id_categoria) VALUES (8,4);
INSERT INTO notas_categorias (id_notas,id_categoria) VALUES (8,5);
INSERT INTO notas_categorias (id_notas,id_categoria) VALUES (8,1);
INSERT INTO notas_categorias (id_notas,id_categoria) VALUES (9,2);
INSERT INTO notas_categorias (id_notas,id_categoria) VALUES (9,3);
INSERT INTO notas_categorias (id_notas,id_categoria) VALUES (9,4);
INSERT INTO notas_categorias (id_notas,id_categoria) VALUES (9,5);
INSERT INTO notas_categorias (id_notas,id_categoria) VALUES (10,4);
INSERT INTO notas_categorias (id_notas,id_categoria) VALUES (10,5);
SELECT * FROM notas_categorias;

SELECT notas.id_notas, notas.titulo, notas.descripcion, estatus.descripcion, usuarios.nombre, COUNT(notas_categorias.id_notas) AS categorias FROM notas
INNER JOIN estatus ON notas.id_eliminable = estatus.id_eliminable
INNER JOIN usuarios ON notas.id_usuarios = usuarios.id_usuarios
INNER JOIN notas_categorias ON notas.id_notas = notas_categorias.id_notas
GROUP BY notas_categorias.id_notas
HAVING COUNT(notas_categorias.id_notas) > 2
ORDER BY categorias;