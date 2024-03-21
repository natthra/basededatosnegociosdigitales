--1
Select p.ProductName as 'Nombre del Producto', (od.Quantity * od.UnitPrice)
as 'Importe' from [Order Details]
as od inner join Products as p
on p.ProductID = od.ProductID 
inner join Orders as o on o.OrderID = od.OrderID
where year(o.OrderDate) = '1977'
order by 2



--2
