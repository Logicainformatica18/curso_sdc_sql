--COMANDOS DDL DML
--crear directorios
xp_create_subdir 'd:\colegio'
go
xp_create_subdir 'e:\colegio'
go
--crear bd configurando los archivos y sus parametros
create database Colegio
--grupo primario
on primary
(name='Colegio_01',filename='d:\colegio\Colegio_01.mdf',
size=10mb,MaxSize=10GB,filegrowth=80%),
(name='Colegio_02',filename='d:\colegio\Colegio_02.ndf',
size=10mb,MaxSize=10GB,filegrowth=80%)
-- archivo lo . transacciones
log on	(
name='Colegio_log',
filename='e:\colegio\transacciones_01.ldf',
size=10mb,
MaxSize=10GB,
filegrowth=80%
)
go
--creando esquemas
create schema personal
go
create schema ventas
go
-- COMANDOS DDL
create table personal.empleado(
cod_empleado int primary key identity,
dni char(8) unique not null,
paterno varchar(30) not null,
materno varchar(30) not null,
nombres varchar(30) not null,
fec_nac date
)
go
-- drop table personal.empleado

create table personal.contrato(
cod_contrato int primary key identity,
cod_empleado int foreign key references personal.empleado(cod_empleado),
fecha date
)
--use master
--drop database colegio
--AGREGAR UN ARCHIVO A LA BASE DE DATOS
ALTER DATABASE COLEGIO
	ADD FILE(
	NAME ='PERSONAL',
	FILENAME='d:\colegio\Colegio_03.ndf',
	SIZE=10MB,MAXSIZE=5GB,FILEGROWTH=100%
	)
	GO


	--USar la bd
	USE COLEGIO
	GO
	CREATE TABLE ALUMNO(
	COD_ALUMNO INT PRIMARY KEY,
	DNI  CHAR(8) NOT NULL,
	PATERNO VARCHAR(30) NOT NULL,
	MATERNO VARCHAR(30)NOT NULL,
	NOMBRES VARCHAR(30) NOT NULL,
	SEXO CHAR(1) CHECK  (SEXO = 'M' OR SEXO = 'F')
	)
	GO
	--
	--MODIFICAR TABLA
	ALTER TABLE ALUMNO
	ADD  FEC_NAC DATE

	GO

	--DROP TABLE ALUMNO

	-- DML   LENGUAJE DE MANIPULACION DE DATOS
	--SELECCIONAR
	SELECT *  FROM ALUMNO
	GO
	SELECT COD_ALUMNO,DNI,PATERNO,MATERNO FROM ALUMNO
	--INSERTAR
	INSERT ALUMNO(COD_ALUMNO,DNI,PATERNO,MATERNO,NOMBRES,SEXO,FEC_NAC)
	VALUES (1,'97856543','CARDENAS','AQUINO','ANTHONY','M','11-16-1992')
	GO
	-- ELIMINAR   // POR SEGURIDAD SIEMPRE VA CON UN WHERE
	DELETE FROM ALUMNO 
	WHERE COD_ALUMNO =1
	GO
	-- MODIFICAR // POR SEGURIDAD SIEMPRE VA CON UN WHERE
	UPDATE ALUMNO SET NOMBRES = 'JUAN'
	WHERE COD_ALUMNO = 1
	GO
	--RELACIONAR DOS TABLAS - FOREIGN KEY
	CREATE TABLE MATRICULA(
	COD_MATRICULA INT PRIMARY KEY IDENTITY,
	COD_ALUMNO INT,
	FOREIGN KEY (COD_ALUMNO) REFERENCES ALUMNO(COD_ALUMNO),
	FECHA DATETIME
	)
	GO
