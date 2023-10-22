drop database if exists aeropuerto;
create database aeropuerto;

use aeropuerto;

create table cliente(
	dni varchar(9),
    nombre varchar(25) not null,
    apellidos varchar(40),
    direccion varchar(100),
    telefono varchar(10),
    tarjeta_credito varchar(10),
    primary key (dni)
);

create table tarjeta_embarque(
	id int auto_increment,
    num_asiento varchar(2),
    dni_cliente varchar(9),
	primary key (id),
    foreign key (dni_cliente) references cliente(dni)
    on delete cascade on update cascade
);

create table asiento(
	fila int,
    columna int,
    planta int,
    numero int,
    primary key (fila, columna, planta)
);

create table tarjeta_embarque_asiento(
	id_tarjeta int,
    fila int,
    columna int,
    planta int,
    fecha date,
    primary key (id_tarjeta, fila, columna, planta, fecha),
    foreign key (id_tarjeta) references tarjeta_embarque(id)
    on delete cascade on update cascade,
    foreign key (fila, columna, planta) references asiento(fila, columna, planta)
    on delete cascade on update cascade
);

create table aeropuerto(
	codigo int auto_increment,
    nombre varchar(50),
    pais varchar(20),
    localidad varchar(30),
    primary key (codigo)
);

create table avion(
	codigo int auto_increment,
    num_plazas int not null,
    primary key(codigo)
);

create table vuelo(
	codigo int auto_increment,
    fecha_salida date,
    fecha_llegada date,
    hora_salida varchar(7),
    hora_llegada varchar(7),
    codigo_avion int,
    primary key(codigo),
    foreign key(codigo_avion) references avion(codigo)
    on delete no action on update cascade
);

create table vuelo_aeropuerto(
	codigo_vuelo int,
    codigo_aeropuerto_salida int,
    codigo_aeropuerto_llegada int,
    primary key (codigo_vuelo, codigo_aeropuerto_salida, codigo_aeropuerto_llegada),
    foreign key (codigo_vuelo) references vuelo(codigo)
    on delete cascade on update cascade,
    foreign key (codigo_aeropuerto_salida) references aeropuerto(codigo)
    on delete cascade on update cascade,
    foreign key (codigo_aeropuerto_llegada) references aeropuerto(codigo)
    on delete cascade on update cascade
);

create table cliente_vuelo(
	dni_cliente varchar(9),
    codigo_vuelo int,
    primary key (dni_cliente, codigo_vuelo),
    foreign key (dni_cliente) references cliente(dni)
    on delete cascade on update cascade,
    foreign key (codigo_vuelo) references vuelo(codigo)
    on delete cascade on update cascade
);