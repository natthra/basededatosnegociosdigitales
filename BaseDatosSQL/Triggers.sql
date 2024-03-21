insert into Customers (CustomerID,CompanyName,Region)
values ('Erty', 'clientenuevo','este')

create database pruebatriggers
go
use Practica1
drop database pruebatriggers
use pruebatriggers

create table productos(
idproducto int not null,
nombreProd varchar(100) not null,
existencia int not null,
preciounitario decimal(10,2) not null,
constraint pk_idproducto
primary key (idproducto),
constraint unique_nombreprd
unique (nombreProd)
)
go
drop table productos

create table ventas (
ventaid int not null,
fecha date not null,
idcliente int not null,
idvendedor int not null,
constraint pk_ventas
primary key(ventaid)
)
drop table ventas

create table clientes (
idcliente int not null,
nombre varchar(100),
ciudad varchar(20),
pais varchar(20),
constraint pk_cliente
primary key(idcliente)
)



create table vendedor(
idvendedor int not null,
nombre varchar(100) not null,
apellidos varchar(50) not null,
ciudad varchar(20),
pais varchar(20),
constraint pk_vendedor
primary key(idvendedor)
)


create table detalle_venta
(
idventa int not null,
idproducto int not null,
precioVenta decimal(10,2),
cantidad int
constraint pk_detalle_venta
primary key(idventa),
constraint fk_detalle_venta_venta
foreign key (idventa)
references ventas(ventaid),
constraint fk_detalle_venta_producto
foreign key (idproducto)
references productos(idproducto)
)

alter table ventas
add constraint fk_venta_cliente
foreign key (idcliente)
references clientes

alter table ventas
add constraint fk_venta_vendedor
foreign key (idvendedor)
references vendedor

create view clientes_view 
as
select top 30 CustomerID, CompanyName, City, Country from NORTHWND.dbo.Customers

select*from clientes_view


create view vendedores_view 
as
select  EmployeeID, FirstName, LastName , City, country  from NORTHWND.dbo.Employees

select*from vendedores_view

create view productos_view 
as
select  top 50 ProductID, ProductName, UnitPrice, UnitPrice  from NORTHWND.dbo.Products


--SP que llena las tablas por vetnas y ordenes 

create or alter proc LlenarTabla_SP
@nombreTabla varchar (20)
as 
begin 
	if @nombreTabla = 'detalle_venta'
	begin
	select  vc.CustomerID,o.OrderDate, vc.CustomerID, VV.EmployeeID  from clientes_view as vc
	inner join NORTHWND.dbo.Orders as o
	on vc.CustomerID = o.CustomerID
	inner join vendedores_view as vv
	on vv.EmployeeID = o.EmployeeID

	end
end



create or alter procedure llenar_tablas_catalogo
@nombreTabla varchar(100)
as
begin
    if @nombreTabla = 'clientes'
    begin
        insert into clientes
        select CustomerID,CompanyName,city, country
        from NORTHWND.dbo.customers
    end
    else if @nombreTabla = 'productos'
    begin
        insert into productos
        select ProductID, ProductName,UnitsInStock, UnitPrice
        from NORTHWND.dbo.Products
    end
    else if @nombreTabla = 'vendedor'
    begin
        insert into vendedor
        select EmployeeID, FirstName, LastName, city, country
        from NORTHWND.dbo.Employees
    end
    else
    begin
       print('Nombre de tabla no valida')
    end
end

select * from vendedor
 exec llenar_tablas_catalogo 'vendedor'

 select*from productos
 exec llenar_tablas_catalogo 'productos'

 select * from  clientes
 exec llenar_tablas_catalogo 'clientes'

 create or alter proc cargar_venta
 as 
 begin
 insert into ventas 
 select orderid, OrderDate, CustomerID, EmployeeID
 from NORTHWND.dbo.Orders
 end

 select*from ventas
 exec cargar_venta

  create or alter procedure cargar_dellate_venta
 as
	begin  
	insert into detalle_venta
		select OrderID, ProductID, Unitprice, Quantity from NORTHWND.dbo.[Order Details]
end

select*from detalle_venta
exec cargar_dellate_venta


create trigger verificarProducto
on clientes
after insert
as
begin
	print('Se disparo el trigger de insert')
end

insert into clientes
values ('ABC10', 'CLIENTE NUEVO', 'SANTA MARIA', 'FRANCIA')


create trigger verificarProducto_eliminar
on clientes
after delete
as
begin
	print('Se disparo el trigger de insert Delete')
end

delete from  clientes
where   idcliente = 'ABC10' 

create trigger verificarProducto_Update
on clientes
after Update
as
begin
	print('Se disparo el trigger de insert Delete')
end

update clientes
set nombre = 'Clientex'
where idcliente = 'ABC10'

delete from 


create trigger verificarcliente_eventos
on clientes
after insert, delete, update
as
begin
	if (Select count(*)from inserted) > 0 and (select count (*)from deleted)=0
	begin
	print('Se realizo un insert')
	end
	else
	if (select count (*)from deleted) =0  and (Select count(*)from inserted) >0
	begin 
	print('Se realizo un delete')
	end 
	else 
	if (select count (*)from deleted) >0  and (Select count(*)from inserted) >0
	print('Se realizo un Update')
end


create trigger AgregarPreciodetalleVneta
on  detalle_venta 
for insert 
as
begin 
	declare @idProducto int
	declare @precio decimal (10,2)
	set @idproducto = (Select idproducto from inserted)
	set @precio = (Select preciounitario from productos where idproducto = @idProducto)

	update detalle_venta
	set precioVenta = @precio
	where idproducto = @idProducto

end


select*from detalle_venta
select preciounitario from productos where idproducto = 22

insert into detalle_venta (idventa,idproducto,cantidad)
values ('10250',22,4)


create or alter proc  SP_AgregarPreciodetalleVeNta
@numerodeventa int, @numerodeproducto int, @cantidad int
as
 begin
	insert into detalle_venta (idventa,idproducto,cantidad)
	values (@numerodeventa,@numerodeproducto,@cantidad)
 create trigger AgregarPreciodetalleVenta
	on  detalle_venta 
	for insert 
	as
	begin 
	declare @idproducto int 
	declare @precio decimal (10,2)
	set @idproducto = (Select idproducto from inserted)
	set @precio = (Select preciounitario from productos where idproducto = @idProducto)

	update detalle_venta
	set precioVenta = @precio
	where idproducto = @idProducto

end
end