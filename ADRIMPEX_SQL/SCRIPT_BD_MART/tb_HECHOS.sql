
SELECT 
 AdrimpexMart.dbo.dim_Cliente.clienteKey,
 AdrimpexMart.dbo.dim_Empleado.empleadokey,
 AdrimpexMart.dbo.dim_Producto.productoKey,
 AdrimpexMart.dbo.dim_Proveedor.proveedorKey,
 AdrimpexMart.dbo.Dim_Sucursal.sucursalKey,
 AdrimpexMart.dbo.dim_Tiempo.tiempoKey,

  tpd.cantidad*tpd.precioUnidad AS MontoVenta
 
 FROM tb_proveedores tprov 
 INNER JOIN tb_productos tprod ON tprov.idProveedor=tprod.idProveedor
 INNER JOIN tb_pedidodeta tpd ON  tprod.idProducto=tpd.idProducto 
 INNER JOIN tb_pedidoscabe tpca ON tpd.idPedido=tpca.idPedido
 INNER JOIN tb_clientes tcli ON tpca.idCliente=tcli.idCliente
 INNER JOIN tb_empleados tbem ON tpca.idEmpleado=tbem.idEmpleado
 INNER JOIN tb_sucursal tbsu ON tpca.idSucursal=tbsu.idSucursal
 INNER JOIN AdrimpexMart.dbo.dim_Cliente ON tcli.idCliente=AdrimpexMart.dbo.dim_Cliente.clienteKey
 INNER JOIN AdrimpexMart.dbo.dim_Empleado ON tbem.idEmpleado=AdrimpexMart.dbo.dim_Empleado.empleadokey
 INNER JOIN AdrimpexMart.dbo.dim_Producto ON tprod.idProducto=AdrimpexMart.dbo.dim_Producto.productoKey
 INNER JOIN AdrimpexMart.dbo.dim_Proveedor ON tprov.idProveedor=AdrimpexMart.dbo.dim_Proveedor.proveedorKey
 INNER JOIN AdrimpexMart.dbo.Dim_Sucursal ON tbsu.idSucursal= AdrimpexMart.dbo.Dim_Sucursal.sucursalKey
 INNER JOIN AdrimpexMart.dbo.dim_Tiempo ON tpca.fechaPedido=AdrimpexMart.dbo.dim_Tiempo.pedidofecha
WHERE  tpd.cantidad*tpd.precioUnidad !=0;