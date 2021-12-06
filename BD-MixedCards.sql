CREATE DATABASE proyectobd;
USE proyectobd;

/****           Creacion de tablas          ********************************************************************************/

CREATE TABLE usuarios(
    id_usuario INT AUTO_INCREMENT,
    username VARCHAR (50) NOT NULL,
    correo VARCHAR (50) NOT NULL,
    nombre VARCHAR (50) NOT NULL,
    apellido VARCHAR (50) NOT NULL,
    contraseña VARCHAR (50) NOT NULL,
    telefono VARCHAR(12),
    nacimiento DATE NOT NULL,
    fecha_creacion DATE NOT NULL,
    genero VARCHAR (25),
    administrador BOOLEAN NOT NULL,
    PRIMARY KEY (id_usuario),
    UNIQUE (username, correo));

CREATE TABLE baneados(
    id_usuario INT AUTO_INCREMENT,
    username VARCHAR (50) NOT NULL,
    correo VARCHAR (50) NOT NULL,
    nombre VARCHAR (50) NOT NULL,
    apellido VARCHAR (50) NOT NULL,
    contraseña VARCHAR (50) NOT NULL,
    telefono VARCHAR(12),
    nacimiento DATE NOT NULL,
    genero VARCHAR (25),
    administrador BOOLEAN NOT NULL,
    PRIMARY KEY (id_usuario),
    UNIQUE (username, correo));

CREATE TABLE juegos(
    id_juegos INT AUTO_INCREMENT,
    nombre VARCHAR (30) NOT NULL,
    puntos_juego INT NOT NULL,
    PRIMARY KEY (id_juegos));

CREATE TABLE cartera(
    usuario_cartera VARCHAR (50),
    fondos_totales INT NOT NULL,
    tipo_metodo VARCHAR (50),
    PRIMARY KEY (usuario_cartera));

CREATE TABLE cosmeticos(
    id_cosmetico INT AUTO_INCREMENT,
    precio INT NOT NULL,
    PRIMARY KEY (id_cosmetico));

CREATE TABLE banner (
    id_banner INT AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_banner));
  
CREATE TABLE marco_perfil (
    id_marco INT,
    nombre VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_marco));

CREATE TABLE invita (
    id_usuario INT,
    id_usuario_invitado INT,
    PRIMARY KEY (id_usuario, id_usuario_invitado));

CREATE TABLE movimiento (
    id_movimiento INT AUTO_INCREMENT,
    id_usuario INT,
    id_pack INT DEFAULT '7',
    usuario_cartera VARCHAR (50),
    movimiento_fecha DATE NOT NULL,
    movimiento_valor INT DEFAULT '0',
    PRIMARY KEY (id_movimiento, id_usuario, usuario_cartera));
    
CREATE TABLE personaliza (
    id_usuario INT,
    id_cosmetico INT,
    estado_uso BOOLEAN NOT NULL,
    PRIMARY KEY (id_usuario,id_cosmetico));

CREATE TABLE partida (
    nro_partida INT AUTO_INCREMENT,
    id_usuario INT,
    id_juego INT,
    fecha_hora DATETIME NOT NULL,
    puntos_partida INT NOT NULL,
    personaGana BOOLEAN NOT NULL,
    maquinaGana BOOLEAN NOT NULL,
    PRIMARY KEY (nro_partida,id_usuario,id_juego));
    
CREATE TABLE coins (
    id_pack INT AUTO_INCREMENT,
    cantidad INT NOT NULL,
    costo INT NOT NULL,
    PRIMARY KEY (id_pack),
    UNIQUE (cantidad));


/****           Restricciones           ********************************************************************************/

ALTER TABLE invita 
    ADD  FOREIGN KEY (id_usuario) REFERENCES usuarios (id_usuario),
    ADD  FOREIGN KEY (id_usuario_invitado) REFERENCES usuarios (id_usuario);
    
ALTER TABLE personaliza
    ADD  FOREIGN KEY (id_usuario) REFERENCES usuarios (id_usuario),
    ADD  FOREIGN KEY (id_cosmetico) REFERENCES cosméticos (id_cosmetico);

ALTER TABLE partida
    ADD FOREIGN KEY (id_usuario) REFERENCES usuarios (id_usuario),
    ADD FOREIGN KEY (id_juego) REFERENCES juegos (id_juegos);

ALTER TABLE movimiento
    ADD FOREIGN KEY (id_pack) REFERENCES coins (id_pack),
    ADD FOREIGN KEY (id_usuario) REFERENCES usuarios (id_usuario),
    ADD FOREIGN KEY (usuario_cartera) REFERENCES cartera (usuario_cartera);

/********** Usuarios de Prueba ******************************/

insert into cartera (username, correo, nombre, apellido, contraseña, telefono, nacimiento, fecha_creacion, administrador) 
values ('Admin', 'ignaciotachini@gmail.com', 'Ignacio', 'Tachini', 'Contrasenia32123', '4093682966', '1986-06-20', '2018-09-21', TRUE);

insert into usuarios (username, correo, nombre, apellido, contraseña, telefono, nacimiento, fecha_creacion, administrador) 
values ('Admin2', 'admin2@gmail.com', 'Erik', 'Hernandez', 'Contrasenia32123', '4093682966', '1986-06-20', '2019-09-21', TRUE);

insert into usuarios (username, correo, nombre, apellido, contraseña, telefono, nacimiento, fecha_creacion, administrador) 
values ('Admin3', 'admin3@gmail.com', 'Gaston', 'Centurion', 'Contrasenia32123', '4093682966', '1986-06-20', '2020-09-21', TRUE);

insert into usuarios (username, correo, nombre, apellido, contraseña, telefono, nacimiento, fecha_creacion, administrador) 
values ('Default', 'def@gmail.com', 'User', 'User', 'Contrasenia32123', '4093682966', '1986-06-20', '2021-09-21', FALSE);

insert into usuarios (username, correo, nombre, apellido, contraseña, telefono, nacimiento, fecha_creacion, administrador) 
values ('Default2', 'def2@gmail.com', 'User2', 'User2', 'Contrasenia32123', '4093682966', '1986-06-20', '2021-10-21', FALSE);

/********** Carteras de los Usuarios de Prueba ******************************/

insert into cartera (usuario_cartera, fondos_totales) 
values ('Admin', 0);

insert into cartera (usuario_cartera, fondos_totales) 
values ('Admin2', 0);

insert into cartera (usuario_cartera, fondos_totales) 
values ('Admin3', 0);

insert into cartera (usuario_cartera, fondos_totales) 
values ('Default', 0);

insert into cartera (usuario_cartera, fondos_totales) 
values ('Default2', 0);

/********** Pack de compras ******************************/
INSERT INTO coins (cantidad, costo) VALUES (200, 2);
INSERT INTO coins (cantidad, costo) VALUES (525, 5);
INSERT INTO coins (cantidad, costo) VALUES (1125, 10);
INSERT INTO coins (cantidad, costo) VALUES (2350, 21);
INSERT INTO coins (cantidad, costo) VALUES (6250, 54);
INSERT INTO coins (cantidad, costo) VALUES (13500, 108);
INSERT INTO coins (cantidad, costo) VALUES (0, 0);

/********** Juegos ******************************/
INSERT INTO juegos (nombre, puntos_juego) VALUES ('blackjack', 500);
INSERT INTO juegos (nombre, puntos_juego) VALUES ('Truco Uruguayo', 1000);






