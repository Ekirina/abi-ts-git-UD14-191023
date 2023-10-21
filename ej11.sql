drop database if exists ej11;

create database ej11;
use ej11;

create table Pais(
nombre varchar(40) primary key,
extension double,
poblacion int
);

create table Localidad(
id int auto_increment primary key,
nombre varchar(40),
nombre_pais varchar(40),
foreign key (nombre_pais) references Pais(nombre)
on delete cascade on update cascade
);

create table Accidente_Geografico(
nombre varchar(40) primary key,
pos_horizontal double,
pos_vertical double
);

create table Pais_Accidente(
nombre_pais varchar(40),
nombre_accidente varchar(40),
primary key(nombre_pais, nombre_accidente),
foreign key(nombre_pais) references Pais(nombre)
on delete cascade on update cascade,
foreign key(nombre_accidente) references Accidente_Geografico(nombre)
on delete cascade on update cascade
);

create table Montaña(
nombre varchar(40) primary key,
altura double,
foreign key(nombre) references Accidente_Geografico(nombre)
on delete cascade on update cascade
);

create table Lago(
nombre varchar(40) primary key,
extension double,
foreign key(nombre) references Accidente_Geografico(nombre)
on delete cascade on update cascade
);

create table Rio(
nombre varchar(40) primary key,
longitud double,
foreign key(nombre) references Accidente_Geografico(nombre)
on delete cascade on update cascade

);

create table Localidad_rio(
id_localidad int,
nombre_rio varchar(40),
primary key (id_localidad, nombre_rio),
foreign key (id_localidad) references Localidad(id)
on delete cascade on update cascade,
foreign key (nombre_rio) references Rio(nombre)
on delete cascade on update cascade
);