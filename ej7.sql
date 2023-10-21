CREATE DATABASE if not exists Ej7;
USE Ej7;

CREATE TABLE Departamento(
codigo_departamento INT AUTO_INCREMENT PRIMARY KEY,
nombre varchar(20),
coordinador varchar(20)
);

CREATE TABLE Empleado(
num_trabajador int auto_increment  primary key,
nombre varchar(20),
apellidos varchar(40),
dni varchar(9) unique,
num_seguridad_social varchar(11),
direccion varchar(40),
telefono varchar(9),
codigo_dep int,
responsable int,
foreign key (responsable) references Empleado (num_trabajador)
on delete no action on update cascade,
foreign key (codigo_dep) references Departamento (codigo_departamento)
);
create table Contrato(
id int auto_increment primary key,
categoria varchar(40),
fecha_inicio date,
fecha_final date,
num_trabajador int,
foreign key (num_trabajador) references Empleado(num_trabajador)

);

create table Nomina(
id int auto_increment primary key,
fecha date,
salario double,
id_contrato int,
foreign key (id_contrato) references Contrato(id)
);

show tables;