--Practica #5

use practica4

CREATE TABLE PruebaCalculado(
id int not null identity(1,1),
nombre varchar (50),
precio decimal (10,2) not null,
existencia int not null,
importe as
(precio * existencia)
constraint pk_pruebacalculo
primary key (id)
)

select *from PruebaCalculado

insert into PruebaCalculado
values ('Chanclotas', 345, 4)