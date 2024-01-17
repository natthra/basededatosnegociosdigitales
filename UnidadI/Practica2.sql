-- SQL-LDD
--Crear la base de datos Practica2

CREATE DATABASE Practica2
go

-- Cambiar de base de datos
USE Practica2
go

--Crear la tabla Cliente
CREATE TABLE tblCliente(
	IdCliente int not null,
	nombre varchar(100) not null,
	direccion varchar(100) not null,
	telefono varchar(20),
	constraint pk_tblCliente
	primary key(IdCliente),
	constraint unico_nombre
	unique(nombre)
)
go

--Crear la tabla Empleado
CREATE TABLE tblEmpleado(
	IdEmpleado int not null,
	nombre varchar(50) not null,
	apellidos varchar(80) not null,
	sexo char(1) not null,
	salario decimal(10,2) not null,
	constraint pk_tblEmpleado
	primary key(IdEmpleado),
	constraint chk_sexo
	check(sexo='h' or sexo = 'm'),
	constraint chk_salario
	check(salario>=400 and salario<=40000)
)
go