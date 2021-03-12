create or replace function cursor_muestra_total() returns void as $$
declare
  registro record;
  cur_total cursor for select 
						empleado.empleado_nacionalidad as nacionalidad,
						count (mantenimiento.mantenimiento_costo) as total
						from empleado
						inner join mantenimiento on mantenimiento.cod_empleado = empleado.cod_empleado
						group by empleado.empleado_nacionalidad;
begin
  for registro in cur_total loop
	raise notice 'Nacionalidad: %, Total: %', registro.nacionalidad, registro.total;
  end loop;
end;
$$ language plpgsql;
