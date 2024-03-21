--Realizar un sp para Calcular el Total de una orden.

select*from orders
select*from [Order Details]
Alter proc CalcularTotalOrden 
@ID  int 
as
begin
select sum (od.UnitPrice* od.Quantity)as 'Total de Ordenes' from Orders as o
inner join [Order Details] as od on o.OrderID = od.OrderID
where o.OrderID = @ID
end
go

exec CalcularTotalOrden '10248'
exec CalcularTotalOrden '10253'
--Realizar un sp para Actualizar la Cantidad de Productos en Stock
select*from Products
alter proc ActulizarProductosStock
@UnitStok smallint, @Id int
as 
begin
UpDate Products 
 set UnitsInStock = @UnitStok
 where ProductID = @Id
 end
go
exec ActulizarProductosStock 40 , 1
select*from Products
--Realizar un SP para Calcular el Total de Ventas de un Empleado
Create proc TotaldeVentasEmpleado
@Empelado nvarchar (40)
as 
begin 
select sum (od.UnitPrice* od.Quantity) as 'Total de Ventas'from Employees
as e inner join Orders as o on e.EmployeeID = o.EmployeeID 
inner join [Order Details] as od on o.OrderID = od.OrderID
where e.FirstName = @Empelado
end
go
select*from Employees
exec TotaldeVentasEmpleado 'Nancy'
exec TotaldeVentasEmpleado 'Andrew'
--Realizar un SP para Actualizar el Nombre de un Empleado
create proc ActulizarNombreEmpleado
@Id int, @Nombre nvarchar (40)
as 
begin
UpDate Employees 
 set FirstName = @Nombre
 where EmployeeID = @Id
 end
go

exec ActulizarNombreEmpleado 1, Efrain
select*from Employees
--Realizar un SP para Obtener el Total de Ventas por País
Create proc TotaldeVentasPais
@Country nvarchar (15)
as 
begin 
select sum (od.UnitPrice* od.Quantity) as 'Total de Ventas'from Customers
as c inner join Orders as o on c.CustomerID = o.CustomerID 
inner join [Order Details] as od on o.OrderID = od.OrderID
where c.Country = @Country
end
go

exec TotaldeVentasPais 'Germany'
exec TotaldeVentasPais 'Sweden'
--Realizar un SP para Obtener el Número de Órdenes por Cliente
Alter proc NumeroDeOrdenesCliente
@ID nchar (5)
as 
begin
select count (od.Quantity) as 'Total de Ventas' from Orders as o
inner join Customers as c on  o.CustomerID = c.CustomerID
inner join [Order Details] as od on o.OrderID = od.OrderID
where c.CustomerID = @ID
end 
go
select*from Customers

exec NumeroDeOrdenesCliente 'ALFKI'
--Realizar un SP para Calcular el Total de Productos Vendidos por Categoría
Create proc TotaldeProductosVendidosCategoria
@ID int 
as 
begin
select sum (od.UnitPrice* od.Quantity) from Categories as c
inner join Products as p on c.CategoryID = p.CategoryID
inner join  [Order Details] as od on od.ProductID = p.ProductID
where c.CategoryID = @ID
end 
go

exec TotaldeProductosVendidosCategoria '2'
--SP para Calcular el Total de Ventas por Año
Alter proc TotalVentaYear 
@fecha nchar (4) 
as
begin 
select sum (od.UnitPrice* od.Quantity)from Orders as o
inner join [Order Details] as od on o.OrderID = od.OrderID
where   year (o.OrderDate) = @fecha
end
go

exec TotalVentaYear '1996'