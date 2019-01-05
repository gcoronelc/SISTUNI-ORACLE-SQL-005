-- =========================================
-- 01: CREAR EL TABLESPACE
-- =========================================
-- Crear el Tablespace
CREATE TABLESPACE TBS_COMERCIAL
DATAFILE 'O:\app\TBS\DF_COMERCIAL.DBF'
SIZE 10M;

CREATE TABLESPACE TBS_COMERCIAL2
DATAFILE 'O:\app\TBS\DF_COMERCIAL2.DBF'
SIZE 10M;

-- Espacio Total en MB
SELECT 
	tablespace_name,
	round(sum(BYTES/1024/1024),0) ESPACIO_MB
FROM dba_data_files b
WHERE tablespace_name LIKE 'TBS_COM%'
GROUP BY b.tablespace_name
ORDER BY 1;

-- Espacio libre en MB
SELECT 
	tablespace_name,
	ROUND(sum(BYTES/1024/1024),0)  ESPACIO_MB
FROM dba_free_space
WHERE tablespace_name LIKE 'TBS_COM%'
GROUP BY tablespace_name
ORDER BY 1;

-- =========================================
-- 02: CREACION DEL USUARIO
-- =========================================

CREATE USER COMERAPP IDENTIFIED BY admin;

SELECT USERNAME FROM DBA_USERS
WHERE USERNAME LIKE 'COMER%';

-- =========================================
-- 03: ASIGNAR TABLESPACE AL USUARIO
-- =========================================

ALTER USER COMERAPP 
	DEFAULT TABLESPACE TBS_COMERCIAL 
	QUOTA UNLIMITED ON TBS_COMERCIAL;
	
ALTER USER COMERAPP 
  QUOTA 5M ON TBS_COMERCIAL2;	
	
SELECT USERNAME, DEFAULT_TABLESPACE 
FROM DBA_USERS
WHERE USERNAME LIKE 'COMER%';

SELECT * FROM DBA_TS_QUOTAS
WHERE USERNAME LIKE 'COMER%';

-- =========================================
-- 04: ASIGNAR PRIVILEGIOS
-- =========================================

GRANT CREATE SESSION TO COMERAPP;

GRANT CREATE TABLE TO COMERAPP;


--  CREACION DE TABLAS

/*==============================================================*/
/* Table: "Articulo"                                            */
/*==============================================================*/
create table "Articulo" (
   "articuloID"         INTEGER              not null,
   "categoriaID"        INTEGER              not null,
   "proveedorID"        INTEGER              not null,
   "descripcion"        VARCHAR2(50)         not null,
   "pu"                 NUMBER(8,2),
   "stk"                INTEGER,
   constraint PK_ARTICULO primary key ("articuloID"));


/*==============================================================*/
/* Table: "Categoria"                                           */
/*==============================================================*/
create table "Categoria" (
   "categoriaID"        INTEGER              not null,
   "descripcion"        VARCHAR2(50)         not null,
   constraint PK_CATEGORIA primary key ("categoriaID"));

/*==============================================================*/
/* Table: "Cliente"                                             */
/*==============================================================*/
create table "Cliente" (
   "clienteID"          INTEGER              not null,
   "razonSocial"        VARCHAR2(50),
   "ruc"                CHAR(11)             not null,
   "eMail"              VARCHAR2(50),
   constraint PK_CLIENTE primary key ("clienteID"));

/*==============================================================*/
/* Table: "Detalle"                                             */
/*==============================================================*/
create table "Detalle" (
   "ventaID"            INTEGER              not null,
   "articuloID"         INTEGER              not null,
   "precio"             NUMBER(8,2),
   "cant"               INTEGER,
   constraint PK_DETALLE primary key ("ventaID", "articuloID"));

/*==============================================================*/
/* Table: "Empleado"                                            */
/*==============================================================*/
create table "Empleado" (
   "empleadoID"         INTEGER              not null,
   "apellidos"          VARCHAR2(50),
   "nombre"             VARCHAR2(50),
   "dni"                CHAR(8)              not null,
   "fechaNac"           DATE,
   constraint PK_EMPLEADO primary key ("empleadoID"));

/*==============================================================*/
/* Table: "Pagoo"                                                */
/*==============================================================*/
create table "Pago" (
   "pagoID"             INTEGER              not null,
   "empleadoID"         INTEGER              not null,
   "fechaPago"          DATE                 not null,
   "descuento"          NUMBER(8,2),
   "bonificacion"       NUMBER(8,2),
   constraint PK_PAGO primary key ("pagoID"));

/*==============================================================*/
/* Table: "Proveedor"                                           */
/*==============================================================*/
create table "Proveedor" 
(
   "proveedorID"        INTEGER              not null,
   "razonSocial"        VARCHAR2(50),
   "ruc"                CHAR(11)             not null,
   "direccion"          VARCHAR2(50),
   constraint PK_PROVEEDOR primary key ("proveedorID")
);

/*==============================================================*/
/* Table: "Venta"                                               */
/*==============================================================*/
create table "Venta" 
(
   "ventaID"            INTEGER              not null,
   "clienteID"          INTEGER              not null,
   "empleadoID"         INTEGER              not null,
   "fechaVenta"         DATE,
   constraint PK_VENTA primary key ("ventaID")
);

/*==============================================================*/
/* Index: R1_FK                                                 */
/*==============================================================*/
create index R1_FK on "Articulo" (
   "categoriaID" ASC
);

/*==============================================================*/
/* Index: R2_FK                                                 */
/*==============================================================*/
create index R2_FK on "Articulo" (
   "proveedorID" ASC
);

/*==============================================================*/
/* Index: R2_FK                                                 */
/*==============================================================*/
/*create index R2_FK on "Detalle" (
   "articuloID" ASC
);
*/

/*==============================================================*/
/* Index: R2_FK2                                                */
/*==============================================================*/
create index R2_FK2 on "Detalle" (
   "ventaID" ASC
);


/*==============================================================*/
/* Index: R1_FK                                                 */
/*==============================================================*/
/*create index R1_FK on "Pago" (
   "empleadoID" ASC
);
*/


/*==============================================================*/
/* Index: R1_FK                                                 */
/*==============================================================*/
/*create index R1_FK on "Venta" (
   "clienteID" ASC
);
*/
/*==============================================================*/
/* Index: R3_FK                                                 */
/*==============================================================*/
create index R3_FK on "Venta" (
   "empleadoID" ASC
);


-- ======================================================
-- RESTRICCIONES DE TABLA ARTICULO
-- ======================================================

alter table "Articulo"
   add constraint "fk_Categoria_Articulo" foreign key ("categoriaID")
      references "Categoria" ("categoriaID");

alter table "Articulo"
   add constraint "fk_Proveedor_Articulo" foreign key ("proveedorID")
      references "Proveedor" ("proveedorID");
	  
-- ======================================================
-- RESTRICCIONES DE TABLA DETALLE
-- ======================================================

alter table "Detalle"
   add constraint "fk_Articulo_Detalle" foreign key ("articuloID")
      references "Articulo" ("articuloID");

alter table "Detalle"
   add constraint "fk_Venta_Detalle" foreign key ("ventaID")
      references "Venta" ("ventaID");

-- ======================================================
-- RESTRICCIONES DE TABLA PAGO
-- ======================================================
	  
alter table "Pago"
   add constraint "fk_Empleado_Pago" foreign key ("empleadoID")
      references "Empleado" ("empleadoID");

-- ======================================================
-- RESTRICCIONES DE TABLA VENTA
-- ======================================================	  
	  
alter table "Venta"
   add constraint "fk_Cliente_Venta" foreign key ("clienteID")
      references "Cliente" ("clienteID");

alter table "Venta"
   add constraint "fk_Empleado_Venta" foreign key ("empleadoID")
      references "Empleado" ("empleadoID");

-- OTRAS RESTRICCIONES
alter table "Articulo"
   drop constraint "fk_Categoria_Articulo";

alter table "Articulo"
   drop constraint "fk_Proveedor_Articulo";

alter table "Detalle"
   drop constraint "fk_Articulo_Detalle";

alter table "Detalle"
   drop constraint "fk_Venta_Detalle";

alter table "Pago"
   drop constraint "fk_Empleado_Pago";

alter table "Venta"
   drop constraint "fk_Cliente_Venta";

alter table "Venta"
   drop constraint "fk_Empleado_Venta";







