
-- HAVING
-- ========================================
/*
Filtrar Grupos.
Se debe utilizar junto con GROUP BY.
Se utilizan las mismas funciones que se han utilizado para resumir datos.
*/

/*
Ejemplo 01
Departamentos que tienen mas de 5 empleados.
*/
SELECT *
FROM recursos.empleado;


SELECT IDDEPARTAMENTO, count(*) emps
FROM recursos.empleado
GROUP BY IDDEPARTAMENTO;

SELECT IDDEPARTAMENTO, count(1) emps
FROM recursos.empleado
GROUP BY IDDEPARTAMENTO
HAVING count(1) > 5;

/*
Tarea 1
El departamento que tiene la mayor cantidad
de empleados.
*/

WITH
V1 AS (
  SELECT IDDEPARTAMENTO, count(1) EMPS
  FROM recursos.empleado
  GROUP BY IDDEPARTAMENTO
),
V2 AS (
  SELECT MAX(EMPS) EMPS_MAX
  FROM V1
),
V3 AS (
  SELECT IDDEPARTAMENTO, EMPS
  FROM V1 JOIN V2 
  ON V1.EMPS = V2.EMPS_MAX
)
SELECT D.*, V3.EMPS 
FROM RECURSOS.DEPARTAMENTO D
JOIN V3 
ON D.IDDEPARTAMENTO = V3.IDDEPARTAMENTO;




