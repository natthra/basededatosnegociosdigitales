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

--Crear la tabla Venta
CREATE TABLE tblVenta(
	IdVenta int not null,  
	fecha date not null, 
	IdCliente int not null,
	IdEmpleado int not null,
	constraint pk_tblVenta
	primary key(IdVenta),
	constraint fk_tblCliente
	foreign key(IdCliente)
	references tblCliente(IdCliente),
	constraint fk_tblEmpleado
	foreign key(IdEmpleado)
	references tblEmpleado(IdEmpleado)
)

--Crear la tabla Producto
CREATE TABLE tblProducto(
	IdProducto int not null,
	descripcion varchar(100) not null,
	existencia int not null,
	PrecioUnitario int not null,
	constraint pk_tblProducto
	primary key(IdProducto),
	constraint unico_descripcion
	unique(descripcion)
)
go

--Crear la tabla Detalle_Venta
CREATE TABLE Detalle_Venta(
  IdVenta int not null,
  IdProducto int not null,
  Precio decimal(10,2) not null,
  Cantidad int not null, 
  constraint pk_Detalle_Venta
  primary key(IdVenta,IdProducto),
  constraint fk_tblVenta
  foreign key(IdVenta)
  references tblVenta(IdVenta),
  constraint fk_tblProducto
  foreign key(IdProducto)
  references tblProducto(IdProducto),
)