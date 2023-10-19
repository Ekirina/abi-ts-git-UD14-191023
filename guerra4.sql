CREATE database guerra4;
USE guerra4;
CREATE table guerra(
	nombre VARCHAR(20),
    anyo_inicio int NOT NULL,
    anyo_final int NOT NULL,
    primary key (nombre)
);
CREATE table bando(
	nombre VARCHAR(20),
    isGanador boolean,
    primary key (nombre)
);
CREATE table guerra_bando(
	nombre_bando VARCHAR(20),
    nombre_guerra VARCHAR(20),
    foreign key (nombre_bando) REFERENCES bando (nombre)
    ON DELETE CASCADE ON UPDATE CASCADE,
    foreign key (nombre_guerra) REFERENCES guerra (nombre)
	ON DELETE CASCADE ON UPDATE CASCADE,
    primary key (nombre_bando, nombre_guerra)
    );
CREATE table pais(
	nombre VARCHAR(20),
    anyos_independiente int NOT NULL,
    primary key (nombre)
);
CREATE table pais_bando(
	nombre_bando VARCHAR(20),
    nombre_pais VARCHAR(20),
    fecha_inicio date,
    fecha_final date,
    foreign key (nombre_bando) REFERENCES bando (nombre)
    ON DELETE CASCADE ON UPDATE CASCADE,
	foreign key (nombre_pais) REFERENCES pais (nombre)
    ON DELETE CASCADE ON UPDATE CASCADE,
    primary key (nombre_bando, nombre_pais)
);    
CREATE table independencia(
	fecha_inicio date,
    fecha_final date,
    primary key (fecha_inicio, fecha_final)
);
CREATE table pais_independencia(
	nombre VARCHAR(20),
    fecha_inicio date,
    fecha_final date,
	foreign key (nombre) REFERENCES pais (nombre)
    ON DELETE CASCADE ON UPDATE CASCADE,
	foreign key (fecha_inicio, fecha_final) REFERENCES independencia (fecha_inicio, fecha_final)
    ON DELETE CASCADE ON UPDATE CASCADE,
    primary key (nombre, fecha_inicio, fecha_final)
);
    
    
    