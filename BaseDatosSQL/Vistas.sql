-- Vistas
create view VistaConsulta1
as 
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

select * from VistaConsulta1
where [Nombre del cliente] = 'Vaffeljernet'

select sum ([Total de compras del cliente] ) as total from VistaConsulta1
where year ([Fecha Primera compre]) = '1997'

---2
create view VistaConsulta2
as
Select p.ProductName as 'Producto', p.UnitsInStock as 'Unidades en Stock', sum (od.Quantity * od.UnitPrice) as 'Importe' from 
Products as p
inner join [Order Details] as od
on od.ProductID = p.ProductID 
group by  p.ProductName, p.UnitsInStock
having COUNT (od.OrderID)>0

select * from VistaConsulta2

---3
create view VistaConsulta3
as
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

select*from VistaConsulta3

--4 
create view VistasConsulta4
as
Select p.ProductName as 'Nombre del Producto', count (od.ProductID) as 'Total de Productos'from [Order Details] 
as od
right join Products as p on od.ProductID = P.ProductID
group by p.ProductName
having count (od.ProductID) >=1

select*from VistasConsulta4

--5 
create view VistasConsulta5
as
Select concat (e.FirstName,' ', e.LastName) as 'Nombre', 
sum (od.UnitPrice*od.Quantity ) as 'Total '
from Orders as o inner join Employees as e
on e.EmployeeID = o.EmployeeID 
inner join [Order Details] as od
on od.OrderID = o.OrderID 
where Year (o.OrderDate) = '1996'
group by concat (e.FirstName,' ', e.LastName)

select*from VistasConsulta5

--6
Create view VistasConsulta6
as
Select concat (e.FirstName,' ', e.LastName) as 'Nombre', Count(*) as 'Total 'from  [Order Details] as od
inner join Products as p 
on od.ProductID = p.ProductID
inner join Orders as o 
on o.OrderID = od.OrderID
inner join Employees as e
on e.EmployeeID = o.EmployeeID
group by concat (e.FirstName,' ', e.LastName)
having count(o.OrderID)>50


select*from VistasConsulta6