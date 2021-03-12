create or replace function Procedimiento_almacenado(Integer) returns void as $$
declare
  registro record;
  cursor_pa cursor for select
						empleado.cod_empleado as Codigo,
						(empleado.empleado_nombres || ' ' || empleado.empleado_apellidos) as Nombre,
						articulo.articulos_nombre as Articulo_usado_Mantenimiento
						from empleado
						inner join mantenimiento on mantenimiento.cod_empleado = empleado.cod_empleado
						inner join detalle_mantenimiento on detalle_mantenimiento.cod_mantenimiento = mantenimiento.cod_mantenimiento
						inner join articulo on articulo.cod_articulo = detalle_mantenimiento.cod_articulo
						where empleado.cod_empleado = $1
						group by Codigo, Nombre, Articulo_usado_Mantenimiento;
begin
  for registro in cursor_pa loop
	raise notice 'Codigo: %, Nombre: %, Articulo_usado_Mantenimiento: %', registro.Codigo, registro.Nombre, registro.Articulo_usado_Mantenimiento;
  end loop;
end;
$$ language plpgsql;


