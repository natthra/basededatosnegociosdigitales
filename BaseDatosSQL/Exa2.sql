--1

Select c.CompanyName as 'Nombre del cliente',
min (o.OrderDate)as 'Fecha Primera compre',
sum (od.Quantity*od.UnitPrice) as 'Total de compras del cliente' 
from Orders as o
inner join [Order Details] as od
on o.OrderID = od.OrderID
inner join Customers 
as c  on c.CustomerID = o.CustomerID
group by c.CompanyName
having sum (od.Quantity*od.UnitPrice) >1000
order by  'Total de compras del cliente'  desc

--2 
Select p.ProductName as 'Producto', p.UnitsInStock, sum (od.Quantity * od.UnitPrice) from 
Products as p
inner join [Order Details] as od
on od.ProductID = p.ProductID 
group by  p.ProductName, p.UnitsInStock
having COUNT (od.OrderID)>0
order by 2 desc 

--3
--Examen
Select concat (e.FirstName,' ', e.LastName) as 'Nombre', Count(distinct od.ProductID) as 'Total '
from  [Order Details] as od
inner join Products as p 
on od.ProductID = p.ProductID
inner join Orders as o 
on o.OrderID = od.OrderID
inner join Employees as e
on e.EmployeeID = o.EmployeeID
group by concat (e.FirstName,' ', e.LastName)
having count(o.OrderID)>50

--Seleccionar el total de ordenes realiszdas  por los
--empleado, mostrar solamente los que han vendido mas de 50
--orden
Select concat (e.FirstName,' ', e.LastName) as 'Nombre', Count(*) as 'Total 'from  [Order Details] as od
inner join Products as p 
on od.ProductID = p.ProductID
inner join Orders as o 
on o.OrderID = od.OrderID
inner join Employees as e
on e.EmployeeID = o.EmployeeID
group by concat (e.FirstName,' ', e.LastName)
having count(o.OrderID)>50

-----
select count (distinct od.ProductID) as 'Total'from
Orders as o inner join Employees as e
on e.EmployeeID = o.EmployeeID 
inner join [Order Details] as od 
on od.OrderID = o.OrderID 
where concat (e.FirstName, ' ', e.LastName) = 'Andrew Fuller'

--4
Select p.ProductName, count (od.ProductID)from [Order Details] 
as od
right join Products as p on od.ProductID = P.ProductID
group by p.ProductName
having count (od.ProductID) >=1
Order by 2 desc

--5

Select concat (e.FirstName,' ', e.LastName) as 'Nombre', 
sum (od.UnitPrice*od.Quantity ) as 'Total '
from Orders as o inner join Employees as e
on e.EmployeeID = o.EmployeeID 
inner join [Order Details] as od
on od.OrderID = o.OrderID 
where Year (o.OrderDate) = '1996'
group by concat (e.FirstName,' ', e.LastName)
order by 2 desc
