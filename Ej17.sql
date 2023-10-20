drop database if exists escuelaej17;
create database escuelaej17;

use escuelaej17;

create table aula(
	numero_aula int auto_increment,
    nombre varchar(30),
    superficie int,
    primary key (numero_aula)
);

create table asignatura(
	codigo_interno int auto_increment,
    codigo_europeo int unique not null,
    nombre varchar(40) not null,
    codigo_asignatura_requerida int,
    primary key (codigo_interno),
    foreign key (codigo_asignatura_requerida) references asignatura(codigo_interno) 
    on delete no action 
    on update cascade
);

create table horario(
	hora varchar(20),
    dia_mes_ano date,
    dia_semana varchar(15) not null,
    primary key (hora, dia_mes_ano)
);

create table ocupa(
	hora varchar(20),
    dia_mes_ano date,
    numero_aula int,
    codigo_interno int,
    primary key (hora, dia_mes_ano, numero_aula, codigo_interno),
    foreign key (hora, dia_mes_ano) references horario(hora, dia_mes_ano)
    on delete cascade on update cascade,
    foreign key (numero_aula) references aula(numero_aula)
    on delete cascade on update cascade,
    foreign key (codigo_interno) references asignatura(codigo_interno)
    on delete cascade on update cascade
);

create table profesor(
    codigo_interno int auto_increment,
	dni varchar(9) unique not null,
    nombre varchar(20) not null,
    direccion varchar(100),
    telefono varchar(9),
    correo varchar(50),
    numero_ss varchar(20),
    antiguedad_tutor int,
    primary key (codigo_interno)
);

create table profesor_asignatura(
	codigo_interno_profesor int,
    codigo_interno_asignatura int,
    antiguedad int,
    primary key (codigo_interno_profesor, codigo_interno_asignatura),
    foreign key (codigo_interno_profesor) references profesor(codigo_interno)
    on delete cascade on update cascade,
    foreign key (codigo_interno_asignatura) references asignatura(codigo_interno)
    on delete cascade on update cascade
);

create table ciclo(
	codigo_interno int auto_increment,
    nombre varchar(50) not null,
    tipo varchar(50) not null,
    codigo_interno_tutor int,
    primary key (codigo_interno),
    foreign key (codigo_interno_tutor) references profesor(codigo_interno)
    on delete no action on update cascade
);

create table ciclo_asignatura_profesor(
	codigo_interno_asignatura int,
    codigo_interno_ciclo int,
    codigo_interno_profesor int,
    fecha_inicio date not null,
    fecha_fin date not null,
    primary key (codigo_interno_asignatura, codigo_interno_ciclo, codigo_interno_profesor),
    foreign key (codigo_interno_asignatura) references asignatura(codigo_interno)
    on delete cascade on update cascade,
    foreign key (codigo_interno_ciclo) references ciclo(codigo_interno)
    on delete cascade on update cascade,
    foreign key (codigo_interno_profesor) references profesor(codigo_interno)
    on delete cascade on update cascade
);

insert into aula(nombre, superficie) values ("Aula Mates", 25),
											("Aula Quimica", 25),
                                            ("Aula Castellano", 20),
                                            ("Aula Catalan", 20),
                                            ("Aula Mates 2", 20),
                                            ("Aula Castellano 2", 20),
                                            ("Aula Catalan 2", 20),
                                            ("Aula Computación ", 20),
                                            ("Aula Programación", 20),
                                            ("Aula Programación 2", 20);

select * from aula;
select nombre from aula where superficie > 20;


insert into horario values  ("Primera Hora", '2023-10-19', "Jueves"),
							("Segunda Hora", '2023-10-19', "Jueves"),
                            ("Tercera Hora", '2023-10-19', "Jueves"),
                            ("Primera Hora", '2023-10-20', "Viernes"),
                            ("Segunda Hora", '2023-10-20', "Viernes"),
                            ("Tercera Hora", '2023-10-20', "Viernes"),
                            ("Primera Hora", '2023-10-23', "Lunes"),
                            ("Segunda Hora", '2023-10-23', "Lunes"),
                            ("Tercera Hora", '2023-10-23', "Lunes"),
                            ("Primera Hora", '2023-10-24', "Martes"),
                            ("Segunda Hora", '2023-10-24', "Martes"),
                            ("Tercera Hora", '2023-10-24', "Martes");

select * from horario;
select dia_semana from horario where dia_mes_ano like '2023-10-20' limit 1;

insert into asignatura(codigo_europeo, nombre) values   (043, "Analisis Matemático I"),
														(044, "Analisis Matemático II"),
														(045, "Algebra Lineal I"),
                                                        (046, "Algebra Lineal II"),
                                                        (047, "Fundamentos de Programación I"),
                                                        (048, "Fundamentos de Programación II"),
														(049, "Programación"),
														(050, "Tecnicas Avanzadas de Programación"),
														(051, "Fundamentos de Computadores"),
														(052, "Computadores");

select * from asignatura;

update asignatura 
set codigo_asignatura_requerida = 1
where codigo_interno = 2;
update asignatura 
set codigo_asignatura_requerida = 3
where codigo_interno = 4;
update asignatura 
set codigo_asignatura_requerida = 5
where codigo_interno = 6;
update asignatura 
set codigo_asignatura_requerida = 6
where codigo_interno = 7;
update asignatura 
set codigo_asignatura_requerida = 7
where codigo_interno = 8;
update asignatura 
set codigo_asignatura_requerida = 9
where codigo_interno = 10;

select * from asignatura;
						   /*Hora, fecha, aula, asignatura*/
insert into ocupa values ("Primera Hora", '2023-10-19', 1, 1),
						 ("Segunda Hora", '2023-10-19', 1, 1),
						 ("Tercera Hora", '2023-10-19', 1, 1),
						 ("Primera Hora", '2023-10-19', 5, 2),
						 ("Segunda Hora", '2023-10-19', 5, 2),
						 ("Tercera Hora", '2023-10-19', 5, 2),
						 ("Primera Hora", '2023-10-19', 9, 5),
						 ("Segunda Hora", '2023-10-19', 9, 5),
						 ("Tercera Hora", '2023-10-19', 9, 5),
						 ("Primera Hora", '2023-10-20', 10, 7),
						 ("Segunda Hora", '2023-10-20', 10, 7),
						 ("Tercera Hora", '2023-10-20', 10, 7);
                         
insert into profesor  (dni, nombre, telefono, correo, antiguedad_tutor)
				values("38694549R", "Alfonso", "654345899", "alfonso@correo.com", 5),
					  ("38676549E", "María"  , "657345899", "maria@correo.com"  , 0),
					  ("38973549C", "Ana"    , "654345323", "ana@correo.com"    , 3),
					  ("35374549A", "Pepe"   , "456345899", "pepe@correo.com"   , 2),
					  ("38904549Z", "Andrea" , "691245899", "andrea@correo.com" , 10),
					  ("38004549V", "Juan"   , "654300879", "juan@correo.com"   , 5),
					  ("36794549T", "Nuria"  , "655626809", "nueria@correo.com" , 7),
					  ("38074149H", "Pedro"  , "677345819", "pedro@correo.com"  , 3),
					  ("39584549J", "Marta"  , "654345835", "marta@correo.com"  , 12),
					  ("37094549K", "Angel"  , "624346790", "angel@correo.com"  , 1);

select * from profesor;
select * from profesor where nombre like 'A%';


insert into profesor_asignatura values	(1, 1, 7),
										(1, 2, 5),
										(2, 3, 2),
										(2, 4, 1),
										(3, 5, 10),
										(3, 6, 6),
										(4, 7, 5),
										(4, 8, 4),
										(5, 6, 9),
										(5, 7, 2);


insert into ciclo   (nombre, tipo, codigo_interno_tutor)
			values  ("Diseño de Aplicaciones Web"         , "Ciclo Formativo de Grado Superior", 1),
					("Diseño de Aplicaciones Web 2"       , "Ciclo Formativo de Grado Superior", 2),
					("Sistemas Microinformaticos y Redes" , "Ciclo Formativo de Grado Medio"   , 3),
					("Diseño de Aplicaciones Mobil"       , "Ciclo Formativo de Grado Superior", 4),
					("Diseño de Aplicaciones Mobil 2"     , "Ciclo Formativo de Grado Superior", 5),
					("Administración de Sistemas en Red"  , "Ciclo Formativo de Grado Superior", 6),
					("Administración de Sistemas en Red 2", "Ciclo Formativo de Grado Superior", 7),
					("Farmacia y Parafarmacia"            , "Ciclo Formativo de Grado Medio"   , 8),
					("Tecnico en Gestión Administrativa"  , "Ciclo Formativo de Grado Medio"   , 9),
					("Auxiliar de Enfermería"             , "Ciclo Formativo de Grado Medio"   , 10);

select * from ciclo;
										/*codigo asignatura, codigo ciclo, codigo profesor, inicio, fin*/
insert into ciclo_asignatura_profesor values (1, 1, 1, '2023-09-19', '2023-06-10'),
											 (3, 2, 4, '2023-09-19', '2023-06-10'),
											 (6, 1, 2, '2023-09-19', '2023-06-10'),
											 (4, 3, 1, '2023-09-19', '2023-06-10'),
											 (3, 3, 2, '2023-09-19', '2023-06-10'),
											 (4, 1, 5, '2023-09-19', '2023-06-10'),
											 (6, 4, 9, '2023-09-19', '2023-06-10'),
											 (10, 4, 3, '2023-09-19', '2023-06-10'),
											 (6, 2, 7, '2023-09-19', '2023-06-10'),
											 (8, 2, 4, '2023-09-19', '2023-06-10');