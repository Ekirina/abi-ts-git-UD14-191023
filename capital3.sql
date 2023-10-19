CREATE database capital3;
USE capital3;

CREATE table comunidad_autonoma(
	nombre VARCHAR(20) NOT NULL,
    poblacion int NOT NULL,
    superficie double NOT NULL,
	primary key (nombre)
    );    
CREATE table provincia(
	codigo_postal int,
    nombre VARCHAR (20) NOT NULL,
    poblacion int NOT NULL,
    superficie double NOT NULL,
    nombre_comunidad VARCHAR (20),
    foreign key (nombre_comunidad) REFERENCES comunidad_autonoma (nombre)
	ON DELETE CASCADE ON UPDATE CASCADE,
    primary key (codigo_postal)
	);
CREATE table localidad(
    nombre VARCHAR(20),
    poblacion int NOT NULL,
    codigo_postal int NOT NULL,
    cod_provincia_capital int UNIQUE,
    nombre_comunidad VARCHAR (20) UNIQUE,
	primary key (nombre),
    foreign key (codigo_postal) REFERENCES provincia(codigo_postal)
    ON DELETE CASCADE ON UPDATE CASCADE,
    foreign key (cod_provincia_capital) REFERENCES provincia (codigo_postal)
    ON DELETE CASCADE ON UPDATE CASCADE,
    foreign key (nombre_comunidad) REFERENCES comunidad_autonoma (nombre)
	ON DELETE CASCADE ON UPDATE CASCADE
    );

