
--CREACION DE BD ADRIMPEX
CREATE DATABASE Adrimpex ON
PRIMARY(NAME='Adrimpex', FILENAME='C:\ADRIMPEX_BI\ADRIMPEX_BD\Adrimpext.mdf', SIZE=10MB, MAXSIZE=UNLIMITED, FILEGROWTH=30%),


 FILEGROUP FG1 DEFAULT (NAME='AdrimpexFG1_Dat1', FILENAME ='C:\ADRIMPEX_BI\ADRIMPEX_BD\Adrimpex_1.ndf',SIZE=5MB, MAXSIZE=UNLIMITED, FILEGROWTH=20%),

                         (NAME='AdrimpexFG1_Dat2', FILENAME ='C:\ADRIMPEX_BI\ADRIMPEX_BD\Adrimpex_2.ndf',SIZE=5MB, MAXSIZE=UNLIMITED, FILEGROWTH=20%),

						 (NAME='AdrimpexFG1_Dat3', FILENAME ='C:\ADRIMPEX_BI\ADRIMPEX_BD\Adrimpex_3.ndf',SIZE=5MB, MAXSIZE=UNLIMITED, FILEGROWTH=20%)

LOG ON (NAME='Adrimpex_Log', FILENAME ='C:\ADRIMPEX_BI\ADRIMPEX_BD\AdrimpexLog.ldf',SIZE=3MB, MAXSIZE=UNLIMITED, FILEGROWTH=20%)

GO
USE Adrimpex

GO
-- CREACION DE TABLAS PARA ADRIMPEX
CREATE TABLE tb_categorias(
 idCategoria int identity(1,1),
 nombreCategoria varchar(100),
 descripcion varchar(100),

 -- CONSTRAINT PRIMARY KEY
 CONSTRAINT Categoria_idCategoria_pk PRIMARY KEY(idCategoria));

 GO

 CREATE TABLE tb_proveedores
 (idProveedor int identity(1,1),
  nombreCia varchar(100),
  nombreContacto varchar(100),
  cargoContaco varchar(100),
  direccion varchar(100),
  telefono varchar(50),
  
  --CONSTRAINT
  CONSTRAINT proveedores_idproveedor_pk PRIMARY KEY(idProveedor));
 
  GO

  CREATE TABLE tb_productos(
  idProducto int identity(1,1),
  nombreProducto varchar(100),
  idProveedor int,
  idCategoria int,
  umedida varchar(100),
  precioUnitario float,
  unidadesExistencia int,
  
  --CONSTRAINT 
  CONSTRAINT productos_idproducto_pk PRIMARY KEY(idProducto),
  CONSTRAINT productos_idProveedor_fk FOREIGN KEY(idProveedor) REFERENCES tb_proveedores(idProveedor),
  CONSTRAINT productos_idCategoria_fk FOREIGN KEY(idCategoria) REFERENCES tb_Categorias(idCategoria));

  CREATE TABLE tb_empleados
  (idEmpleado int identity(1,1),
   apeEmpleado varchar(100),
   nomEmpleado varchar(100),
   dirEmpleado varchar(100),
   idDistrito int,
   fonoEmpleado varchar(50),
   cargoEmpleado varchar(50),
   fechaNacer date,

   --CONSTRAINT
   CONSTRAINT empleados_idEmpleado_pk PRIMARY KEY(idEmpleado));

   CREATE TABLE tb_clientes
   (idCliente int identity(1,1),
   nombreCia varchar(100),
   Direccion varchar(100),
   idpais int,
   Telefono varchar(50),
   
   --CONSTRAINT
   CONSTRAINT cliente_idCliente_pk PRIMARY KEY(idCliente));


   CREATE TABLE tb_pais(
   idPais int identity(1,1),
   nombrePais varchar(100),

   --CONSTRAINT
   CONSTRAINT pais_idpais_pk PRIMARY KEY(idPais));

   CREATE TABLE tb_sucursal(
   idSucursal int identity(1,1),
   nomSucursal varchar(100),
   ciudad varchar(100),
   provincia varchar(100),
   direccion varchar(100),
   telefono varchar(50),
   idPais int,
   
   --CONSTRAINT
   CONSTRAINT sucursal_idsucursal_pk PRIMARY KEY(idSucursal),
   CONSTRAINT sucursal_idPais_fk FOREIGN KEY(idPais) REFERENCES tb_pais(idPais));
   

   CREATE TABLE tb_pedidoscabe(
   idPedido int identity(1,1),
   idCliente int,
   idEmpleado int,
   idSucursal int,
   fechaPedido date,
   fechaEnvio date,
   fechaEntrega date,
   envio varchar(100),
   cargo varchar(100),
   destinatario varchar(100),
   direDestinatario varchar(100),
   ciuDestinatario varchar(100),
   regiDestinatario varchar(100),
   codPostal varchar(100),
   paisDestinatario varchar(100),
   --CONSTRAINT
   CONSTRAINT pedidocabe_idPedido_pk PRIMARY KEY(idPedido),
   CONSTRAINT pedidocabe_idCliente_pk FOREIGN KEY(idCliente) REFERENCES tb_clientes(idCliente),
   CONSTRAINT pedidocabe_idEmpleado_pk FOREIGN KEY(idEmpleado) REFERENCES tb_empleados(idEmpleado),
   CONSTRAINT pedidocabe_idSucursal_pk FOREIGN KEY(idSucursal) REFERENCES tb_sucursal(idSucursal));


   CREATE TABLE tb_pedidodeta(
   idPedido int,
   idProducto int,
   precioUnidad float,
   cantidad int,
   descripcion varchar(100),
   --CONSTRAINT
   CONSTRAINT pedidosdeta_idPedido_fk FOREIGN KEY(idPedido) REFERENCES tb_pedidoscabe(idPedido),
   CONSTRAINT pedidosdeta_idProducto_fk FOREIGN KEY(idProducto) REFERENCES tb_productos(idProducto));


