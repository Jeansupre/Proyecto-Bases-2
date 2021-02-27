DROP DATABASE IF EXISTS Proyecto_Libreria;
CREATE DATABASE IF NOT EXISTS Proyecto_Libreria;

USE Proyecto_Libreria;

CREATE TABLE Usuario(
    ID int NOT NULL AUTO_INCREMENT,
    NOMBRE varchar(20) NOT NULL,
    SEXO varchar(12) NOT NULL,
    APELLIDO varchar(20) NOT NULL,
    TELEFONO int NOT NULL,
    EMAIL varchar(50) NOT NULL,
    USER varchar(16) NOT NULL,
    CONTRASENA varchar(80) NOT NULL,
    FECHA_NACIMIENTO date NOT NULL,
    ID_DIRECCION int,
    ID_ROL int,
    PRIMARY KEY (ID)
);

CREATE TABLE Rol(
    ID int NOT NULL AUTO_INCREMENT,
    NOMBREROL varchar(20) NOT NULL,
    PRIMARY KEY (ID)
);

CREATE TABLE Direccion(
    ID int NOT NULL AUTO_INCREMENT,
    CIUDAD varchar(20) NOT NULL,
    BARRIO varchar(20),
    DIRESPECIFICA varchar(50) NOT NULL,
    PRIMARY KEY (ID)
);

CREATE TABLE Libreria(
    ID int NOT NULL AUTO_INCREMENT,
    NOMBRE varchar(20) NOT NULL,
    SEDE varchar(20) NOT NULL,
    ID_DIRECCION int,
    PRIMARY KEY (ID)
);

CREATE TABLE LibroEnLibreria(
    ID_LIBRERIA int NOT NULL,
    ID_EDICION int NOT NULL,
    STOCK int NOT NULL,
    PRIMARY KEY (ID_LIBRERIA, ID_EDICION)
);

CREATE TABLE Libro(
    ID int NOT NULL AUTO_INCREMENT,
    TITULO varchar(50) NOT NULL,
    FECHA_PUBLICACION date,
    PRIMARY KEY (ID)
);

CREATE TABLE Solicitud(
    ID int NOT NULL AUTO_INCREMENT,
    FECHA_SOLICITUD date NOT NULL,
    LUGAR_SOLICITUD varchar(20) NOT NULL,
    ID_USUARIO int,
    ID_EDICION int,
    PRIMARY KEY (ID)
);

CREATE TABLE Edicion(
    ID int NOT NULL AUTO_INCREMENT,
    ID_LIBRO int,
    FECHA_PUBLICACION date NOT NULL,
    EDITORIAL varchar(20) NOT NULL,
    PRIMARY KEY (ID)
);

CREATE TABLE Autor(
    ID int NOT NULL AUTO_INCREMENT,
    NOMBRE varchar(20),
    APELLIDO varchar(20),
    SEUDONIMO varchar(20) NOT NULL,
    FECHA_NACIMIENTO date,
    NACIONALIDAD varchar(20),
    PRIMARY KEY (ID)
);

CREATE TABLE LibroPorAutor(
    ID_LIBRO int NOT NULL,
    ID_AUTOR int NOT NULL,
    PRIMARY KEY (ID_AUTOR, ID_LIBRO)
);

CREATE TABLE LibroPorCategoria(
    ID_LIBRO int NOT NULL,
    ID_CATEGORIA int NOT NULL,
    PRIMARY KEY (ID_CATEGORIA, ID_LIBRO)
);

CREATE TABLE Categoria(
    ID int NOT NULL AUTO_INCREMENT,
    NOMBRE varchar(40) NOT NULL,
    IDCATEGORIA int,
    PRIMARY KEY (ID)
);

ALTER TABLE Libreria
ADD FOREIGN KEY(ID_DIRECCION)
REFERENCES Direccion (ID)
on delete restrict on update restrict;   

ALTER TABLE Usuario
ADD FOREIGN KEY(ID_ROL)
REFERENCES Rol (ID)
on delete restrict on update restrict;

ALTER TABLE Usuario
ADD FOREIGN KEY(ID_DIRECCION)
REFERENCES Direccion (ID)
on delete restrict on update restrict;

ALTER TABLE Solicitud
ADD FOREIGN KEY(ID_USUARIO)
REFERENCES Usuario (ID)
on delete restrict on update restrict;

ALTER TABLE Solicitud
ADD FOREIGN KEY(ID_EDICION)
REFERENCES Edicion (ID)
on delete restrict on update restrict;

ALTER TABLE Edicion
ADD FOREIGN KEY(ID_LIBRO)
REFERENCES Libro (ID)
on delete restrict on update restrict;

ALTER TABLE LibroEnLibreria
ADD FOREIGN KEY(ID_EDICION)
REFERENCES Edicion (ID)
on delete restrict on update restrict;

ALTER TABLE LibroEnLibreria
ADD FOREIGN KEY(ID_LIBRERIA)
REFERENCES Libreria (ID)
on delete restrict on update restrict;

ALTER TABLE LibroPorCategoria
ADD FOREIGN KEY(ID_CATEGORIA)
REFERENCES Categoria (ID)
on delete restrict on update restrict;

ALTER TABLE LibroPorCategoria
ADD FOREIGN KEY(ID_LIBRO)
REFERENCES Libro (ID)
on delete restrict on update restrict;

ALTER TABLE LibroPorAutor
ADD FOREIGN KEY(ID_AUTOR)
REFERENCES Autor (ID)
on delete restrict on update restrict;

ALTER TABLE LibroPorAutor
ADD FOREIGN KEY(ID_LIBRO)
REFERENCES Libro (ID)
on delete restrict on update restrict;

ALTER TABLE Categoria
ADD FOREIGN KEY(IDCATEGORIA)
REFERENCES Categoria(ID)
on delete restrict on update restrict;