--Desarrollar una sentencia SELECT que permita 
--mostrar una lista de los empleados ordenada por fecha de ingreso. Esquema HR
SELECT * FROM HR.EMPLOYEES
ORDER BY  HIRE_DATE;
--Desarrollar una sentencia SELECT para consultar los productos 
--ordenados por categoría y precio. Esquema VENTAS.
SELECT * FROM VENTAS.PRODUCTO
ORDER BY IDCAT,	PRECIO;

=========================================
--Desarrollar una sentencia SELECT que permita averiguar los 
--cursos que aún no tienen profesor. Esquema EDUCA.
SELECT * FROM educa.curso
WHERE TRIM(cur_profesor)='' OR cur_profesor IS NULL;

SELECT * FROM educa.curso
WHERE  TRIM(cur_profesor) IS NULL 
 

--Desarrollar una sentencia SELECT para consultar el ingreso 
--total de cada empleado. Esquema HR.
SELECT NOMBRE_COMPLETO,SUM(SALARIO) SALARIO
FROM
(
SELECT (LAST_NAME || ' , '|| FIRST_NAME ) NOMBRE_COMPLETO
, (SALARY + NVL(commission_pct,0)) SALARIO
FROM hr.EMPLOYEES
) a
GROUP BY NOMBRE_COMPLETO


--Desarrollar una sentencia SELECT para consultar los empleados 
--cuyos ingresos totales es menor a 8,000.00. Esquema HR.
SELECT NOMBRE_COMPLETO,SUM(SALARIO) SALARIO
FROM
(
SELECT (LAST_NAME || ' , '|| FIRST_NAME ) NOMBRE_COMPLETO
, (SALARY + NVL(commission_pct,0)) SALARIO
FROM hr.EMPLOYEES
) a
GROUP BY NOMBRE_COMPLETO
HAVING (SUM(SALARIO))<8000

--Consultar los empleados cuyo ingreso (salario + comisión)
-- supera los 3500.00. Esquema SCOTT y HR.

SELECT NOMBRE_COMPLETO,SUM(SALARIO) SALARIO
FROM
(
SELECT (LAST_NAME || ' , '|| FIRST_NAME ) NOMBRE_COMPLETO
, (SALARY + NVL(commission_pct,0)) SALARIO
FROM hr.EMPLOYEES
) a
GROUP BY NOMBRE_COMPLETO
HAVING (SUM(SALARIO))>3500

=================================================

--Desarrollar una sentencia SELECT para consultar los empleados
-- que ingresaron a la empresa un mes de Enero. Esquemas SCOTT y HR.
SELECT * FROM SCOTT.EMP
WHERE TO_CHAR(HIREDATE, 'DD/MM/YYYY') LIKE '%/01/%';

SELECT * FROM SCOTT.EMP
WHERE EXTRACT(MONTH FROM HIREDATE) = 1;

--Desarrollar una sentencia SELECT para consultar las matriculas
-- del último mes. Esquema EDUCA.

SELECT * FROM educa.MATRICULA  
WHERE rownum=1
ORDER BY MAT_FECHA DESC;

--Consultar los empleados que ingresaron a trabajar el 
--primer trimestre del año 1981. Esquema SCOTT y HR
SELECT * FROM SCOTT.EMP
WHERE HIREDATE BETWEEN 
      to_date('01/01/1981','DD/MM/YYYY') AND 
      to_date('31/03/1981','DD/MM/YYYY')
ORDER BY HIREDATE;




