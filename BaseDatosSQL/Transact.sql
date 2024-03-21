Declare @numero int
SET @numero = 10
	if @numero > 5
	begin 
		Print ('El numero es mayor a 5')
	end
	else 
	begin
		print ('El numero es menor a igual a 5 ')
	end

--Realizar codigo transact para determinar si una persona tiene la edad para beber alcohol
--El codigo debe tner una variable que determina la edad minimo permita y otro variable
--con la edad de la persona.
--Comparar si la persona tiene la edad minima permitida.
--Mostrando un Mensaje 
--'Edad permitida de lo controrio 'Edad no permitida'




Declare @Edad int, @Tomar int
set @Tomar = 17
set @Edad = 20
if @Tomar >= @Edad
begin 
	print ('Tiene la edad minima permitida')
end
	else
	print('No tiene la edad permitida')


--Soliciat una evaluacion >=90 -> Imprimir "A"
--							>= 80 -> Imprimir "B"
--								>=70 -> Imprimir "C"
--									Imprimir "F"


Declare @Calificacion int 
Set @Calificacion = 90
	if @Calificacion >= 90  
begin 
	print ('A')
end
	else
	if @Calificacion >= 80 
begin 
	print ('B')
end
	else
if @Calificacion >= 70 
begin 
	print ('C')
end
	else
	print('F')

--Solicitar un salario > 4000 ->Calculat el 20 % >= 5000 -> Calcula el 30% -> < 4000 -> aumento del 0%

Declare @Salario int 
Set @Salario = 4000

if @Salario >= 4000 and @Salario <= 4999
begin
	print ( 'El Aumento es de '+ cast((@Salario*.20)as varchar (20)))
	end
else 
	if @Salario >= 5000
begin
	print ( 'El Aumento es de '+ cast((@Salario*.30)as varchar (20)))
	end
else 
if @Salario < 4000
begin
	print ( 'El Aumento es de '+ cast((@Salario*.0)as varchar (20)))

	end
--Generar un sp en donde se compare si un producto tiene mas de 100 unidades en Stock, incrementar su precio
-- en va 10% de lo contrario incrementar en 20 % 
-- Utilizar la bd Nortwinth

select*from Products

Alter proc IncrementoPrecioStokc
@Idp int
as
begin
	Declare @Cantidad int, @Precio int

Select @Cantidad = UnitsInStock, @Precio = UnitPrice from Products 
where @Idp = ProductID

if @Cantidad > 100 
	 begin
	 print ( 'El Aumento es de '+ cast((@Precio*.10)as varchar (20)))

		Update Products
	set UnitPrice = Unitprice + @Precio*.10
	where ProductID = @Idp
	
	 end
else 
if @Cantidad < 100 
	 begin
	 print ( 'El Aumento es de '+ cast((@Precio*.20)as varchar (20)))

	 Update Products
	set UnitPrice = Unitprice + @Precio*.20
	where ProductID = @Idp
	
end
end
go 

exec IncrementoPrecioStokc  6
select*from Products