CREATE database futbol10;
USE futbol10;
CREATE table equipo(
	id_equipo int auto_increment,
    nombre varchar (20) NOT NULL,
    escudo varchar(200),
    primary key (id_equipo)
);
CREATE table persona(
	dni varchar(9),
    nombre varchar(20) NOT NULL,
    apellidos varchar(50) NOT NULL,
    primary key (dni)
);
CREATE table jugador(
	dni varchar(9),
    alineacion varchar(20) NOT NULL,
    numero int,
    id_equipo int,
    foreign key (dni) REFERENCES persona(dni)
	ON DELETE CASCADE ON UPDATE CASCADE,
    foreign key (id_equipo) REFERENCES equipo(id_equipo)
	ON DELETE SET NULL ON UPDATE CASCADE,
    primary key (dni)
);
CREATE table entrenador(
	dni VARCHAR(9),
    rango VARCHAR(20),
    isojeador boolean,
    id_equipo int UNIQUE,
    foreign key (id_equipo) REFERENCES equipo(id_equipo),
	primary key (dni),
    foreign key (dni) REFERENCES persona(dni)
    ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE table liga(
	id_liga int auto_increment,
    nombre VARCHAR(20) NOT NULL,
    temporada VARCHAR(9) NOT NULL,
    primary key (id_liga)
);
CREATE table partido(
	id_partido int auto_increment,
    fecha datetime NOT NULL,
    resultado VARCHAR (5),
    id_liga int,
    foreign key (id_liga) REFERENCES liga(id_liga),
    primary key(id_partido)
);
CREATE table equipo_partido(
	id_equipo int,
    id_partido int,
    is_visitante boolean,
    foreign key (id_equipo) REFERENCES equipo(id_equipo)
    ON DELETE CASCADE ON UPDATE CASCADE,
    foreign key (id_partido) REFERENCES partido(id_partido)
    ON DELETE CASCADE ON UPDATE CASCADE,
    primary key (id_equipo, id_partido)
);


