-- SUBCONSULTAS
-- ===============================================

/*
SUBCONSULTAS ESCALARES
Retornan una sola fila y una columna.
*/

/*
Ejemplo 1
Consultar los empleados que su salario es mayor al salario promedio.
*/

SELECT E.*, (SELECT avg(sueldo) FROM recursos.empleado) SAL_PROM
FROM recursos.EMPLEADO E
WHERE E.SUELDO > (SELECT avg(sueldo) FROM recursos.empleado);


WITH
V1 AS (
  SELECT avg(sueldo) SAL_PROM FROM recursos.empleado
)
SELECT E.*, V1.SAL_PROM
FROM recursos.EMPLEADO E
JOIN V1 ON E.SUELDO > V1.SAL_PROM;

/*
SUBCONSULTAS DE VARIAS FILAS Y VARIAS COLUMNAS
Retornan varias fila y varias columna.
*/

/*
Ejemplo 2
De cada departamento, se necesita saber el o los
empleados con mayor sueldo.
*/

SELECT *
FROM recursos.empleado 
WHERE (iddepartamento, sueldo) IN (
  SELECT IDDEPARTAMENTO, MAX(SUELDO) SUELDO_MAX
  FROM RECURSOS.EMPLEADO 
  GROUP BY IDDEPARTAMENTO
);

-- Solucion como tabla derivada

SELECT e.*
FROM recursos.empleado e
JOIN (
  SELECT IDDEPARTAMENTO, MAX(SUELDO) SUELDO_MAX
  FROM RECURSOS.EMPLEADO 
  GROUP BY IDDEPARTAMENTO
) t
ON E.IDDEPARTAMENTO = t.IDDEPARTAMENTO
AND e.sueldo = t.SUELDO_MAX;

-- APLICANDO WITH

WITH 
V1 AS (
  SELECT IDDEPARTAMENTO, MAX(SUELDO) SUELDO_MAX
  FROM RECURSOS.EMPLEADO 
  GROUP BY IDDEPARTAMENTO
)
SELECT *
FROM recursos.empleado 
WHERE (iddepartamento, sueldo) IN (
  SELECT IDDEPARTAMENTO, SUELDO_MAX FROM V1
);


WITH 
V1 AS (
  SELECT IDDEPARTAMENTO, MAX(SUELDO) SUELDO_MAX
  FROM RECURSOS.EMPLEADO 
  GROUP BY IDDEPARTAMENTO
)
SELECT e.*
FROM recursos.empleado e
JOIN V1
ON E.IDDEPARTAMENTO = V1.IDDEPARTAMENTO
AND e.sueldo = V1.SUELDO_MAX;


















