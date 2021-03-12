/*==============================================================*/
/* Table: ARTICULO                                             */
/*==============================================================*/
create table ARTICULO (
   COD_ARTICULO        INT4                 not null,
   ARTICULOS_NOMBRE     VARCHAR(100)         not null,
   ARTICULOS_CANTIDAD   INT4                 not null,
   ARTICULOS_PRECIO     NUMERIC              not null,
   constraint PK_ARTICULO primary key (COD_ARTICULO)
);

/*==============================================================*/
/* Table: CLIENTE                                              */
/*==============================================================*/
create table CLIENTE (
   CLIENTE_CEDULA       INT4                 not null,
   CLIENTE_NOMBRES      VARCHAR(30)          not null,
   CLIENTES_APELLIDOS   VARCHAR(30)          not null,
   CLIENTE_DIRECCION    VARCHAR(100)         not null,
   CLIENTE_TELEFONO     INT4                 not null,
   constraint PK_CLIENTE primary key (CLIENTE_CEDULA)
);

/*==============================================================*/
/* Table: DETALLE_LOTE                                          */
/*==============================================================*/
create table DETALLE_LOTE (
   COD_DETALLE_LOTE     INT4                 not null,
   COD_LOTE             INT4                 not null,
   COD_ARTICULO        INT4                 not null,
   constraint PK_DETALLE_LOTE primary key (COD_DETALLE_LOTE)
);

/*==============================================================*/
/* Table: DETALLE_MANTENIMIENTO                                 */
/*==============================================================*/
create table DETALLE_MANTENIMIENTO (
   COD_DETALLE_MANTENIMIENTO INT4                 not null,
   COD_ARTICULO        INT4                 not null,
   COD_MANTENIMIENTO    INT4                 not null,
   constraint PK_DETALLE_MANTENIMIENTO primary key (COD_DETALLE_MANTENIMIENTO)
);

/*==============================================================*/
/* Table: DETALLE_VENTA                                         */
/*==============================================================*/
create table DETALLE_VENTA (
   COD_DETALLE_VENTA    INT4                 not null,
   COD_ARTICULO        INT4                 not null,
   COD_CANTIDAD 		INT4				 not null,
   COD_VENTA           INT4                 not null,
   constraint PK_DETALLE_VENTA primary key (COD_DETALLE_VENTA)
);

/*==============================================================*/
/* Table: EMPLEADO                                             */
/*==============================================================*/
create table EMPLEADO (
   COD_EMPLEADO         INT4                 not null,
   COD_TIPO             INT4                 null,
   EMPLEADO_CEDULA      INT4                 not null,
   EMPLEADO_NOMBRES     VARCHAR(30)          not null,
   EMPLEADO_APELLIDOS   VARCHAR(30)          not null,
   EMPLEADO_GENERO      VARCHAR(10)          not null,
   EMPLEADO_DIRECCION   VARCHAR(100)         not null,
   EMPLEADO_TELEFONO    INT4                 not null,
   EMPLEADO_FECHA_NACIMIENTO DATE                 not null,
   EMPLEADO_NACIONALIDAD VARCHAR(30)          not null,
   constraint PK_EMPLEADO primary key (COD_EMPLEADO)
);

/*==============================================================*/
/* Table: LOTE                                                  */
/*==============================================================*/
create table LOTE (
   COD_LOTE             INT4                 not null,
   COD_PROVEEDOR      INT4                 null,
   LOTE_FECHA_INGRESO   DATE                 not null,
   LOTE_COSTO           NUMERIC              not null,
   constraint PK_LOTE primary key (COD_LOTE)
);

/*==============================================================*/
/* Table: MANTENIMIENTO                                         */
/*==============================================================*/
create table MANTENIMIENTO (
   COD_MANTENIMIENTO    INT4                 not null,
   COD_EMPLEADO         INT4                 null,
   CLIENTE_CEDULA       INT4                 null,
   MANTENIMIENTO_FECHA_INGRESO DATE                 not null,
   MANTENIMIENTO_FECHA_SALIDA DATE                 not null,
   MANTENIMIENTO_SOLUCION CHAR(2)              not null,
   SERIE_EQUIPO         VARCHAR(100)         not null,
   MANTENIMIENTO_CONDICION VARCHAR(500)         not null,
   MANTENIMIENTO_COSTO  NUMERIC              not null,
   constraint PK_MANTENIMIENTO primary key (COD_MANTENIMIENTO)
);

/*==============================================================*/
/* Table: PROVEEDOR                                           */
/*==============================================================*/
create table PROVEEDOR (
   COD_PROVEEDOR      INT4                 not null,
   PROVEEDORES_NOMBRE   VARCHAR(50)          not null,
   PROVEEDORES_PAIS     VARCHAR(30)          not null,
   PROVEEDORES_CIUDAD   VARCHAR(30)          not null,
   PROVEEDORES_DIRECCION VARCHAR(100)         not null,
   PROVEEDORES_TELEFONO INT4                 not null,
   PROVEEDORES_CORREO   VARCHAR(50)          not null,
   constraint PK_PROVEEDOR primary key (COD_PROVEEDOR)
);

/*==============================================================*/
/* Table: TIPO_EMPLEADO                                         */
/*==============================================================*/
create table TIPO_EMPLEADO (
   COD_TIPO             INT4                 not null,
   NOMBRE               VARCHAR(30)          not null,
   constraint PK_TIPO_EMPLEADO primary key (COD_TIPO)
);

/*==============================================================*/
/* Table: VENTA                                                */
/*==============================================================*/
create table VENTA (
   COD_VENTA           INT4                 not null,
   CLIENTE_CEDULA       INT4                 null,
   COD_EMPLEADO         INT4                 null,
   VENTAS_TOTAL         NUMERIC              not null,
   constraint PK_VENTA primary key (COD_VENTA)
);

alter table DETALLE_LOTE
   add constraint FK_DETALLE__DETALLE_L_LOTE foreign key (COD_LOTE)
      references LOTE (COD_LOTE)
      on delete restrict on update restrict;

alter table DETALLE_LOTE
   add constraint FK_DETALLE__DETALLE_L_ARTICULO foreign key (COD_ARTICULO)
      references ARTICULO (COD_ARTICULO)
      on delete restrict on update restrict;

alter table DETALLE_MANTENIMIENTO
   add constraint FK_DETALLE__DETALLE_M_ARTICULO foreign key (COD_ARTICULO)
      references ARTICULO (COD_ARTICULO)
      on delete restrict on update restrict;

alter table DETALLE_MANTENIMIENTO
   add constraint FK_DETALLE__DETALLE_M_MANTENIM foreign key (COD_MANTENIMIENTO)
      references MANTENIMIENTO (COD_MANTENIMIENTO)
      on delete restrict on update restrict;

alter table DETALLE_VENTA
   add constraint FK_DETALLE__DETALLE_V_ARTICULO foreign key (COD_ARTICULO)
      references ARTICULO (COD_ARTICULO)
      on delete restrict on update restrict;

alter table DETALLE_VENTA
   add constraint FK_DETALLE__DETALLE_V_VENTA foreign key (COD_VENTA)
      references VENTA (COD_VENTA)
      on delete restrict on update restrict;

alter table EMPLEADO
   add constraint FK_EMPLEADO_RELATIONS_TIPO_EMP foreign key (COD_TIPO)
      references TIPO_EMPLEADO (COD_TIPO)
      on delete restrict on update restrict;

alter table LOTE
   add constraint FK_LOTE_RELATIONS_PROVEEDO foreign key (COD_PROVEEDOR)
      references PROVEEDOR (COD_PROVEEDOR)
      on delete restrict on update restrict;

alter table MANTENIMIENTO
   add constraint FK_MANTENIM_RELATIONS_EMPLEADO foreign key (COD_EMPLEADO)
      references EMPLEADO (COD_EMPLEADO)
      on delete restrict on update restrict;

alter table MANTENIMIENTO
   add constraint FK_MANTENIM_RELATIONS_CLIENTE foreign key (CLIENTE_CEDULA)
      references CLIENTE (CLIENTE_CEDULA)
      on delete restrict on update restrict;

alter table VENTA
   add constraint FK_VENTA_RELATIONS_CLIENTE foreign key (CLIENTE_CEDULA)
      references CLIENTE (CLIENTE_CEDULA)
      on delete restrict on update restrict;

alter table VENTA
   add constraint FK_VENTA_RELATIONS_EMPLEADO foreign key (COD_EMPLEADO)
      references EMPLEADO (COD_EMPLEADO)
      on delete restrict on update restrict;

