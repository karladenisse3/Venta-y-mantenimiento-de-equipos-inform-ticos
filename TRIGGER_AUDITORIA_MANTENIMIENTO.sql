/==============================================================/
/* Table: AUDITORIA_MANTENIMIENTO                                         */
/==============================================================/
create table AUDITORIA_MANTENIMIENTO (
   COD_AUDITORIA_MANTENIMIENTO    SERIAL                 not null,
   COD_EMPLEADO         INT4                 null,
   CLIENTE_CEDULA       INT4                 null,
   MANTENIMIENTO_FECHA_INGRESO DATE                 not null,
   MANTENIMIENTO_FECHA_SALIDA DATE                 not null,
   MANTENIMIENTO_SOLUCION CHAR(2)              not null,
   SERIE_EQUIPO         VARCHAR(100)         not null,
   MANTENIMIENTO_CONDICION VARCHAR(500)         not null,
   MANTENIMIENTO_COSTO  NUMERIC              not null,
   USUARIO_ELIMINO      VARCHAR(50)                not null,
   FECHA_ELIMINO       DATE                       not null,
   constraint PK_AUDITORIA_MANTENIMIENTO primary key (COD_AUDITORIA_MANTENIMIENTO)
);

create or replace function TRIGGER_AUDITORIA_MANTENIMIENTO() 
returns trigger as 
$$
begin
	insert into AUDITORIA_MANTENIMIENTO(COD_EMPLEADO,CLIENTE_CEDULA,
									MANTENIMIENTO_FECHA_INGRESO,
									MANTENIMIENTO_FECHA_SALIDA,
								    MANTENIMIENTO_SOLUCION,SERIE_EQUIPO,
									MANTENIMIENTO_CONDICION,MANTENIMIENTO_COSTO,
									USUARIO_ELIMINO,FECHA_ELIMINO) 
									values(old.COD_EMPLEADO, old.CLIENTE_CEDULA, old.MANTENIMIENTO_FECHA_INGRESO,
										  old.MANTENIMIENTO_FECHA_SALIDA, old.MANTENIMIENTO_SOLUCION,
										  old.SERIE_EQUIPO, old.MANTENIMIENTO_CONDICION, old.MANTENIMIENTO_COSTO, 
										  current_user,current_date);
	return new;
end;
$$ language plpgsql;

create trigger TRIGGER_AUDITORIA_MANTENIMIENTO before delete
on MANTENIMIENTO for each row
execute procedure TRIGGER_AUDITORIA_MANTENIMIENTO();