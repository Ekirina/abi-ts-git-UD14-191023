CREATE database pieza5;
USE pieza5;
CREATE table tipo(
	siglas VARCHAR(5),
    descripcion VARCHAR (300),
    primary key (siglas)
);
CREATE table almacen(
	numero VARCHAR(10),
    descripcion VARCHAR(300),
    direccion VARCHAR(20),
    primary key (numero)
);
CREATE table pieza(
	siglas_tipo VARCHAR(20),
    numero VARCHAR(5),
    precio double,
    foreign key (siglas_tipo) REFERENCES tipo (siglas)
	ON DELETE CASCADE ON UPDATE CASCADE,
    primary key (numero, siglas_tipo)
);
CREATE table pieza_pieza(
	siglas_tipo VARCHAR(20),
    numero VARCHAR(5),
    siglas_tipo2 VARCHAR(20),
    numero2 VARCHAR(5),
	foreign key (siglas_tipo) REFERENCES pieza (siglas_tipo)
	ON DELETE CASCADE ON UPDATE CASCADE,
    foreign key (siglas_tipo2) REFERENCES pieza (siglas_tipo)
	ON DELETE CASCADE ON UPDATE CASCADE,
	primary key (siglas_tipo, numero, siglas_tipo2, numero2)
);
CREATE table estanteria(
	id3 VARCHAR (5),
    nombre VARCHAR (20),
    numero_almacen VARCHAR(10),
    foreign key (numero_almacen) REFERENCES almacen (numero)
	ON DELETE CASCADE ON UPDATE CASCADE,
	primary key (id3)
);
CREATE table pieza_estanteria(
	siglas_tipo_pieza VARCHAR(20),
    numero_pieza VARCHAR(5),
    id3 VARCHAR(5),
    cantidad int,
    foreign key (siglas_tipo_pieza, numero_pieza) REFERENCES pieza (siglas_tipo, numero)
	ON DELETE CASCADE ON UPDATE CASCADE,
    foreign key (id3) REFERENCES estanteria (id3)
	ON DELETE CASCADE ON UPDATE CASCADE,
    primary key (siglas_tipo_pieza, numero_pieza, id3)
);
drop table pieza_estanteria;