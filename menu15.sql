CREATE database menu15;
USE menu15;
CREATE table menu(
	id int auto_increment,
    num_comensales int, 
    primary key (id)
);
CREATE table plato(
	nombre VARCHAR(20),
    descripcion VARCHAR (300),
    tipo VARCHAR(20),
    primary key (nombre)
);
CREATE table dia(
	fecha date,
    temperatura VARCHAR(20),
    primary key (fecha)
);
CREATE table menu_plato_dia(
	id_menu int,
    fecha date,
    nombre VARCHAR(20),
    cantidad int,
    exitoso VARCHAR(20),
    foreign key (id_menu) REFERENCES menu (id)
	ON DELETE CASCADE ON UPDATE CASCADE,
    foreign key (fecha) REFERENCES dia (fecha)
	ON DELETE CASCADE ON UPDATE CASCADE,
	foreign key (nombre) REFERENCES plato (nombre)
	ON DELETE CASCADE ON UPDATE CASCADE,
	primary key (id_menu, fecha, nombre)
);