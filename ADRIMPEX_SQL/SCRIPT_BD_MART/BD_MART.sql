
--CREANDO BBDD DIMENSIONAL
CREATE DATABASE AdrimpexMart ON
PRIMARY(NAME='AdrimpexMart', FILENAME='C:\Businnes_Intelligence\ADRIMPEX_MART\AdrimpexMart.mdf', SIZE=10MB, MAXSIZE=UNLIMITED, FILEGROWTH=30%),

 FILEGROUP FG1 DEFAULT (NAME='AdrimpexMartFG1_Dat1', FILENAME ='C:\Businnes_Intelligence\ADRIMPEX_MART\AdrimpexMart_1.ndf',SIZE=5MB, MAXSIZE=UNLIMITED, FILEGROWTH=20%),

                         (NAME='AdrimpexMartFG1_Dat2', FILENAME ='C:\Businnes_Intelligence\ADRIMPEX_MART\AdrimpexMart_2.ndf',SIZE=5MB, MAXSIZE=UNLIMITED, FILEGROWTH=20%),

						 (NAME='AdrimpexMartFG1_Dat3', FILENAME ='C:\Businnes_Intelligence\ADRIMPEX_MART\AdrimpexMart_3.ndf',SIZE=5MB, MAXSIZE=UNLIMITED, FILEGROWTH=20%)

LOG ON (NAME='AdrimpexMart_Log', FILENAME ='C:\Businnes_Intelligence\ADRIMPEX_MART\AdrimpexMartLog.ldf',SIZE=3MB, MAXSIZE=UNLIMITED, FILEGROWTH=20%)

GO


USE AdrimpexMart;

GO
-- CREANDO TABLAS
CREATE TABLE Dim_Sucursal
(sucursalKey int identity(1,1),
 nombSucursal varchar(100),
 pais varchar(100),
 ciudad varchar(100),
 direccion varchar(100),
 idSucursal int,
 --CONSTRAINT
 CONSTRAINT dimSucursal_sucursalkey_pk PRIMARY KEY(sucursalKey));

 GO

 CREATE TABLE dim_Cliente(
 clienteKey int identity(1,1),
 empresa varchar(100),
 direccion varchar(100),
 idCliente int,
 --CONSTRAINT
 CONSTRAINT dimCliente_clientekey_pk PRIMARY KEY(clienteKey));

 GO

 CREATE TABLE dim_Empleado(
 empleadokey int identity(1,1),
 nombre varchar(300),
 direccion varchar(100),
 idEmpleado int,
 --CONSTRAINT
 CONSTRAINT dimEmpleado_empleadokey_pk PRIMARY KEY(empleadokey));

 GO

 CREATE TABLE dim_Producto(
 productoKey int identity(1,1),
 nombrePro varchar(100),
 Categoria varchar(100),
 idProducto int,
 --CONSTRAINT
 CONSTRAINT dimProducto_productokey_pk PRIMARY KEY(productoKey));
 
 GO

 CREATE TABLE dim_Proveedor(
 proveedorKey int identity(1,1),
 nombreProve varchar(100),
 direccionProve varchar(100),
 idProveedor int,
 --CONSTRAINT
 CONSTRAINT dimProveedor_proveedorkey_pk PRIMARY KEY(proveedorKey));


GO

CREATE TABLE dim_Tiempo(
tiempoKey int identity(1,1),
anio int,
semestre int,
trimestre int,
mes int,
NombreMes nvarchar(100),
pedidofecha date,
--CONSTRAINT
CONSTRAINT dimTiempo_tiempokey_pk PRIMARY KEY(tiempokey));

GO

CREATE TABLE Hechos_Ventas
(clienteKey int,
 empleadoKey int,
 productoKey int,
 sucursalKey int,
 proveedorKey int,
 tiempoKey int,
 montoVenta float);

