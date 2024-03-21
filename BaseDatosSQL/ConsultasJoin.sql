--Consultas con join 
--inner join

--Seleccionar el numero de orden, nombre del cliente y la fecha de la order

select orderId, CompanyName	, OrderDate 
from Orders as o
inner join Customers as c
on c.CustomerID = o.CustomerID

--Mostrar el total de ordenes de cada cliente mostrando el nombre de compañia

select  CompanyName	, COUNT(*) as 'Total de Pedidos' 
from Orders as o
inner join Customers as c
on c.CustomerID = o.CustomerID
group by CompanyName

select CompanyName, COUNT(*) as 'Total de Pedidos' 
from Orders as o
inner join Customers as c
on c.CustomerID = o.CustomerID
group by CompanyName
order by 2 desc

--Seleccionar el numero de producto, el nombre del producto y el nombre de la categoria, ordenado de forma ascendente
--con respecto al nombre de la categira.
select ProductID,ProductName, categoryName 
from Products as p
inner join Categories as c
on c.CategoryID = p.CategoryID
order by 3 asc

--Seleccionar todas las ordenes 
--Mostrando las fechas	ordenes de compra 
--Nombre del Shipper y el nombre al cliente
-- al que se le vendio (inner join)
/*Order Date
CompanyName
CompanyName
 */
 Select*From Orders
Select OrderDate, c.CompanyName as 'Nombre del cliente ', s.CompanyName as 'Nombre del Shipper' 
from Orders as p
inner join Customers as c
on c.CustomerID = p.CustomerID
inner join Shippers s
on s.ShipperID = p.ShipVia

--Seleccionat  el nombre del producto y su categoria
Select ProductName as 'Nombre del Producto' , 
CategoryName as 'Nombre de la Categoria' 
from Products as p
inner join Categories as c
on c.CategoryID = p.CategoryID

--Listar el nombre del cliente, la fecha de la orden 
--y los nombres de los productos vendidos

Select c.CompanyName, o.OrderDate, P.ProductID  from 
Customers as c
inner join orders as o
on c.CustomerID = o.CustomerID
inner join [Order Details] as od
on o.OrderID = od.OrderID
inner join Products as p
on od.ProductID = p.ProductID

--Seleccionar los nombres completos de los empleados 
-- los nombres de los productos que vendio y la cantidad 
--de ellos y cualcular el importe 

select CONCAT( e.FirstName, ' ', e.LastName)as 'Nombre Completo',
p.ProductName as 'Descripcion', (od.Quantity*od.UnitPrice) as 'Importe' from 
Employees as e
inner join Orders as o
on e.EmployeeID = o.EmployeeID
inner join [Order Details] as od
on od.OrderID = o.OrderID 
inner join Products as p
on p.ProductID = od.ProductID


--Seleccionar los nombres completos de los empleados 
-- los nombres de los productos que vendio y la cantidad 
--de ellos y cualcular el importe
--pero solo suiza, alemania y francia
select*From Suppliers
select o.ShipCountry as 'Pais', CONCAT( e.FirstName, ' ', e.LastName)as 'Nombre Completo',
p.ProductName as 'Descripcion', (od.Quantity*od.UnitPrice) as 'Importe'  from 
Employees as e
inner join Orders as o
on e.EmployeeID = o.EmployeeID
inner join [Order Details] as od
on od.OrderID = o.OrderID 
inner join Products as p
on p.ProductID = od.ProductID
where o.ShipCountry in ('Germany','Sweden','France')

--Seleccionar los nombres completos de los empleados 
-- los nombres de los productos que vendio y la cantidad 
--de ellos y cualcular el importe
--pero solo suiza, alemania y francia
--Agrupados  por la cantidad de ordenes hechas por los empleados

select CONCAT( e.FirstName, ' ', e.LastName)as 'Nombre Completo',
p.ProductName as 'Descripcion', (od.Quantity*od.UnitPrice) as 'Importe', count (*) as 'Total' from 
Employees as e
inner join Orders as o
on e.EmployeeID = o.EmployeeID
inner join [Order Details] as od
on od.OrderID = o.OrderID 
inner join Products as p
on p.ProductID = od.ProductID
where ShipCountry in ('Germany','Sweden','France')  
group by CONCAT( e.FirstName, ' ', e.LastName), p.ProductName


-- Total de ordenes enviadas a Francia, alemania y suiza
select count(*) as 'Total de Ordenes'
from
employees as e
inner join orders as o
on e.EmployeeID = o.EmployeeID
inner join [Order Details] as od
on od.OrderID = o.OrderID
inner join Products as p
on p.ProductID = od.ProductID
where o.ShipCountry in ('France', 'Germany','Switzerland')


-- Seleccionar el numero de ordenes enviadas a alemania, suiza y francia
-- agrupadas por el empleado
select count(*) as 'Total de Ordenes',o.ShipCountry ,CONCAT(e.FirstName, ' ', e.LastName)
as 'Nombre Completo'
from
employees as e
inner join orders as o
on e.EmployeeID = o.EmployeeID
inner join [Order Details] as od
on od.OrderID = o.OrderID
inner join Products as p
on p.ProductID = od.ProductID
where o.ShipCountry in ('France', 'Germany','Switzerland')
group by CONCAT(e.FirstName, ' ', e.LastName), o.ShipCountry


select count(*) as 'Total de Ordenes',o.ShipCountry ,CONCAT(e.FirstName, ' ', e.LastName)
as 'Nombre Completo' 
from
employees as e
inner join orders as o
on e.EmployeeID = o.EmployeeID
inner join [Order Details] as od
on od.OrderID = o.OrderID
inner join Products as p
on p.ProductID = od.ProductID
where o.ShipCountry in ('France', 'Germany','Switzerland') and e.FirstName in ('Andrew')
group by CONCAT(e.FirstName, ' ', e.LastName), o.ShipCountry

--Seleccionar el total de dinero que se le
--han vendido a cada uno de los clientes
--de 1996

select companyName as 'Cliente',
sum(UnitPrice * Quantity) as 'Total de venta'
from
[Order Details] as od
inner join
Orders as o
on od.OrderID = o.OrderID
inner join Customers as c
on o.CustomerID = c.CustomerID
where year(o.OrderDate) = '1996'
group by companyName
order by 2 desc

--Seleccionar el total de dinero que se le
--han vendido a cada uno de los clientes
--de 1996
select * from Orders
select companyName as 'Cliente',
sum(UnitPrice * Quantity) as 'Total de venta', year (OrderDate) as 'Por año	'  
from
[Order Details] as od
inner join
Orders as o
on od.OrderID = o.OrderID
inner join Customers as c
on o.CustomerID = c.CustomerID
group by companyName,year (OrderDate) 
order by 1 asc

--Seleccionar el importe total que se ha vendido
--Por categoria de producto

select c.CategoryName, sum (od.UnitPrice * od.Quantity) as 'Importe' from 
[Order Details] as od
inner join Products as o
on o.ProductID = od.ProductID
inner join Categories c
on o.CategoryID = c.CategoryID
group by c.CategoryName
order by 2 desc

--Seleccionar el importe total que se ha vendido
--Por categoria de producto y nombre del producto, que permita
--visualizar el producto mas vendido
select c.CategoryName, sum (od.UnitPrice * od.Quantity)as 'Importe', ProductName  from 
[Order Details] as od
inner join Products as o
on o.ProductID = od.ProductID
inner join Categories c
on o.CategoryID = c.CategoryID
group by c.CategoryName, ProductName
order by 2 desc

--de la consulta anterior solamente aquellos totales que son mayores a 20000
 select c.CategoryName, sum (od.UnitPrice * od.Quantity)  as 'Importe', ProductName  from 
[Order Details] as od
inner join Products as o
on o.ProductID = od.ProductID
inner join Categories c
on o.CategoryID = c.CategoryID
group by c.CategoryName, ProductName
having  sum (od.UnitPrice * od.Quantity) > 20000
order by 2 desc

--seleccionar el numero de clientes por
-- cada pais, en donde solo se inlcuyan 
--lo que tengan mas de 5 clientes y 
--ordenados de forma descendente por el numero
-- de clientes

select Country ,count (CompanyName) as 'Numero de Clientes'  
from Customers
where Country != 'Brazil'
group by Country
having count (CompanyName)>5 
order by 2 desc

select Country ,count (CompanyName) as 'Numero de Clientes'  
from Customers
where Country not in  ('Brazil')
group by Country
having count (CompanyName)>5 
order by 2 desc

select Country ,count (CompanyName) as 'Numero de Clientes'  
from Customers
where not Country = 'Brazil'
group by Country
having count (CompanyName)>5 
order by 2 desc


--seleccionar los clientes que han realizados pedidos en mas de un pais
--(CustomerID, Nombre del cliente, shipcountry, suma total de las ordenes)

select c.CustomerID, c.CompanyName,shipcountry
from Orders as o
inner join Customers as c
on o.CustomerID = c.CustomerID
inner join [Order Details] as od
on o.OrderID = od.OrderID


select p.productID, p.ProductName, c.CategoryName, 
from Products as p
inner join Categories as c
on p.CategoryID = c.CategoryID
order by c.CategoryName

--Left join
select  c.CompanyName, o.OrderID from Customers as c
left outer join
orders as o
on c.CustomerID = o.CustomerID
where o.OrderID is null



