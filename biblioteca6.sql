CREATE database biblioteca6;
USE biblioteca6;
CREATE table autor(
	id_autor int auto_increment,
    nombre VARCHAR(20),
    primary key (id_autor)
);
CREATE table articulo(
	id int auto_increment,
    nombre VARCHAR(50),
    resumen VARCHAR(300),
    anyo VARCHAR(4),
    pais VARCHAR(20),
    deteriorado boolean,
    comentario_deteriorado VARCHAR(300),
    primary key (id)
);
CREATE table socio(
	codigo int auto_increment,
    dni VARCHAR(9),
    nombre VARCHAR(10),
    apellidos VARCHAR(20),
    direccion VARCHAR(20),
    primary key (codigo)
);
CREATE table telefono(
	num_telefono VARCHAR(20),
    codigo_socio int,
    foreign key (codigo_socio) REFERENCES socio (codigo)
	ON DELETE CASCADE ON UPDATE CASCADE,
    primary key (num_telefono)
);
CREATE table libro(
	id int,
    num_pagina int,
    foreign key (id) REFERENCES articulo (id)
	ON DELETE CASCADE ON UPDATE CASCADE,
	primary key (id)    
);
CREATE table pelicula(
	id int,
    duracion int,
    foreign key (id) REFERENCES articulo (id)
	ON DELETE CASCADE ON UPDATE CASCADE,
	primary key (id)
);
CREATE table cd(
	id int,
    num_canciones int,
    foreign key (id) REFERENCES articulo (id)
	ON DELETE CASCADE ON UPDATE CASCADE,
	primary key (id)
);
CREATE table autor_articulo(
	id int,
    id_autor int,
    foreign key (id) REFERENCES articulo (id)
	ON DELETE CASCADE ON UPDATE CASCADE,
	foreign key (id_autor) REFERENCES autor (id_autor)
	ON DELETE CASCADE ON UPDATE CASCADE,
	primary key (id, id_autor)
);	
CREATE table articulo_socio(
	codigo int,
    id int,
    fecha_inicio date,
    fecha_limite date,
    fecha_entrega date,
    foreign key (codigo) REFERENCES socio (codigo)
	ON DELETE CASCADE ON UPDATE CASCADE,
	foreign key (id) REFERENCES articulo (id)
	ON DELETE CASCADE ON UPDATE CASCADE,
	primary key (codigo, id)
);