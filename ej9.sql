
drop database if exists Ej9;
CREATE DATABASE Ej9;
USE Ej9;

create table Etiqueta (nombre varchar(20) primary key);

create table Receta (
id int auto_increment primary key,
nombre_plato varchar(40),
dificultad varchar(12),
duracion_media varchar(10),
cantidad_personas int
);

create table Paso(
id int auto_increment primary key, 
num_paso int,
descripcion varchar(400),
id_receta int,
foreign key (id_receta) references Receta(id)
);

create table Ingrediente(
nombre varchar(20) primary key,
cantidad double,
unidad varchar(20)
);

create table Utensilio(
nombre varchar(20) primary key,
tipo varchar (20)
);

create table Etiqueta_Receta(
nombre_etiqueta varchar(20) not null,
id_receta int not null,
foreign key (nombre_etiqueta) references Etiqueta(nombre),
foreign key (id_receta) references Receta(id),
primary key (nombre_etiqueta, id_receta)
);

create table Ingrediente_Receta(
id_receta int not null,
nombre_ingrediente varchar(20) not null,
primary key(id_receta, nombre_ingrediente),
foreign key (id_receta) references Receta(id),
foreign key (nombre_ingrediente) references Ingrediente(nombre)
);

create table Receta_Utensilio(
id_receta int not null,
nombre_utensilio varchar(20) not null,
primary key (id_receta, nombre_utensilio),
foreign key (id_receta) references Receta(id),
foreign key (nombre_utensilio) references Utensilio(nombre)
);

