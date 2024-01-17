-- SQL-LDD
--Crear la base de datos bdentornosvip

CREATE DATABASE Practica1
go

-- Cambiar de base de datos
USE Practica1
go

--Crear la tabla contacto
CREATE TABLE tblcontacto(
	IdContacto int not null,
	nombre varchar(50) not null,
	constraint pk_tblcontacto
	primary key(IdContacto),
	constraint unique_nombre
	unique(nombre),
)
go