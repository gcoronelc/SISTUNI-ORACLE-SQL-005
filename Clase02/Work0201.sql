/*
OPERADOR: LIKE

Sintaxis:

 campo [NOT] LIKE 'patron'

Comodines:

  subrayado (_): Un caracter
  Porcentaje (%): Una cadena
  
*/

-- Ejemplo 01

SELECT * FROM recursos.empleado
WHERE nombre LIKE 'G%';


-- Ejemplo 02

SELECT * FROM recursos.empleado
WHERE nombre LIKE '_o%';


-- Ejemplo 03

SELECT * FROM recursos.empleado
WHERE nombre LIKE '%o';


-- Ejemplo 03

SELECT * FROM recursos.empleado
WHERE nombre LIKE '%ui%';


-- Ejemplo 04

SELECT * FROM recursos.empleado
WHERE nombre LIKE '%ui%';

-- Ejemplo 05

SELECT * FROM recursos.empleado
WHERE nombre NOT LIKE '%o';



/*
OPERADOR: BETWEEN

Sintaxis:

Campo [NOT] BETWEEN valor1 AND valor2 

*/

-- Ejemplo 06

SELECT * FROM recursos.empleado
WHERE iddepartamento BETWEEN 102 AND 104;

-- Ejemplo 07

SELECT * FROM recursos.empleado
ORDER BY NOMBRE;

SELECT * FROM recursos.empleado
WHERE nombre BETWEEN 'L' AND 'Ru'
ORDER BY nombre;


-- Ejemplo 08

SELECT * FROM recursos.empleado
ORDER BY fecingreso;

SELECT * FROM recursos.empleado
WHERE fecingreso BETWEEN 
      to_date('05/04/2000','DD/MM/YYYY') AND 
      to_date('13/06/2000','DD/MM/YYYY')
ORDER BY fecingreso;



/*
OPERADOR: IN

Sintaxis:

Campo [NOT] IN ( valor1, valor2, ... ) 

*/


-- Ejemplo 09

SELECT * FROM recursos.empleado
WHERE IDDEPARTAMENTO IN (102,104);

/*
Tarea 1

Se necesita un listado de los empleados que
la segunda letra de su nombre sea A u O.
*/

SELECT * FROM recursos.empleado
WHERE SUBSTR(NOMBRE,2,1) IN ('a','u','o');


/*
FUNCION: SUBSTR
*/

SELECT SUBSTR('ORACLE',3,2) FROM DUAL;


SELECT SUBSTR('ORACLE',-2) FROM DUAL;

/*
OPERADOR: IS NULL

SINTAXIS:

  CAMPO IS [NOT] NULL

*/

create table SCOTT.demo( algo varchar2(50) );

insert into SCOTT.demo values ('Gustavo');
insert into SCOTT.demo values ('');

COMMIT;

select * from SCOTT.demo;



-- Ejemplo 10

SELECT * FROM recursos.empleado
WHERE TELEFONO IS NULL;



-- Ejemplo 11

SELECT * FROM recursos.empleado
WHERE COMISION IS NULL OR COMISION = 0;


/*
  Funcion: NVL
*/


-- Ejemplo 12

SELECT emp.*, sueldo + NVL(comision,0) TOTAL
FROM recursos.empleado emp;


/*
  Funcion: NVL2
*/

-- Ejemplo 12

SELECT 
  emp.*, 
  NVL2(comision,sueldo + comision, sueldo) TOTAL
FROM recursos.empleado emp;


/*

EXPRESIONES: CASE

*/

-- Ejemplo 12

SELECT 
  CASE 4 
    WHEN 1 THEN 'UNO' 
    WHEN 2 THEN 'DOS'
    WHEN 3 THEN 'TRES'
    ELSE 'NO SE'
  END NUMERO
FROM DUAL;

-- Ejemplo 13

SELECT 
  MAT.*, 
  CASE MAT_CUOTAS 
    WHEN 1 THEN 'BIEN, ASEGURANDO TU FUTURO' 
    WHEN 2 THEN 'NO TE OLVIDES DE TU SEGUNDA CUOTA'
    WHEN 3 THEN 'ASEGURA LOS PAGOS, NECESITAMOS TU PLATA'
    ELSE 'QUE PASO, PAGA PUES.'
  END MENSAJE
FROM EDUCA.MATRICULA MAT;



-- Ejemplo 14

SELECT 
  MAT.*, 
  CASE MAT_CUOTAS 
    WHEN 1 THEN 'BIEN, ASEGURANDO TU FUTURO' 
    WHEN 2 THEN 'NO TE OLVIDES DE TU SEGUNDA CUOTA'
    WHEN 3 THEN 'ASEGURA LOS PAGOS, NECESITAMOS TU PLATA'
    ELSE 'QUE PASO, PAGA PUES.'
  END MENSAJE,
  CASE
    WHEN MAT_NOTA >= 14 THEN 'APROBADO'
    WHEN MAT_NOTA >= 10 THEN 'ASISTENTE'
    ELSE 'SIGUE INTENTANDO'
  END CONDICION
FROM EDUCA.MATRICULA MAT;


/*
   CLAUDULA: WITH
*/

ALTER TABLE EDUCA.MATRICULA ADD MAT_NOTA2 NUMBER(5,2)   
   
      
WITH V1 AS (
  SELECT 
    ABC.*, 
    CASE 
      WHEN ABC.MAT_NOTA2 > ABC.MAT_NOTA 
      THEN ABC.MAT_NOTA2 
      ELSE ABC.MAT_NOTA 
    END LA_NOTA
  FROM EDUCA.MATRICULA ABC
)
SELECT 
  MAT.*, 
  CASE MAT_CUOTAS 
    WHEN 1 THEN 'BIEN, ASEGURANDO TU FUTURO' 
    WHEN 2 THEN 'NO TE OLVIDES DE TU SEGUNDA CUOTA'
    WHEN 3 THEN 'ASEGURA LOS PAGOS, NECESITAMOS TU PLATA'
    ELSE 'QUE PASO, PAGA PUES.'
  END MENSAJE,
  CASE
    WHEN LA_NOTA >= 14 THEN 'APROBADO'
    WHEN LA_NOTA >= 10 THEN 'ASISTENTE'
    ELSE 'SIGUE INTENTANDO'
  END CONDICION
FROM V1 MAT;

