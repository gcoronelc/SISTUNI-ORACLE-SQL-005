
/*
1. Desarrollar una consulta para visualizar el nombre y apellido
 de un empleado en una sola columna.
*/
SELECT
	NOMBRE ||' '|| APELLIDO "NOMBRE Y APELLIDO"
	FROM EMPLEADO


/*
2. Desarrollar una consulta para conocer el nombre del Gerente general de la compañia.

*/

SELECT E.IDEMPLEADO, E.NOMBRE ||' '|| E.APELLIDO "NOMBRE Y APELLIDO", C.NOMBRE
	FROM EMPLEADO	E
	INNER JOIN CARGO	C	ON	C.IDCARGO = E.IDCARGO
	WHERE C.NOMBRE = 'Gerente General'
	

/*
3. Se necesita saber cuántos empleados existen por departamento

*/

SELECT COUNT(IDDEPARTAMENTO), IDDEPARTAMENTO 
	FROM EMPLEADO
	GROUP BY IDDEPARTAMENTO;
	
	
/*
4. Se desea conocer los empleados que pertenecen a los departamentos 102 y 105.

*/
	
SELECT * FROM EMPLEADO
	WHERE IDDEPARTAMENTO IN (102,105);


/*
5.	Se desea conocer cual fue la fecha de ingreso del primer trabajador.

*/

SELECT MIN(FECINGRESO) "FECHA DE ING 1ER TRABAJADOR"
	FROM EMPLEADO


/*
6. Se necesita saber que departamentos tienen una planilla superior a 35,000.
*/

SELECT IDDEPARTAMENTO, SUM(SUELDO)  
	FROM EMPLEADO 
	HAVING SUM(SUELDO)>35000
	GROUP BY IDDEPARTAMENTO;


/*
7. De cada departamento, se necesita saber el o los empleados con mayor sueldo.
*/

SELECT *
FROM EMPLEADO
	WHERE (IDDEPARTAMENTO, SUELDO) IN (
 	SELECT IDDEPARTAMENTO, MAX(SUELDO) SUELDO_MAX
 	FROM RECURSOS.EMPLEADO 
 	GROUP BY IDDEPARTAMENTO);


/*
8. Desarrollar una sentencia que permita consultar los empleados cuya última letra de su 
nombre es O.
*/

SELECT * FROM EMPLEADO
	WHERE NOMBRE LIKE '%o';


/*
9. Desarrollar una sentencia que permita averiguar que empleados tienen un sueldo 
mayor de 3,000.0 y menor de 10,000.00.
*/
	
SELECT*FROM EMPLEADO
	WHERE SUELDO BETWEEN 3000 AND 10000;
  
	
/*
10. Desarrollar una sentencia para consultar los empleados ordenados por Apellido y fecha de ingreso.
*/

SELECT * FROM EMPLEADO
	ORDER BY APELLIDO, FECINGRESO;
	

/*
11. Desarrollar un requerimiento que permita consultar quienes son los empleados que no tiene Jefe y ademàs se necesita 
saber el nombre del departamento al que pertenece.
*/


SELECT E.IDEMPLEADO, E.APELLIDO, E.NOMBRE, E.JEFE, D.NOMBRE "NOMB DEPARTAMENTO"
	FROM	EMPLEADO	E
	INNER JOIN	DEPARTAMENTO	D	ON D.IDDEPARTAMENTO = E.IDDEPARTAMENTO
	WHERE E.JEFE IS NULL AND D.NOMBRE LIKE'Gerencia'
	
	
/*
12. Se necesita conocer el total de empleados por departamento y por cargo.
*/

SELECT 
	IDDEPARTAMENTO, IDCARGO, COUNT(*) "TOTAL EMPLEADOS"
	FROM EMPLEADO
	GROUP BY IDDEPARTAMENTO, IDCARGO
	ORDER BY 1, 2;


/*
13. Desarrolle una sentencia para calcular el importe de la planilla de los departamentos.
*/

SELECT IDDEPARTAMENTO, ROUND(AVG(SUELDO),2) "SUELDO PROMEDIO",SUM(SUELDO) PLANILLA	
	FROM	EMPLEADO
	GROUP BY IDDEPARTAMENTO	
	ORDER BY 1;
  
  
/*
14. Se requiere conocer el departamento o departamentos que tienen mas de 5 empleados.
*/

SELECT IDDEPARTAMENTO, COUNT(1) emps
FROM EMPLEADO
GROUP BY IDDEPARTAMENTO
HAVING COUNT(1) > 5;


/*
15. Desarrolar una consulta que muestre los el nombre de empleados y su departamento.

*/
SELECT E.IDEMPLEADO, E.NOMBRE, D.NOMBRE "NOMBRE DEPART"
FROM EMPLEADO E
JOIN DEPARTAMENTO D ON E.IDDEPARTAMENTO = D.IDDEPARTAMENTO
ORDER BY 1;


/*
16. Realizar una consulta de los empleados y su jefe inmediato.

*/

SELECT E.IDEMPLEADO, E.APELLIDO,E.NOMBRE, J.NOMBRE JEFE
	FROM EMPLEADO E 
	INNER JOIN EMPLEADO J
	ON E.JEFE = J.IDEMPLEADO;
	
	
/*
17. Realizar una consulta que muestre el nombre, cargo, departamento y su direccion.

*/ 

SELECT	E.APELLIDO, E.NOMBRE, C.NOMBRE "NOMB CARGO", D.NOMBRE "NOMB DEPARTAMENTO", U.DIRECCION
	FROM	EMPLEADO	E
	INNER JOIN	CARGO C ON	C.IDCARGO = E.IDCARGO
	INNER JOIN	DEPARTAMENTO D	ON	D.IDDEPARTAMENTO = E.IDDEPARTAMENTO
	INNER JOIN	UBICACION	U	ON	U.IDUBICACION = D.IDUBICACION
	ORDER BY 1;
   
	
/*
18. Consultar los empleado donde la segunda letra de su nombre puede ser C, A y U.

*/

SELECT * FROM EMPLEADO
	WHERE SUBSTR(NOMBRE,2,1) IN ('c','a','u');

	
/*
19. Por departamento se necesita saber la cantidad de empleados, el salario mayor,
 el salario menor, el salario promedio.
*/

SELECT IDDEPARTAMENTO, COUNT(IDEMPLEADO), MAX(SUELDO), MIN(SUELDO), ROUND(AVG(SUELDO),2) 
	FROM EMPLEADO 
	GROUP BY IDDEPARTAMENTO;

	
/*
20. Desarrollar una sentencia que permita consultar el sueldo y el sueldo proyectado del 15% de cada empleado.
*/

SELECT IDEMPLEADO, APELLIDO, NOMBRE, SUELDO, SUELDO*1.15 "SUELDO PROYECTADO 15%"
	FROM EMPLEADO
   
