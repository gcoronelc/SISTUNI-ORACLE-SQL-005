
connect user/password@host:port/servicio



show parameter name

NAME            VALUE
--------------- ---------  
db_name         orcl
instance_name   orcl  
service_names   orcl


-- CREAR ESQUEMA CONTA

CREATE USER CONTA IDENTIFIED BY admin;

SELECT * FROM ALL_USERS ORDER BY 1;

DROP USER CONTA CASCADE;


GRANT dba TO CONTA;

CREATE TABLE conta.cuenta(
  cuenta VARCHAR(10),
  descripcion VARCHAR(100)
);


SELECT * FROM v$session
WHERE username = 'CONTA';


-- ESQUEMA: SCOTT

ALTER USER scott 
identified BY tiger
account unlock;


/*
CONSULTAS BASICAS
Para disfrutar en casa
http://gcoronelc.blogspot.com/2017/11/practica-de-oracle-sql.html
http://gcoronelc.blogspot.com/2018/09/oracle-sql-consultas-una-tabla.html
*/

-- Ejemplo 1

SELECT * FROM scott.emp;


-- Ejemplo 2

SELECT empno, ename FROM scott.emp;


-- Ejemplo 3

SELECT empno CODIGO, ename NOMBRE 
FROM scott.emp;


-- Ejemplo 4

SELECT 
  a.*, 
  a.SAL + NVL(a.COMM,0) "TOTAL"
FROM scott.emp a;


SELECT NVL(0,8) FROM DUAL;


-- Ejemplo 5

SELECT 
  idempleado "CODIGO",
  apellido || ', ' || nombre "NOMBRE"
FROM recursos.empleado;



-- FILTROS OPERADORES LOGICOS

-- Ejemplo 6

SELECT * FROM scott.emp
WHERE SAL > 2000;

-- Ejemplo 7

SELECT * FROM scott.emp
WHERE DEPTNO = 10;




-- OPERADORES LOGICOS
-- AND, OR, NOT

-- Ejemplo 8

SELECT * FROM scott.emp
WHERE (SAL > 2000) AND (DEPTNO = 10);


SELECT * FROM scott.emp
WHERE (SAL > 2000) OR (DEPTNO = 10);












