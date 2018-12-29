-- CONSULTAS MULTI-TABLAS

/*
Ejemplo 01
Consultar los empleados y su nombre de departamento
*/

SELECT *
FROM recursos.EMPLEADO emp
JOIN recursos.DEPARTAMENTO dep
ON emp.IDDEPARTAMENTO = dep.IDDEPARTAMENTO;

SELECT count(*)
FROM recursos.EMPLEADO;


SELECT dep.IDDEPARTAMENTO, dep.NOMBRE, count(1) emps
FROM recursos.EMPLEADO emp
JOIN recursos.DEPARTAMENTO dep
ON emp.IDDEPARTAMENTO = dep.IDDEPARTAMENTO
GROUP BY dep.IDDEPARTAMENTO, dep.NOMBRE;

/*
Ejemplo 02
Consultar los empleados con su nombre de departamento
y nombre de puesto de trabajo
*/

SELECT *
FROM recursos.EMPLEADO emp
JOIN recursos.DEPARTAMENTO dep
ON emp.IDDEPARTAMENTO = dep.IDDEPARTAMENTO
JOIN recursos.cargo car
ON emp.IDCARGO = car.IDCARGO;


SELECT count(*)
FROM recursos.EMPLEADO;


SELECT 
  dep.NOMBRE DEPARTAMENTO,
  car.NOMBRE CARGO,
  COUNT(1) EMPS
FROM recursos.EMPLEADO emp
JOIN recursos.DEPARTAMENTO dep
ON emp.IDDEPARTAMENTO = dep.IDDEPARTAMENTO
JOIN recursos.cargo car
ON emp.IDCARGO = car.IDCARGO
GROUP BY dep.NOMBRE, car.NOMBRE
ORDER BY 1, 2;

/*
Tarea 02
Ne necesita saber la cantidad de cuentas y su saldo por moneda,
en cada sucursal. Esquema EUREKA.
En el resultado debe aparecer el nombre de la sucursal y 
el nombre de la moneda.
*/


/*
LEFT JOIN 
Muestra tambien las filas que no se combinan de 
la tabla de la izquierda.
*/

/*
Ejemplo 03
*/

SELECT *
FROM recursos.DEPARTAMENTO dep
LEFT JOIN recursos.EMPLEADO emp
ON dep.IDDEPARTAMENTO = emp.IDDEPARTAMENTO
ORDER BY 4 DESC;


/*
RIGHT JOIN
Ejemplo 04
*/

INSERT INTO SCOTT.EMP(EMPNO, ENAME) VALUES(7777,'GUSTAVO');

COMMIT;

SELECT *
FROM SCOTT.DEPT DEP
RIGHT JOIN SCOTT.EMP emp
ON DEP.DEPTNO = emp.DEPTNO
ORDER BY 1 DESC;

/*
FULL JOIN
Ejemplo 05
*/

SELECT *
FROM SCOTT.DEPT DEP
FULL JOIN SCOTT.EMP emp
ON DEP.DEPTNO = emp.DEPTNO
ORDER BY 1 DESC;


/*
CROSS JOIN
Ejemplo 06
*/

SELECT COUNT(1) FROM SCOTT.DEPT;
-- 4 FILAS

SELECT COUNT(1) FROM SCOTT.EMP;
-- 15 FILAS

SELECT *
FROM SCOTT.DEPT DEP
CROSS JOIN SCOTT.EMP emp;
-- 4 * 15 = 60 FILAS


-- NATURAL JOIN
SELECT *
FROM SCOTT.DEPT DEP
NATURAL JOIN SCOTT.EMP emp
ORDER BY 1 DESC;

-- JOIN USING
SELECT *
FROM SCOTT.DEPT DEP
JOIN SCOTT.EMP emp
USING ( DEPTNO )
ORDER BY 1 DESC;

/*
Combinaciones basadas en reglas de negocio
*/

/*
Ejemplo 07
Se necesita saber el sueldo de cada empleado
y su grado. Esquema SCOTT.
*/

SELECT * FROM SCOTT.SALGRADE;

SELECT *
FROM SCOTT.EMP E
JOIN SCOTT.SALGRADE G
ON E.SAL BETWEEN G.LOSAL AND G.HISAL;

/*
Tablas Auto-Referenciadas
*/

/*
Ejemplo 08
Hacer una consulta de los empleados y su jefe inmediato.
*/

SELECT 
  EMP.IDEMPLEADO,
  EMP.APELLIDO,
  EMP.NOMBRE,
  JEFE.IDEMPLEADO || ' ' || JEFE.NOMBRE JEFE
FROM RECURSOS.EMPLEADO EMP 
JOIN RECURSOS.EMPLEADO JEFE
ON EMP.JEFE = JEFE.IDEMPLEADO;








