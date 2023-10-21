drop database if exists ej14;
create database ej14;
use ej14;

create table Usuario(
id int auto_increment primary key,
foto varchar(500),
nombre varchar(40),
apellidos varchar(80),
contrasenia varchar(200),
correo varchar(80),
direccion varchar(80),
is_celebrity boolean
);

create table Grupo(
id int auto_increment primary key,
nombre varchar(80),
num_contactos int,
id_usuario int,
foreign key (id_usuario) references Usuario(id)
on delete cascade on update cascade
);

create table Comentario(
id int auto_increment primary key,
texto text,
image varchar(200),
privacidad enum('publico', 'privado'),
id_usuario int,
foreign key (id_usuario) references Usuario(id)
on delete cascade on update cascade
);

create table Telefono(
telefono varchar(9) primary key,
id_usuario int,
foreign key (id_usuario) references Usuario(id)
);

create table Grupo_Usuario(
id_grupo int,
id_usuario int,
primary key (id_grupo, id_usuario),
foreign key (id_grupo) references Grupo(id)
on delete cascade on update cascade,
foreign key (id_usuario) references Usuario(id)
on delete cascade on update cascade
);

create table usuario_bloqueado(
id_usuario int,
id_usuario_bloqueado int,
primary key (id_usuario, id_usuario_bloqueado),
foreign key (id_usuario) references Usuario(id)
on delete cascade on update cascade,
foreign key (id_usuario_bloqueado) references Usuario(id)
on delete cascade on update cascade
);

create table usuario_contacto(
id_usuario int,
id_usuario_contacto int,
comentario varchar(255),
primary key (id_usuario, id_usuario_contacto),
foreign key (id_usuario) references Usuario(id)
on delete cascade on update cascade,
foreign key (id_usuario_contacto) references Usuario(id)
on delete cascade on update cascade
);