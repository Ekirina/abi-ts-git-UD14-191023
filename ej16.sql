drop database if exists ej16;
create database ej16;
use ej16;

create table Usuario(
id int auto_increment primary key,
email varchar(80),
descripcion tinytext,
telefono varchar(9),
imagen_perfil varchar(200)
);

create table Tweet(
id int auto_increment primary key,
texto varchar(280),
fecha date,
likes int,
retweets int,
multimedia varchar(200),
id_usuario int,
foreign key (id_usuario) references Usuario(id)
on delete cascade on update cascade
);

create table Usuario_Retweet(
id_usuario int,
id_tweet int,
primary key (id_usuario, id_tweet),
foreign key (id_usuario) references Usuario(id)
on delete cascade on update cascade,
foreign key (id_tweet) references Tweet(id)
on delete cascade on update cascade

);

create table Usuario_Like(
id_usuario int,
id_tweet int,
primary key (id_usuario, id_tweet),
foreign key (id_usuario) references Usuario(id)
on delete cascade on update cascade,
foreign key (id_tweet) references Tweet(id)
on delete cascade on update cascade
);