--COMANDOS DDL LENGUAJE DE DEFINICION DE DATOS
create database ejercicio1
use ejercicio1
go
create schema pokemones
go
create table pokemones.especie(
cod_especie int primary key identity,
nombre varchar(50) unique,
descripcion varchar(50)
)
go
create table pokemones.pokemon(
cod_pokemon int primary key identity,
nombre varchar(50),
fec_nac date,
tamanio numeric(19,2),
evoluciones int
)
go
create table pokemones.especie_pokemon(
cod_especie int foreign key references pokemones.especie(cod_especie),
cod_pokemon int foreign key references pokemones.pokemon(cod_pokemon)
)

--COMANDO DE MANIPULACION DE DATOS
--insert - crear
--update - modificar
--delete - eliminar
--select - mostrar
select * from pokemones.especie
insert into pokemones.especie values('electricos','descripcion')
delete pokemones.especie where cod_especie = 2
update pokemones.especie set nombre = 'electrico'
where cod_especie = 8

--llenando registros en las 3 tablas 
insert into pokemones.especie values('normal','descripcion') --11
insert into pokemones.especie values('volador','descripcion') --12
insert into pokemones.pokemon values('chansey',getdate(),10,3) --1
insert into pokemones.pokemon values('pidgeoto',getdate(),10,3)  --2
select * from pokemones.pokemon
insert into pokemones.especie_pokemon values(11,1)
insert into pokemones.especie_pokemon values(11,2)
insert into pokemones.especie_pokemon values(12,2)
select * from pokemones.especie_pokemon

