create database academia;

use academia;

create table persona(
	dni varchar(9),
    nombre varchar(20) not null,
    telefono varchar(9),
    direccion varchar(100),
    primary key(dni)
);

create table alumno(
	dni varchar(9),
    edad int,
    primary key (dni),
    foreign key (dni) references persona(dni)
    on delete cascade on update cascade
);

create table desempleado(
	dni varchar(9),
    tiempo_desempleado int, -- meses
    primary key (dni),
    foreign key (dni) references alumno(dni)
    on delete cascade on update cascade
);

create table trabajador(
	dni varchar(9),
    cif varchar(15) not null,
    direccion_empresa varchar(100),
    primary key (dni),
    foreign key (dni) references alumno(dni)
    on delete cascade on update cascade
);

create table profesor(
	dni varchar(9),
    apellidos varchar(30) not null,
    primary key (dni),
    foreign key (dni) references persona(dni)
    on delete cascade on update cascade
);

create table curso(
	codigo int auto_increment,
    programa varchar(1000),
    horas int not null,
    titulo varchar(30) not null,
    profesor varchar(9) not null,
    primary key (codigo),
    foreign key (profesor) references profesor(dni)
    on delete no action on update cascade
);

create table alumno_curso(
	dni_alumno varchar(9),
    codigo_curso int,
    fecha_inicio date,
    fecha_fin date,
    nota double,
    primary key (dni_alumno, codigo_curso, fecha_inicio, fecha_fin),
    foreign key (dni_alumno) references alumno(dni)
    on delete cascade on update cascade,
    foreign key (codigo_curso) references curso(codigo)
    on delete cascade on update cascade
);