-- Consulta: Raul
-- Eliminar un usuario

CREATE USER gustavo identified BY admin;

SELECT * FROM all_users WHERE USERNAME = 'GUSTAVO';

DROP USER GUSTAVO;

SELECT * FROM all_users WHERE USERNAME = 'GUSTAVO';

-- Eliminar Ventas

SELECT * FROM all_users WHERE USERNAME = 'VENTAS';

DROP USER VENTAS CASCADE;

SELECT * FROM all_users WHERE USERNAME = 'VENTAS';


-- Sentencia: UPDATE
-- Actualizar datos de una o mas filas.

/*
Ejemplo 1
El empleado SMITH su salario será de 1000,
y su comision sera de 100.
Código: 7369
*/

UPDATE scott.emp
SET SAL = 1000, COMM = 100
WHERE EMPNO = 7369;

COMMIT;

/*
Ejemplo 2
Todos los empleados de ventas tienen un 
aumento del 10% en su salario.
*/

SELECT * FROM scott.DEPT;

-- Codigo: 30

SELECT * FROM scott.EMP;

SELECT * FROM scott.EMP WHERE DEPTNO = 30;

UPDATE scott.emp
SET SAL = SAL * (1.10)
WHERE DEPTNO = 30;

SELECT * FROM scott.EMP WHERE DEPTNO = 30;

COMMIT;


-- Sentencia DELETE
-- Eliminar filas

/*
Ejemplo 3
Eliminar a SMITH.
Código: 7369
*/

SELECT * FROM scott.emp WHERE EMPNO=7369;

DELETE FROM scott.emp
WHERE EMPNO=7369;

SELECT * FROM scott.emp WHERE EMPNO=7369;

ROLLBACK;


/*
TRANSACCIONES
*/

/*
Iniciar Transacción
- Insert
- Update
- Delete
- Select For Update ( solo se debe usar dentro de una TX)
*/

SELECT * FROM scott.emp FOR update;

UPDATE scott.emp SET SAL = 0;


ROLLBACK;


SELECT USERNAME, SID, SERIAL#, BLOCKING_SESSION
FROM v$session
WHERE username IN ('SCOTT','SYSTEM');



ROLLBACK;

SELECT * FROM eureka.cuenta WHERE CHR_CUENCODIGO = '00100002';

SELECT * FROM eureka.movimiento WHERE CHR_CUENCODIGO = '00100002';



