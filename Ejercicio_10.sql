create database ejercicio_10
go
create table Cliente(
cod_cliente int primary key identity,
paterno varchar(40) not null,
materno varchar(40) not null,
direccion varchar(100) not null,
razon_social varchar(50) not null,
ruc varchar(15) not null unique
)
go
/*
Money vs decimal
money a diferencia de decimal
es el tamaño y su presicion al
momento de realizar algún cálculo
*/
/*
Así que como vemos, el uso de Money en lugar de Decimal en SQL Server
podría devolvernos comportamientos no esperados inicialmente.

¿Debemos evitar el uso de Money en SQL Server?.
No, todo depende del contexto en el que nos encontramos y
de cómo realicemos las operaciones con Money.
*/
create table Producto(
cod_producto int primary key identity,
descripcion varchar(50),
precio_unitario money,

create table Categoria(
cod_Categoria int primary key identity,
nombre varchar(50) not null unique
)
go

