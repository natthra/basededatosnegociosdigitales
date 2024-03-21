
--SP CON PARAMETRO DE DE SALIDA 

Declare @resultado int = 0
declare @valor int = 10 
set @resultado = @valor + 10
print ('El resultado es:'+cast (@resultado as varchar(10)))


--Sp
create or alter proc  Sumade10
@valor int =10-- <---Parametro de entrada
as
Declare @resultado int = 0 --Declaracion de variable
set @resultado = @valor + 10 --suma
print ('El resultado es:'+cast (@resultado as varchar(10)))

exec Sumade10
exec Sumade10 @valor = 30

--SP2
create or alter proc sumade102
@valor int, @resultado int output
as
	set @resultado = @valor + 10

declare @result int
exec sumade102 @valor = 50, @resultado = @result output
print ('El resultado es:'+cast (@result as varchar(10)))

--

create or alter proc sumade103
@suma int output, @resta int output,@valor1 int, @valor2 int 
as
	set @suma = @valor1 + @valor2
	set  @resta = @valor1 - @valor2


declare  @resultSuma int
declare  @resultRest int
exec  sumade103 @valor1 = 50, @valor2 = 60, @suma = @resultSuma output, @resta = @resultRest output
print ('El resultado de la suma:'+cast (@resultSuma as varchar(10)) + '  '+ 'El resultado de la suma:'+cast (@resultRest as varchar(10)))