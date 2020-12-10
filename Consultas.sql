
/*Los 5 proveedores a los cuales más se le compran artículos.*/
select
PROVEEDORES.PROVEEDORES_NOMBRE as Proveedor,
PROVEEDORES.PROVEEDORES_PAIS as Pais,
PROVEEDORES.PROVEEDORES_CIUDAD as Ciudad,
PROVEEDORES.PROVEEDORES_DIRECCION as Direccion,
PROVEEDORES.PROVEEDORES_TELEFONO as Telefono,
PROVEEDORES.PROVEEDORES_CORREO as Correo,
sum(DETALLE_LOTE.COD_ARTICULOS) as Articulos_total
from PROVEEDORES
inner join LOTE on LOTE.COD_PROVEEDORES=PROVEEDORES.COD_PROVEEDORES
inner join DETALLE_LOTE on DETALLE_LOTE.COD_LOTE=LOTE.COD_LOTE
group by 
Proveedor,
Pais,
Ciudad,
Direccion,
Telefono,
Correo
order by sum(DETALLE_LOTE.COD_ARTICULOS) desc
fetch first 5 rows only

/*Los 5 vendedores que realizan más ventas.*/
select
EMPLEADOS.COD_EMPLEADO as Código,
EMPLEADOS.EMPLEADO_CEDULA as Cedula,
EMPLEADOS.EMPLEADO_NOMBRES as Nombres,
EMPLEADOS.EMPLEADO_APELLIDOS as Apellidos,
EMPLEADOS.EMPLEADO_GENERO as Genero,
EMPLEADOS.EMPLEADO_DIRECCION as Direccion,
EMPLEADOS.EMPLEADO_TELEFONO as Telefono,
EMPLEADOS.EMPLEADO_FECHA_NACIMIENTO as Fecha_Nacimiento,
count(VENTAS.COD_VENTAS) as Ventas_total
from EMPLEADOS
inner join VENTAS on VENTAS.COD_EMPLEADO=EMPLEADOS.COD_EMPLEADO
group by 
Código,
Cedula,
Nombres,
Apellidos,
Genero,
Direccion,
Telefono,
Fecha_Nacimiento
order by sum(VENTAS.COD_VENTAS) desc
fetch first 5 rows only

/*Los 5 técnicos que realizan más mantenimientos.*/
select
EMPLEADOS.COD_EMPLEADO as Código,
EMPLEADOS.EMPLEADO_CEDULA as Cedula,
EMPLEADOS.EMPLEADO_NOMBRES as Nombres,
EMPLEADOS.EMPLEADO_APELLIDOS as Apellidos,
EMPLEADOS.EMPLEADO_GENERO as Genero,
EMPLEADOS.EMPLEADO_DIRECCION as Direccion,
EMPLEADOS.EMPLEADO_TELEFONO as Telefono,
EMPLEADOS.EMPLEADO_FECHA_NACIMIENTO as Fecha_Nacimiento,
count(MANTENIMIENTO.COD_MANTENIMIENTO) as Mantenimientos_total
from EMPLEADOS
inner join MANTENIMIENTO on MANTENIMIENTO.COD_EMPLEADO=EMPLEADOS.COD_EMPLEADO
group by 
Código,
Cedula,
Nombres,
Apellidos,
Genero,
Direccion,
Telefono,
Fecha_Nacimiento
order by count(MANTENIMIENTO.COD_MANTENIMIENTO) desc
fetch first 5 rows only

/*Los 5 articulos mas vendidos*/
select 
ARTICULOS.COD_ARTICULOS as Código,
ARTICULOS.ARTICULOS_NOMBRE as Nombre,
ARTICULOS.ARTICULOS_CANTIDAD as Cantidad,
ARTICULOS.ARTICULOS_PRECIO as Precio,
sum(DETALLE_VENTA.COD_CANTIDAD) as Articulos_Vendidos
from ARTICULOS
inner join DETALLE_VENTA on DETALLE_VENTA.COD_ARTICULOS=ARTICULOS.COD_ARTICULOS
group by 
Código,
Nombre,
Cantidad,
Precio
order by sum(DETALLE_VENTA.COD_CANTIDAD) desc
fetch first 5 rows only
