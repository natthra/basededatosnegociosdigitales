--Crear un SP que permitre insertar registro en la tabla customers
Select*from Customers

Alter proc InsetarRegistroCustomers
@ID nchar (5), @ComapnyName nvarchar (40),@ContactName nvarchar(30), @ContacTitle nvarchar(30),
@Addres nvarchar(60),@City nvarchar (15), @Region nvarchar (15), @PostalCode nvarchar (10), @Country nvarchar (15),
@Phone nvarchar (24), @Fax nvarchar (24)
as 
begin 
Insert Into Customers (CustomerID,CompanyName,ContactName,ContactTitle,[Address],City,Region,PostalCode,Country,Phone,Fax)
values (@ID,@ComapnyName,@ContactName,@ContacTitle,@Addres,@City, @Region, @PostalCode, @Country,@Phone , @Fax )
end
go
	
exec InsetarRegistroCustomers  @ID = 'ZALOJ',@ComapnyName = 'ZaragozaAlcante',@ContactName= 'Pepito', @ContacTitle ='Sales Parte' ,
@Addres = 'Amarito 45' ,@City= 'Huehuetoca', @Region = 'HS', @PostalCode = '54680', @Country = 'Mexico',
@Phone = '55 34 81 12 21', @Fax = '32 45 78 90'

select*from Customers
--Crear un SP que permite eliminar registro en la tabla customers, por CustormeID
Create proc EliminarRegistroCustomer
@ID nchar (5)
as
begin
Delete from  Customers
Where CustomerID = @ID
end 
go

exec EliminarRegistroCustomer 'ZALOJ'
--Crear un sp que permite eliminar un producto de una orden dada
alter proc EliminarProducto
@id int, @pid int
as
begin
delete from [Order Details]
where @id = OrderID and @pid = ProductID
end
go

exec EliminarProducto '10248', '42'
select*from [Order Details]
--Crear un sp que permita eliminar un producto de una orden, y modificar el stock (unitstock del producto)
select*from Products
Select*from [Order Details]
order by ProductId 
Create proc EliminarModificar
@ ID int, @OrID int
as 
begin 
declare @Cantidad int 
select @Cantidad = Quantity from [Order Details]
where OrderID = @OrID and ProductID = @ID
--Update
Update Products
	set UnitsInStock = UnitsInStock - @Cantidad
	where ProductID = @ID
--Delete
Delete from [Order Details]
where OrderID = @OrID and ProductID = @ID
end
go 

exec EliminarModificar @OrID= 10294, @ID=1


