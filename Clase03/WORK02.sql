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
en cada sucursal. Esquema EUREA.
*/



