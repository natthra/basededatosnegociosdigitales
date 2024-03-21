use NORTHWND

--Sintaxis
/*
	CASE 
		WHEN condicion1 THEN resultado1
		WHEN condicion1 THEN resultado1
		WHEN condicion1 THEN resultado1
		ELSE result
	END;
*/
select*,
	CASE
		WHEN Quantity > 30 THEN 'La cantidad es mayor a 30'
		WHEN Quantity = 30 THEN 'La cantidad es 30'
		ELSE 'La cantidad esta por debajo de 30'
		END as CantidadTexto
from [Order Details]

select*,
	CASE 
	WHEN UnitsInStock = 0 THEN 'Sin Stock'
		WHEN UnitsInStock between 1 and 20 THEN 'Stock bajo'
		WHEN UnitsInStock between 21 and 50 THEN 'Stock Medio'
		WHEN UnitsInStock >= 51 and UnitsInStock <=90 THEN 'Stock Alto'
		ELSE 'Stock Maximo'
		END as 'Tipo de Stock'
from NORTHWND.dbo.Products

create database pruebacase
 use pruebacase

 create table nuevatabla (
	id int not null,
	nombre nvarchar (40) not null,
	unitprice money,
	unitsinstock smallint,
	constraint pk_nuevatabla
	primary key (id)
 )
 -- crea la estructura de una tabla en base a una consulta
select top 0 ProductID as numeroproducto,
 ProductName as descripcion, UnitPrice as Preciounitario,
 UnitsInStock as existencia
 into nuevatabla2
 from NORTHWND.dbo.Products

 select*from nuevatabla2

alter table nuevatabla2 
add constraint pk_nuevatabla2
primary key (numeroproducto)

 select ProductID as numeroproducto,
 ProductName as descripcion, UnitPrice as Preciounitario,
 UnitsInStock as existencia
 into nuevatabla3
 from NORTHWND.dbo.Products

 select*from nuevatabla2

 insert into nuevatabla2
 select 
 ProductName as descripcion, UnitPrice as Preciounitario,
 UnitsInStock as existencia
 from NORTHWND.dbo.Products

 select p.ProductID, p.ProductName, p.UnitPrice,p.UnitsInStock,
	CASE 
	WHEN UnitsInStock = 0 THEN 'Sin Stock'
		WHEN UnitsInStock between 1 and 20 THEN 'Stock bajo'
		WHEN UnitsInStock between 21 and 50 THEN 'Stock Medio'
		WHEN UnitsInStock >= 51 and UnitsInStock <=90 THEN 'Stock Alto'
		ELSE 'Stock Maximo'
		END as 'Tipo de Stock'
into tablaconcase
from NORTHWND.dbo.Products as p

select*from tablaconcase