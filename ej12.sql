drop database if exists ej12;
create database ej12;
use ej12;

create table Empresa(
cod_interno int auto_increment primary key,
CIF varchar(9),
nombre varchar(40),
direccion varchar(60),
telefono varchar(9)
);

create table Proyecto(
id int auto_increment primary key,
fecha_inicio date,
fecha_prevista date,
fecha_final date,
cod_empresa int,
foreign key (cod_empresa) references Empresa(cod_interno)
on delete cascade on update cascade

);

create table Trabajador(
cod_trabajador int auto_increment primary key,
nombre varchar(40),
apellido varchar(80),
dni varchar(9)
);

create table Profesion(
cod_profesion int auto_increment primary key,
nombre varchar(40)
);

create table proyecto_profesion_trabajo(
id_proyecto int,
cod_trabajador int,
cod_profesion int,
primary key (id_proyecto, cod_trabajador, cod_profesion),
foreign key (id_proyecto) references Proyecto(id)
on delete cascade on update cascade,
foreign key (cod_trabajador) references Trabajador(cod_trabajador)
on delete cascade on update cascade,
foreign key (cod_profesion) references Profesion(cod_profesion)
on delete cascade on update cascade

);