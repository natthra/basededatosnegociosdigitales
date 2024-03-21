--Ejercicio1 1. Realizar un SP que calcule las ventas totales hechas por cada
--empleado por año, el sp debe solicitar el nombre del empleado y un año inicial y un año final
 select*from Employees
 select*from Orders
Alter proc VentasTotalesEmpleado
@name nvarchar(20), @yearin nchar(4), @yearfin nchar(4)
as
begin
select CONCAT (FirstName,' ' ,LastName) as 'Nombre',year (o.OrderDate) as 'Año',SUM(od.UnitPrice * od.Quantity) 
from Employees as e
inner join Orders as o on e.EmployeeID = o.EmployeeID
inner join [Order Details] as od on od.OrderID = o.OrderID
WHERE
     CONCAT (FirstName,' ' ,LastName)   = @name
        AND( YEAR(o.OrderDate) BETWEEN @yearin AND @yearfin)
    GROUP BY
        CONCAT (FirstName,' ' ,LastName),
        YEAR(o.OrderDate)
    ORDER BY
        YEAR(o.OrderDate)
	end
	go

exec VentasTotalesEmpleado 'Efrain Davolio','1996', '1997'


--Ejercicio 2.  crear y  sp que Muestre el precio 
--promedio de los productos dentro de cada categoría, incluyendo solo aquellas
--categorías cuyo precio promedio de producto supere el precio enviado en el store procedure
alter proc PrecioPromedioDeProductos
@Precio decimal  (10,2)
as
begin 
Select c.CategoryName as 'Categoria', AVG (od.UnitPrice) as 'Promedio de Precio'from [Order Details] as od 
inner join Products as p on od.ProductID = p.ProductID
inner join Categories as c on c.CategoryID = p.CategoryID
group by c.CategoryName
having AVG (od.UnitPrice)> @Precio
end

go
select*from Categories

Select c.CategoryName as 'Categoria', AVG (od.UnitPrice) as 'Promedio de Precio'from [Order Details] as od 
inner join Products as p on od.ProductID = p.ProductID
inner join Categories as c on c.CategoryID = p.CategoryID
group by c.CategoryName

exec PrecioPromedioDeProductos 28