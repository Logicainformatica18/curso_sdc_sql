create database ejercicio1
go
create table Laboratorio(
cod_Laboratorio int primary key,
descripcion varchar(50) not null unique
)
go

create table Computadora(
cod_Computadora int primary key,
cod_Laboratorio int,
foreign key (cod_Laboratorio) references Laboratorio(cod_Laboratorio),
descripcion varchar(50) not null unique,
componentes varchar(50)
)
go