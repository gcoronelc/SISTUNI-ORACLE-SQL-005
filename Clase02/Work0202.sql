
/*
FUNCION: COUNT
*/

-- Ejemplo 1
-- Contar fila

SELECT COUNT(*) FROM EDUCA.ALUMNO;
-- Rpta 11

SELECT COUNT(ALU_ID) FROM EDUCA.ALUMNO;
-- Rpta 11

SELECT SUM(1) FROM EDUCA.ALUMNO;
-- Rpta 11



-- Ejemplo 2
-- Contando valores no nulos de una columna

SELECT COUNT(ALU_TELEFONO) FROM EDUCA.ALUMNO;
-- Rpta 9



SELECT * 
FROM ALL_OBJECTS 
WHERE OWNER = 'EDUCA'
AND OBJECT_NAME = 'CURSO';


SELECT * 
FROM ALL_TAB_COLUMNS
WHERE OWNER = 'EDUCA'
AND TABLE_NAME = 'CURSO';

SELECT COUNT(*) 
FROM ALL_TAB_COLUMNS
WHERE OWNER = 'EDUCA'
AND TABLE_NAME = 'CURSO';


/*
GROUP BY
*/


-- Ejemplo 3

SELECT 
  IDDEPARTAMENTO, COUNT(*) EMPS
FROM RECURSOS.EMPLEADO
GROUP BY IDDEPARTAMENTO;


-- Ejemplo 4

SELECT 
  IDDEPARTAMENTO, 
  IDCARGO,
  COUNT(*) EMPS
FROM RECURSOS.EMPLEADO
GROUP BY IDDEPARTAMENTO, IDCARGO
ORDER BY 1, 2;


-- Tarea 02
-- Cuanto es el importe comprometido de 
-- los alumnos a pagar por curso.
-- Esquema: EDUCA
/*

  CURSO       IMPORTE
  --------------------------
  
  --------------------------

*/


-- TAREA PARA LA CASA
/*
Crear una consulta que permita obtener
los siguientes importes por curso:

 - Lo Planificado
 - Lo comprometido
 - Lo Recaudado

*/




