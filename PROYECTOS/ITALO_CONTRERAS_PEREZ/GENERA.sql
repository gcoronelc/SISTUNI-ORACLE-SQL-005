CREATE TABLE AUTOR
(
	cautor               CHAR(3) NOT NULL ,
	nautor               VARCHAR2(100) NULL 
);





ALTER TABLE AUTOR
	ADD CONSTRAINT  XPKAUTOR PRIMARY KEY (cautor);



CREATE TABLE AUTORxLIBRO
(
	clibro               CHAR(7) NOT NULL ,
	cautor               CHAR(3) NOT NULL 
);





ALTER TABLE AUTORxLIBRO
	ADD CONSTRAINT  XPKAUTORxLIBRO PRIMARY KEY (clibro,cautor);



CREATE TABLE BIBLIOTECA
(
	cbiblioteca          CHAR(3) NOT NULL ,
	nbiblioteca          VARCHAR2(100) NULL ,
	dbiblioteca          VARCHAR2(100) NULL ,
	ubigeo               VARCHAR2(100) NULL 
);







ALTER TABLE BIBLIOTECA
	ADD CONSTRAINT  XPKBIBLIOTECA PRIMARY KEY (cbiblioteca);



CREATE TABLE BIBLIOTECAxLIBRO
(
	stock                NUMERIC NULL ,
	cbiblioteca          CHAR(3) NOT NULL ,
	clibro               CHAR(7) NOT NULL ,
	stockmin             NUMERIC NULL 
);







ALTER TABLE BIBLIOTECAxLIBRO
	ADD CONSTRAINT  XPKBIBLIOTECAxLIBRO PRIMARY KEY (cbiblioteca,clibro);



CREATE TABLE EDITORIAL
(
	ceditorial           CHAR(3) NOT NULL ,
	neditorial           VARCHAR2(100) NULL 
);





ALTER TABLE EDITORIAL
	ADD CONSTRAINT  XPKEDITORIAL PRIMARY KEY (ceditorial);



CREATE TABLE EJEMPLAR
(
	cejemplar            CHAR(10) NOT NULL ,
	destado              VARCHAR2(15) NULL ,
	clibro               CHAR(7) NOT NULL ,
	cubigeo              CHAR(1) NOT NULL 
);




ALTER TABLE EJEMPLAR
	ADD CONSTRAINT  XPKEJEMPLAR PRIMARY KEY (cejemplar);



CREATE TABLE EMPLEADO
(
	cempleado            CHAR(5) NOT NULL ,
	nempleado            VARCHAR2(100) NULL ,
	telefempleado        CHAR(9) NULL ,
	cbiblioteca          CHAR(3) NOT NULL 
);






ALTER TABLE EMPLEADO
	ADD CONSTRAINT  XPKEMPLEADO PRIMARY KEY (cempleado);



CREATE TABLE LIBRO
(
	clibro               CHAR(7) NOT NULL ,
	titlibro             VARCHAR2(50) NULL ,
	isbnlibro            CHAR(8) NULL ,
	numpaginas           NUMERIC NULL ,
	ceditorial           CHAR(3) NOT NULL ,
	cproveedor           CHAR(3) NOT NULL 
);





ALTER TABLE LIBRO
	ADD CONSTRAINT  XPKLIBRO PRIMARY KEY (clibro);



CREATE TABLE ORDENDECOMPRA
(
	secuencialoc         CHAR(7) NOT NULL ,
	fecha                DATE NULL ,
	cantidad             NUMERIC NULL ,
	preclibro            NUMERIC(3,1) NULL ,
	clibro               CHAR(7) NOT NULL 
);





ALTER TABLE ORDENDECOMPRA
	ADD CONSTRAINT  XPKORDENDECOMPRA PRIMARY KEY (secuencialoc);



CREATE TABLE PRESTAMO
(
	cprestamo            CHAR(12) NOT NULL ,
	cusuario             CHAR(7) NOT NULL ,
	cejemplar            CHAR(10) NOT NULL ,
	cempleado            CHAR(5) NOT NULL ,
	fecprestamo          CHAR(8) ,
	fecdevolucion        CHAR(8) 
);




ALTER TABLE PRESTAMO
	ADD CONSTRAINT  XPKPRÉSTAMO PRIMARY KEY (cprestamo);



CREATE TABLE PROVEEDOR
(
	cproveedor           CHAR(3) NOT NULL ,
	nproveedor           VARCHAR(100) NULL ,
	dirproveedor         VARCHAR2(100) NULL 
);






ALTER TABLE PROVEEDOR
	ADD CONSTRAINT  XPKPROVEEDOR PRIMARY KEY (cproveedor);



CREATE TABLE RANKING
(
	cranking             CHAR(3) NOT NULL ,
	clibro               CHAR(7) NOT NULL 
);







ALTER TABLE RANKING
	ADD CONSTRAINT  XPKRANKING PRIMARY KEY (cranking);



CREATE TABLE SANCION
(
	csancion             CHAR(2) NOT NULL ,
	cprestamo            CHAR(12) NOT NULL ,
	dsancion             VARCHAR2(100) NULL 
);







ALTER TABLE SANCION
	ADD CONSTRAINT  XPKSANCIÓN PRIMARY KEY (csancion);



CREATE TABLE UBICACION
(
	cubigeo              CHAR(1) NOT NULL ,
	dubigeo              VARCHAR2(100) NULL 
);







ALTER TABLE UBICACION
	ADD CONSTRAINT  XPKUBICACION PRIMARY KEY (cubigeo);



CREATE TABLE USUARIO
(
	cusuario             CHAR(7) NOT NULL ,
	nusuario             VARCHAR2(100) NULL ,
	dirusuario           VARCHAR2(100) NULL ,
	telefusuario         CHAR(9) NULL 
);






ALTER TABLE USUARIO
	ADD CONSTRAINT  XPKUSUARIO PRIMARY KEY (cusuario);



ALTER TABLE AUTORxLIBRO
	ADD (CONSTRAINT R_7 FOREIGN KEY (clibro) REFERENCES LIBRO (clibro));



ALTER TABLE AUTORxLIBRO
	ADD (CONSTRAINT R_8 FOREIGN KEY (cautor) REFERENCES AUTOR (cautor));



ALTER TABLE BIBLIOTECAxLIBRO
	ADD (CONSTRAINT R_4 FOREIGN KEY (cbiblioteca) REFERENCES BIBLIOTECA (cbiblioteca));



ALTER TABLE BIBLIOTECAxLIBRO
	ADD (CONSTRAINT R_5 FOREIGN KEY (clibro) REFERENCES LIBRO (clibro));



ALTER TABLE EJEMPLAR
	ADD (CONSTRAINT R_10 FOREIGN KEY (clibro) REFERENCES LIBRO (clibro));



ALTER TABLE EJEMPLAR
	ADD (CONSTRAINT R_11 FOREIGN KEY (cubigeo) REFERENCES UBICACION (cubigeo));



ALTER TABLE EMPLEADO
	ADD (CONSTRAINT R_12 FOREIGN KEY (cbiblioteca) REFERENCES BIBLIOTECA (cbiblioteca));



ALTER TABLE LIBRO
	ADD (CONSTRAINT R_6 FOREIGN KEY (ceditorial) REFERENCES EDITORIAL (ceditorial));



ALTER TABLE LIBRO
	ADD (CONSTRAINT R_17 FOREIGN KEY (cproveedor) REFERENCES PROVEEDOR (cproveedor));



ALTER TABLE ORDENDECOMPRA
	ADD (CONSTRAINT R_18 FOREIGN KEY (clibro) REFERENCES LIBRO (clibro));



ALTER TABLE PRESTAMO
	ADD (CONSTRAINT R_13 FOREIGN KEY (cusuario) REFERENCES USUARIO (cusuario));



ALTER TABLE PRESTAMO
	ADD (CONSTRAINT R_14 FOREIGN KEY (cejemplar) REFERENCES EJEMPLAR (cejemplar));



ALTER TABLE PRESTAMO
	ADD (CONSTRAINT R_15 FOREIGN KEY (cempleado) REFERENCES EMPLEADO (cempleado));



ALTER TABLE RANKING
	ADD (CONSTRAINT R_9 FOREIGN KEY (clibro) REFERENCES LIBRO (clibro));



ALTER TABLE SANCION
	ADD (CONSTRAINT R_16 FOREIGN KEY (cprestamo) REFERENCES PRESTAMO (cprestamo));