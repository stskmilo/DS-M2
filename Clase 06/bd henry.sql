DROP DATABASE henry;
CREATE DATABASE henry;
USE henry;

CREATE TABLE carrera (
id_carrera INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR(20) NOT NULL,
PRIMARY KEY(id_carrera)
);

CREATE TABLE instructor (
id_instructor INT NOT NULL AUTO_INCREMENT,
cedula INT NOT NULL,
nombre VARCHAR(20) NOT NULL,
apellido VARCHAR(20) NOT NULL,
fecha_nac DATE NOT NULL,
fecha_inc DATE NOT NULL,
PRIMARY KEY(id_instructor)
);

CREATE TABLE cohorte (
id_cohorte INT NOT NULL AUTO_INCREMENT,
codigo VARCHAR(20) NOT NULL,
id_carrera INT NOT NULL,
fecha_inicio DATE,
fecha_fin DATE,
id_instructor INT,
PRIMARY KEY(id_cohorte),
FOREIGN KEY(id_carrera) REFERENCES carrera(id_carrera),
FOREIGN KEY(id_instructor) REFERENCES instructor(id_instructor)
);

CREATE TABLE alumno (
id_alumno INT NOT NULL AUTO_INCREMENT,
cedula INT NOT NULL,
nombre VARCHAR(20) NOT NULL,
apellido VARCHAR(20) NOT NULL,
fecha_nac DATE NOT NULL,
fecha_ing DATE,
id_cohorte INT,
PRIMARY KEY(id_alumno),
FOREIGN KEY(id_cohorte) REFERENCES cohorte(id_cohorte)
);