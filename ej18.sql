drop database if exists ej18;
create database ej18;
use ej18;

create table Inmueble(
id int auto_increment primary key,
superficie double,
descripcion tinytext,
direccion varchar(80)
);
create table Trabajador(
id int auto_increment primary key,
dni varchar(9) unique,
nombre varchar(40),
apellidos varchar(80),
movil varchar(9), 
telefono_fijo varchar(9)
);
create table Cliente(
id int auto_increment primary key,
dni varchar(9) unique,
nombre varchar(40),
apellidos varchar(80),
movil varchar(9), 
telefono_fijo varchar(9)
);
create table Compra(
id int auto_increment primary key,
fecha date,
valor double,
id_trabajador int,
id_inmueble int,
foreign key (id_trabajador) references Trabajador(id)
on delete cascade on update cascade,
foreign key (id_inmueble) references Inmueble(id)
on delete cascade on update cascade
);
create table Alquiler(
id int auto_increment primary key,
anio year,
mes enum('enero', 'febrero', 'marzo', 'abril', 'mayo', 'junio', 'julio', 'agosto', 'septiembre', 'octubre', 'noviembre', 'diciembre'),
valor double,
id_trabajador int,
id_inmueble int,
foreign key (id_trabajador) references Trabajador(id)
on delete cascade on update cascade,
foreign key (id_inmueble) references Inmueble(id)
on delete cascade on update cascade
);

create table Alquiler_cliente(
id_cliente int,
id_alquiler int,
primary key (id_cliente, id_alquiler),
foreign key (id_cliente) references Cliente(id)
on delete cascade on update cascade,
foreign key (id_alquiler) references Alquiler(id)
on delete cascade on update cascade
);

create table Cliente_Compra(
id_cliente int,
id_compra int,
primary key (id_cliente, id_compra),
foreign key (id_cliente) references Cliente(id)
on delete cascade on update cascade,
foreign key (id_compra) references Compra(id)
on delete cascade on update cascade
);

create table Piso(
id int auto_increment,
id_inmueble int,
primary key(id, id_inmueble),
foreign key (id_inmueble) references Inmueble(id)
on delete cascade on update cascade
);
create table Local(
id int primary key,
uso varchar(40),
servicio boolean,
foreign key (id) references Inmueble(id)
on delete cascade on update cascade
);
create table Garaje(
id int primary key,
numero int,
planta smallint,
foreign key (id) references Inmueble(id)
on delete cascade on update cascade
);

create table Piso_Garaje(
id_garaje int,
id_piso int,
primary key(id_garaje, id_piso),
foreign key (id_garaje) references Garaje(id)
on delete cascade on update cascade,
foreign key (id_piso) references Piso(id)
on delete cascade on update cascade
);


