DROP DATABASE IF EXISTS Libreria;
CREATE DATABASE IF NOT EXISTS Libreria;

USE Libreria;

CREATE TABLE Direccion(
    id_direccion INT PRIMARY KEY NOT NULL,
    ciudad VARCHAR(100),
    barrio VARCHAR(100),
    direspecifica VARCHAR(100)
);

CREATE TABLE Autor(
    id_autor INT PRIMARY KEY NOT NULL,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    seudonimo VARCHAR(100),
    fechanacimiento VARCHAR(100),
    nacionalidad VARCHAR(100)
);

CREATE TABLE Libro(
    id_libro INT PRIMARY KEY NOT NULL,
    titulo VARCHAR(100),
    fechapublicacion DATE
);

CREATE TABLE Libreria(
    id_libreria INT PRIMARY KEY NOT NULL,
    id_direccion INT NOT NULL,
    nombre VARCHAR(100),
    sede VARCHAR(100),
    CONSTRAINT Fk_id_direccion FOREIGN KEY(id_direccion) REFERENCES Direccion(id_direccion)
);

CREATE TABLE Edicion(
    id_edicion INT PRIMARY KEY NOT NULL,
    id_libro INT NOT NULL,
    fechapublicacion DATE,
    editorial VARCHAR(100),
    CONSTRAINT Fk_id_edicion FOREIGN KEY(id_edicion) REFERENCES Libro(id_libro)
);

CREATE TABLE Miembro(
    id_miembro INT PRIMARY KEY NOT  NULL,
    id_direccion INT NOT NULL,
    genero VARCHAR(9),
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    telefono INT,
    email VARCHAR(100),
    fechanacimiento DATE,
    CONSTRAINT Fk_id_direccion FOREIGN KEY(id_direccion) REFERENCES Direccion(id_direccion)
);

CREATE TABLE Solicitud(
    id_solicitud INT PRIMARY KEY NOT NULL,
    id_miembro INT NOT NULL,
    id_edicion INT NOT NULL,
    fechasolicitud DATE,
    lugarsolicitud LOCATE,
    CONSTRAINT Fk_id_miembro FOREIGN KEY(id_miembro) REFERENCES Miembro(id_miembro),
    CONSTRAINT Fk_id_libreria FOREIGN KEY(id_libreria) REFERENCES Libreria(id_libreria)
);

CREATE TABLE Categoria(
    id_categoria INT PRIMARY KEY NOT NULL,
    nombreCategoria VARCHAR(100),
    idCategoria INT NOT NULL,
    CONSTRAINT Fk_id_categoria FOREIGN KEY(id_categoria) REFERENCES Categoria(id_categoria)
);

CREATE TABLE LibroporCategoria(
    id_categoria INT PRIMARY KEY NOT NULL,
    id_edicion INT NOT NULL,
    CONSTRAINT Fk_id_edicion FOREIGN KEY(id_edicion) REFERENCES Edicion(id_edicion),
    CONSTRAINT Fk_id_categoria FOREIGN KEY(id_categoria) REFERENCES Categoria(id_categoria)
);

CREATE TABLE LibrosenLibreria(
    id_libreria INT NOT NULL,
    id_edicion INT NOT NULL,
    stock INT,
    CONSTRAINT Fk_id_edicion FOREIGN KEY(id_edicion) REFERENCES Edicion(id_edicion),
    CONSTRAINT Fk_id_libreria FOREIGN KEY(id_libreria) REFERENCES Libreria(id_libreria)
);

CREATE TABLE LibeoporAutor(
    id_autor INT NOT NULL,
    id_edicion INT NOT NULL,
    CONSTRAINT Fk_id_autor FOREIGN KEY(id_autor) REFERENCES Autor(id_autor),
    CONSTRAINT Fk_id_edicion FOREIGN KEY(id_edicion) REFERENCES Edicion(id_edicion)
);  