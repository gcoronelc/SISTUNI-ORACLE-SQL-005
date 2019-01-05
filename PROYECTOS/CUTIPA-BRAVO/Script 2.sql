
--01.- FUNCIONES AGREGADAS

--Desarrolle una sentencia SELECT para calcular el importe 
--de la planilla del departamento de ventas. 
--Debe incluir el sueldo y la comisión. Esquemas SCOTT y HR.
SELECT SUM ( sueldo + NVL(comision,0))as importe 
FROM RECURSOS.empleado where iddepartamento=103;

--Desarrolle una sentencia SELECT para encontrar 
--el mayor y menor sueldo en el departamento de ventas. 

SELECT min(sueldo) as menor_sueldo, MAX(sueldo) as mayor_sueldo
 FROM RECURSOS.empleado where iddepartamento=103;

--Desarrolle una sentencia SELECT para encontrar 
--el salario promedio en la empresa. Esquema EDUCA.
SELECT AVG(sueldo) as salario_promedio FROM RECURSOS.empleado;

--Se necesita saber la cantidad de empleados que 
--hay en el departamento de ventas. Esquemas SCOTT y HR.
SELECT count(*) as cant_empleados 
FROM  RECURSOS.empleado where iddepartamento=103

--Se necesita saber el importe de la planilla del departamento de ventas, con comisión y sin comisión. Esquemas SCOTT y HR.
SELECT SUM(sueldo) as sincomision , sum(sueldo+ NVL(comision,0)) as  concomision FROM  RECURSOS.empleado where iddepartamento=103;

--Del curso SQL Server Administración 
--se necesita saber la cantidad de alumnos matriculados
 --y a cuánto asciende el importe que se proyecta 
 --recaudar hasta el momento. Esquema EDUCA.
SELECT cur_matriculados AS CANT_MATRICULADOS,  
 (cur_matriculados * cur_precio) AS IMPORTE 
 FROM  EDUCA.CURSO WHERE cur_nombre='SQL Server Administración'
--SELECT   SUM (cur_matriculados * cur_precio) AS IMPORTE FROM  CURSO
 
--Se necesita saber cuál es el importe recaudado 
--hasta el momento del curso SQL Server Administración.

SELECT cur_matriculados * cur_precio AS IMPORTE FROM  EDUCA.CURSO WHERE cur_nombre='SQL Server Administración'

 

--02.- AGRUPACIÓN DE DATOS: GROUP BY

--Desarrolle una sentencia SELECT para encontrar el sueldo promedio por departamento. Esquemas SCOTT y HR.
SELECT iddepartamento, AVG(sueldo) as sueldo_promedio FROM RECURSOS.empleado 
group by iddepartamento 

--Desarrolle una sentencia SELECT 
--para encontrar el importe recaudado por curso. Esquema EDUCA.
SELECT cur_id, cur_nombre,  
 (cur_matriculados * cur_precio) AS IMPORTE FROM  EDUCA.CURSO

--Se necesita saber el sueldo máximo, sueldo mínimo y el sueldo promedio por departamento. Esquemas SCOTT y HR.
SELECT iddepartamento , MIN(sueldo) min_sueldo, MAX(sueldo) max_sueldo, AVG(sueldo) as sueldo_promedio FROM RECURSOS.empleado 
group by iddepartamento 

SELECT * FROM empleado where iddepartamento=103

--Se necesita saber cuántos empleados hay por departamento.

SELECT iddepartamento , COUNT(*) as cantidad
 FROM RECURSOS.empleado group by iddepartamento 

--Se necesita saber cuántos empleados 
--han ingreso por año en cada departamento. Esquemas SCOTT y HR.
SELECT iddepartamento , COUNT (*) cantidad,
 YEAR(fecingreso) anio FROM RECURSOS.empleado group by iddepartamento ,YEAR(fecingreso)
order by 1, 3;
--De cada departamento se necesita saber 
--la cantidad de empleados, el importe de la planilla 
--y el sueldo promedio. Esquemas SCOTT y HR.
SELECT iddepartamento , COUNT (*) cantidad_empleados,
 SUM(sueldo) as importe , AVG(sueldo) 
  promedio FROM RECURSOS.empleado 
  group by iddepartamento 

--De cada curso se necesita saber la cantidad de alumnos matriculados, el importe que se tiene proyectado recaudar y el importe recaudado por los alumnos matriculados. Esquema EDUCA.
SELECT cur_id, cur_matriculados, cur_vacantes * cur_precio AS PROYECTADO, cur_matriculados* cur_precio AS PROYECTADO_MATRICULADOS  FROM CURSO 

--De cada departamento se requiere
 --saber quién es el empleado que tiene el mayor salario. 
 Esquemas SCOTT y HR.
SELECT  E.IDDEPARTAMENTO, E.IDEMPLEADO,  MAX(SUELDO) 
FROM RECURSOS.EMPLEADO   E INNER  JOIN 
(SELECT IDDEPARTAMENTO,  MAX(SUELDO)  SALARIO  
FROM RECURSOS.EMPLEADO
 group by IDDEPARTAMENTO  ORDER BY  IDDEPARTAMENTO ) B
  ON E.IDDEPARTAMENTO=B.IDDEPARTAMENTO AND E.SUELDO=B.SALARIO
 GROUP BY  E.IDDEPARTAMENTO,E.IDEMPLEADO 
  ORDER BY  IDDEPARTAMENTO 

--De cada sucursal, se necesita saber el saldo por cada tipo de moneda. Esquema EUREKA.
 
--03.- FILTRO DE GRUPOS: HAVING
--Desarrolle una sentencia SELECT para encontrar los departamentos que tienen a lo más 3 trabajadores. Esquema HR.
SELECT IDDEPARTAMENTO, COUNT(*) AS CANTIDAD FROM RECURSOS.EMPLEADO GROUP BY IDDEPARTAMENTO HAVING COUNT(*)>=3

--Se necesita saber cuáles son los
--puestos de trabajo que tienen más de 2 empleados. 
SELECT C.IDCARGO,C.NOMBRE,  COUNT(*) AS CANTIDAD 
 FROM RECURSOS.EMPLEADO E 
 INNER JOIN  RECURSOS.CARGO C ON E.IDCARGO=C.IDCARGO 
GROUP BY C.IDCARGO, C.NOMBRE  HAVING COUNT(*)>2

--Se necesita saber cuáles son los departamentos que tienen más de 10 empleados. Esquemas SCOTT y HR.
SELECT D.IDDEPARTAMENTO,COUNT(E.IDEMPLEADO)  FROM DEPARTAMENTO  D INNER JOIN RECURSOS.EMPLEADO E ON D.IDDEPARTAMENTO=E.IDDEPARTAMENTO
GROUP BY D.IDDEPARTAMENTO  HAVING COUNT(E.IDEMPLEADO)>10

--Se necesita saber los puestos de trabajo de los 
--que solo hay un empleado en la empresa. Esquemas SCOTT y HR.
SELECT C.IDCARGO,C.NOMBRE,  COUNT(*) AS CANTIDAD  
FROM RECURSOS.EMPLEADO E INNER JOIN  RECURSOS.CARGO C 
ON E.IDCARGO=C.IDCARGO 
GROUP BY C.IDCARGO, C.NOMBRE  HAVING COUNT(*)=1

--Se necesita saber que empleados han 
--registrado menos de 5 movimientos. Esquema EUREKA.
 SELECT CHR_EMPLCODIGO ,COUNT(*) AS CANTIDAD
   FROM EUREKA.MOVIMIENTO 
   GROUP BY  CHR_EMPLCODIGO HAVING COUNT(*)<5
 
 

 