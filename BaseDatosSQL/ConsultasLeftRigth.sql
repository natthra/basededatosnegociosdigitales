
-- inner join
select c.Nombre as 'Numero de Cliente', c.Nombre as 'Numero del cliente',
c.Pais as 'Pais del Cliente',
o.fechaOrder as 'Fecha de la orden',
o.fechaEntrega as 'Fecha de entrega', 
o.ClienteID as 'Foreing key de la tabla cliete'
from
Clientes as c
inner join Ordenes as o
on  c.Numcliente = o.ClienteID

--left join (La tabla izquierda siempre es la primera
-- que es en el join)
select c.Numcliente as 'Numero de Cliente', c.Nombre as 'Nombre de Cliente', c.Nombre as 'Numero del cliente',
c.Pais as 'Pais del Cliente',
o.fechaOrder as 'Fecha de la orden',
o.fechaEntrega as 'Fecha de entrega', 
o.ClienteID as 'Foreing key de la tabla cliete'
from
Clientes as c
left join Ordenes as o
on  c.Numcliente = o.ClienteID
where ClienteID is Null

--seleccioanr todos los datos de la tabla ordenes
-- y la tabla clientes utilizando un left joim
select c.Numcliente as 'Numero de Cliente', c.Nombre as 'Nombre de Cliente', c.Nombre as 'Numero del cliente',
c.Pais as 'Pais del Cliente',
o.fechaOrder as 'Fecha de la orden',
o.fechaEntrega as 'Fecha de entrega', 
o.ClienteID as 'Foreing key de la tabla cliete'
from
Ordenes as o
left join Clientes as c
on  c.Numcliente = o.ClienteID
where ClienteID is NUll


-- Right join
select c.Numcliente as 'Numero de Cliente', c.Nombre as 'Nombre de Cliente', c.Nombre as 'Numero del cliente',
c.Pais as 'Pais del Cliente',
o.fechaOrder as 'Fecha de la orden',
o.fechaEntrega as 'Fecha de entrega', 
o.ClienteID as 'Foreing key de la tabla cliete'
from
Clientes as c
right join Ordenes as o
on  c.Numcliente = o.ClienteID


--full join
select c.Numcliente as 'Numero de Cliente', c.Nombre as 'Nombre de Cliente', c.Nombre as 'Numero del cliente',
c.Pais as 'Pais del Cliente',
o.fechaOrder as 'Fecha de la orden',
o.fechaEntrega as 'Fecha de entrega', 
o.ClienteID as 'Foreing key de la tabla cliete'
from
Ordenes as o
full join Clientes as c
on  c.Numcliente = o.ClienteID

--

select o.ClienteID, nombre, pais, fechaOrder
from Ordenes as o
right join 
(select Numcliente,Nombre, Pais from Clientes) as c
on o.ClienteID = c.Numcliente