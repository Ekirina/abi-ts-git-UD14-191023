CREATE database restaurante13;
USE restaurante13;
CREATE table empleado(
	dni VARCHAR(9),
    nombre VARCHAR(10),
    apellido VARCHAR(20),
    num_ss VARCHAR(20),
    tel_fijo VARCHAR(10),
    tel_movil VARCHAR(10),
    primary key (dni)
);
CREATE table cocinero(
	dni VARCHAR(9),
    anyos_servicio int,
    foreign key (dni) REFERENCES empleado (dni)
	ON DELETE CASCADE ON UPDATE CASCADE,
    primary key (dni)
);	
CREATE table pinche(
	dni VARCHAR(9),
    fecha_nacimiento date,
    dni_cocinero VARCHAR(9),
    foreign key (dni) REFERENCES empleado (dni)
	ON DELETE CASCADE ON UPDATE CASCADE,
	foreign key (dni_cocinero) REFERENCES cocinero (dni),
    primary key (dni)
 );   
CREATE table ingrediente(
	nombre VARCHAR(20),
    primary key (nombre)
);
CREATE table almacen(
	nombre VARCHAR(20),
    numero int,
    descripcion VARCHAR(300),
    primary key (nombre, numero)
);
CREATE table estanteria(
	letra VARCHAR(3),
    tamanyo int,
    nombre VARCHAR(20),
    numero int,
    foreign key (nombre, numero) REFERENCES almacen (nombre, numero)
	ON DELETE CASCADE ON UPDATE CASCADE,
    primary key (letra, tamanyo)
);
CREATE table plato(
	nombre VARCHAR(20),
    precio double,
    tipo VARCHAR(20),
    primary key (nombre)
);
CREATE table ingrediente_plato(
	nombre_ingrediente VARCHAR(20),
    nombre_plato VARCHAR(20),
    foreign key (nombre_ingrediente) REFERENCES ingrediente (nombre)
	ON DELETE CASCADE ON UPDATE CASCADE,
	foreign key (nombre_plato) REFERENCES plato (nombre)
	ON DELETE CASCADE ON UPDATE CASCADE,
	primary key (nombre_ingrediente, nombre_plato)
);
CREATE table ingrediente_estanteria(
	nombre_ingrediente VARCHAR(20),
    letra VARCHAR(3),
    tamanyo int,
    foreign key (nombre_ingrediente) REFERENCES ingrediente (nombre)
	ON DELETE CASCADE ON UPDATE CASCADE,
    foreign key (letra) REFERENCES estanteria (letra)
	ON DELETE CASCADE ON UPDATE CASCADE,
	primary key (nombre_ingrediente, letra, tamanyo)
);
CREATE table plato_cocinero(
	nombre_plato VARCHAR(20),
    dni VARCHAR(9),
    foreign key (dni) REFERENCES cocinero (dni)
	ON DELETE CASCADE ON UPDATE CASCADE,
    foreign key (nombre_plato) REFERENCES plato (nombre)
	ON DELETE CASCADE ON UPDATE CASCADE,
	primary key (nombre_plato, dni)
);
DROP table plato_cocinero;