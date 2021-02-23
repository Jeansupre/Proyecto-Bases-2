DROP DATABASE IF EXISTS Libreria;
CREATE DATABASE IF NOT EXISTS Libreria;

USE Libreria;

CREATE TABLE Miembro(
    id_miembro INT PRIMARY KEY NOT  NULL,
    id_dirección INT NOT NULL,
    genero VARCHAR(9),
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    telefono INT,
    email VARCHAR(100),
    fechanacimiento DATE,
    FOREING KEY(id_dirección) REFERENCES Direccion(id_dirección)
);

CREATE TABLE Direccion(
    id_dirección INT PRIMARY KEY NOT NULL,
    ciudad VARCHAR(100),
    barrio VARCHAR(100),
    direspecifica VARCHAR(100)
);

CREATE TABLE Libreria(
    id_libreria INT PRIMARY KEY NOT NULL,
    id_dirección INT NOT NULL,
    nombre VARCHAR(100),
    sede VARCHAR(100),
    FOREING KEY(id_dirección) REFERENCES Direccion(id_dirección)
);

CREATE TABLE Solicitud(
    id_solicitud INT PRIMARY KEY NOT NULL,
    id_miembro INT NOT NULL,
    id_edicion INT NOT NULL,
    fechasolicitud DATE,
    lugarsolicitud LOCATE,
    FOREING KEY(id_miembro) REFERENCES Miembro(id_miembro),
    FOREING KEY(id_libreria) REFERENCES Libreria(id_libreria)
);

CREATE TABLE Edicion(
    id_edicion INT PRIMARY KEY NOT NULL,
    id_libro INT NOT NULL,
    fechapublicacion DATE,
    editorial VARCHAR(100),
    FOREING KEY(id_edicion) REFERENCES Libro(id_libro)
);

CREATE TABLE Libro(
    id_libro INT PRIMARY KEY NOT NULL,
    titulo VARCHAR(100),
    fechapublicacion DATE
)

CREATE TABLE Categoria(
    id_categoria INT PRIMARY KEY NOT NULL,
    nombreCategoria VARCHAR(100),
    idCategoria INT NOT NULL
);

CREATE TABLE LibroporCategoria(
    id_categoria INT PRIMARY KEY NOT NULL,
    id_edicion INT NOT NULL,
    FOREING KEY(id_edicion) REFERENCES Edicion(id_edicion)
);

CREATE TABLE LibrosenLibreria(
    id_libreria INT NOT NULL,
    id_edicion INT NOT NULL,
    stock INT,
    FOREING KEY(id_edicion) REFERENCES Edicion(id_edicion),
    FOREING KEY(id_libreria) REFERENCES Libreria(id_libreria)
);

CREATE TABLE LibeoporAutor(
    id_autor INT NOT NULL,
    id_edicion INT NOT NULL,
    FOREING KEY(id_autor) REFERENCES Autor(id_autor),
    FOREING KEY(id_edicion) REFERENCES Edicion(id_edicion)
);

CREATE TABLE Autor(
    id_autor INT PRIMARY KEY NOT NULL,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    seudonimo VARCHAR(100),
    fechanacimiento VARCHAR(100),
    nacionalidad VARCHAR(100)
);

