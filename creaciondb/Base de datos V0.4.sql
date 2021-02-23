DROP DATABASE IF EXISTS Libreria;
CREATE DATABASE IF NOT EXISTS Libreria;

USE Libreria;

CREATE TABLE Direccion(
    id_direccion INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    ciudad VARCHAR(100),
    barrio VARCHAR(100),
    direspecifica VARCHAR(100)
);

CREATE TABLE Autor(
    id_autor INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    seudonimo VARCHAR(100),
    fechanacimiento DATE,
    nacionalidad VARCHAR(100)
);

CREATE TABLE Libro(
    id_libro INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    titulo VARCHAR(100),
    fechapublicacion DATE
);

CREATE TABLE Libreria(
    id_libreria INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_direccion INT NOT NULL,
    nombre VARCHAR(100),
    sede VARCHAR(100),
    CONSTRAINT Fk_id_direccion FOREIGN KEY(id_direccion) 
    REFERENCES Direccion(id_direccion) ON DELETE CASCADE ON UPDATE RESTRICT
);

CREATE TABLE Edicion(
    id_edicion INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_libro INT NOT NULL,
    fechapublicacion DATE,
    editorial VARCHAR(100),
    CONSTRAINT Fk_id_edicion FOREIGN KEY(id_edicion) 
    REFERENCES Libro(id_libro) ON DELETE CASCADE ON UPDATE RESTRICT
);

CREATE TABLE Usuario(
    id_usuario INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_direccion INT NOT NULL,
    id_rol INT NOT NULL,
    genero VARCHAR(9),
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    telefono INT,
    email VARCHAR(100),
    fechanacimiento DATE,
    CONSTRAINT Fk_id_direccion_usuario FOREIGN KEY(id_direccion)
    REFERENCES Direccion(id_direccion) ON DELETE CASCADE ON UPDATE RESTRICT,
    CONSTRAINT Fk_id_rol_usuario FOREIGN KEY(id_rol)
    REFERENCES Rol(id_rol) ON DELETE CASCADE ON UPDATE RESTRICT
);

CREATE TABLE Rol(
    id_rol INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nombrerol VARCHAR(25)
);

CREATE TABLE Solicitud(
    id_solicitud INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    id_edicion INT NOT NULL,
    fechasolicitud DATE,
    lugarsolicitud VARCHAR(100),
    CONSTRAINT Fk_id_usuario_solicitud FOREIGN KEY(id_usuario) 
    REFERENCES Usuario(id_usuario) ON DELETE CASCADE ON UPDATE RESTRICT,
    CONSTRAINT Fk_id_edicion_solicitud FOREIGN KEY(id_edicion) 
    REFERENCES Edicion(id_edicion) ON DELETE CASCADE ON UPDATE RESTRICT
);

CREATE TABLE Categoria(
    id_categoria INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nombreCategoria VARCHAR(100),
    idCategoria INT NOT NULL,
    CONSTRAINT Fk_id_categoria_categoria FOREIGN KEY(idCategoria)
    REFERENCES Categoria(id_categoria) ON DELETE CASCADE ON UPDATE RESTRICT
);

CREATE TABLE LibroporCategoria(
    id_categoria INT PRIMARY KEY NOT NULL,
    id_edicion INT NOT NULL,
    CONSTRAINT Fk_id_edicion_libroporcategoria FOREIGN KEY(id_edicion)
    REFERENCES Edicion(id_edicion) ON DELETE CASCADE ON UPDATE RESTRICT,
    CONSTRAINT Fk_id_categoria_libroporcategoria FOREIGN KEY(id_categoria)
    REFERENCES Categoria(id_categoria) ON DELETE CASCADE ON UPDATE RESTRICT
);

CREATE TABLE LibrosenLibreria(
    id_libreria INT NOT NULL,
    id_edicion INT NOT NULL,
    stock INT,
    CONSTRAINT Fk_id_edicion_librosenlibreria FOREIGN KEY(id_edicion) 
    REFERENCES Edicion(id_edicion) ON DELETE CASCADE ON UPDATE RESTRICT,
    CONSTRAINT Fk_id_libreria_librosenlibreria FOREIGN KEY(id_libreria) 
    REFERENCES Libreria(id_libreria) ON DELETE CASCADE ON UPDATE RESTRICT
);

CREATE TABLE LibroporAutor(
    id_autor INT NOT NULL,
    id_edicion INT NOT NULL,
    CONSTRAINT Fk_id_autor_libroporautor FOREIGN KEY(id_autor) 
    REFERENCES Autor(id_autor) ON DELETE CASCADE ON UPDATE RESTRICT,
    CONSTRAINT Fk_id_edicion_libroporautor FOREIGN KEY(id_edicion) 
    REFERENCES Edicion(id_edicion) ON DELETE CASCADE ON UPDATE RESTRICT
);