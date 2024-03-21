--Procedimientos almacenados 

select*from Customers

--SP para visualizar los clientes
--Crear un SP
create proc visualizarclientes 
AS
BEGIN
select*from Customers
END
go
-- Alterar SP
Alter proc visualizarclientes 
AS
BEGIN
select Companyname , ContactName from Customers
END
go
--Eliminar SP
Drop proc visualizarclientes

-- Ejecutar SP
exec visualizarclientes 
go

create proc listarclientesporciudad
@ciudad nvarchar(15)
as
begin
select * from Customers
where City = @ciudad
end
go

exec listarclientesporciudad 'Berlin'

Alter proc listarclienteporNombre
@nombre nvarchar(40)
as
begin
select * from Customers
where CompanyName  like @nombre + '%'
end
go

exec listarclienteporNombre 'L'

--Realizar un sp qie obtenga las ventas totales realizadas 
--alos clientes por año elegido

Alter proc ventasClientesPorYear
@year  datetime
as
begin
select c.CompanyName, count(od.Quantity*od.UnitPrice)  from [Order Details] as od
inner join Orders as o on od.OrderID = o.OrderDate
inner join Customers as c on o.CustomerID = o.CustomerID
where  OrderDate = year (@year)
group by c.CompanyName
end
go

exec ventasClientesPorYear '1997'