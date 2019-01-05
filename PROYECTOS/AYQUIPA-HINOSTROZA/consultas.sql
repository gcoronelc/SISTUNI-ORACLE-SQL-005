
--CONSULTAS
--1. Se necesita saber cuánto es la planilla por cada local. 
--Se tiene que mostar el nombre del Local y el monto de la planilla.


select loc.NOMLOC Nombre_Local,SUM(per.sueldo) PLANILLA 
from practitiendas.personal per 
join practitiendas.locales loc
on per.codloc=loc.codloc  GROUP BY loc.NOMLOC ORDER BY 2; 



--2. Se necesita saber cuantos clientes se cuenta por distrito.
-- Se tiene que mostar el nombre del distrito y la cantidad de clientes.


select dis.NOMDIS Distrito,count(1) Cantidad 
from practitiendas.clientes cli 
join practitiendas.distritos dis
on cli.coddis=dis.coddis  GROUP BY dis.NOMDIS ORDER BY 2; 


--3. Se necesita saber cuantos clientes se tiene por distrito 
--y por sexo.


select dis.NOMDIS Distrito,cli.SEXO Sexo, count(1) Cantidad 
from practitiendas.clientes cli 
join practitiendas.distritos dis
on cli.coddis=dis.coddis  
GROUP BY dis.NOMDIS,cli.SEXO ORDER BY 1,2; 


--4. Se desea conocer cual es el sueldo promedio del personal
-- por sexo

select SEXO,AVG(practitiendas.personal.sueldo) SUELDO_PROMEDIO 
from PRACTITIENDAS.personal GROUP BY SEXO;


--5. Se desea conocer cual es el sueldo promedio del personal 
--por distrito y sexo


select dis.NOMDIS Distrito,pe.SEXO Sexo, AVG(sueldo) SUELDO_PROMEDIO 
from practitiendas.personal pe
join practitiendas.distritos dis
on pe.coddis=dis.coddis  GROUP BY dis.NOMDIS,pe.SEXO order by 3;


--6 DISMINUIR EN 5% LOS PRECIOS DE LOS PRODUCTOS DE LAS 
--MARCAS M001, M003 Y M005

UPDATE PRACTITIENDAS.PRODUCTOS SET PRECIO= PRECIO*0.95
WHERE CODMAR IN('M001','M003','M005');
SELECT * FROM PRACTITIENDAS.PRODUCTOS;
ROLLBACK;

--7 LISTAR NOMBRE DE MARCA , NRO DE PRODUCTOS Y 
--TOTAL DE PRECIOS POR CADA MARCA ORDENADO POR NOMBRE DE MARCA ASC


SELECT NOMMAR "MARCA", NOMPROD, STOCK
FROM PRACTITIENDAS.MARCAS M,PRACTITIENDAS.PRODUCTOS P
WHERE M.CODMAR=P.CODMAR AND STOCK >250
ORDER BY 1 ASC;

--8 LISTAR NOMBRE Y PRECIO DE LOS PRODUCTOS QUE 
--CUESTAN MAS QUE EL PROMEDIO DE PRECIOS ORDENADO POR PRECIO ASC

SELECT NOMPROD "PRODUCTO", PRECIO FROM PRACTITIENDAS.PRODUCTOS
WHERE PRECIO > (SELECT AVG(PRECIO) FROM PRACTITIENDAS.PRODUCTOS);

--9 LISTAR CODIGO NOMBRE Y PRECIO DEL PRODUCTO 
--DE MAYOR Y MENOR PRECIO

SELECT CODPROD "CODIGO", NOMPROD "PRODUCTO", PRECIO FROM PRACTITIENDAS.PRODUCTOS
WHERE PRECIO IN((SELECT MAX(PRECIO) FROM PRACTITIENDAS.PRODUCTOS),(SELECT MIN(PRECIO) FROM PRACTITIENDAS.PRODUCTOS));

--10 SELECCIONAR LOS CODPROD DE LA TABLA COMP_DETALLE ORDENADA POR CODPROD ASC SIN DUPLICADOS

SELECT DISTINCT (CODPROD) FROM COMP_DETALLE ORDER BY 1 ASC;

--11 LISTAR SUMA,PROMEDIO,MAXIMO Y MINIMO DE LOS SUELDOS DEL PERSONAL

SELECT SUM (SUELDO) "SUMA S/.",AVG (SUELDO) "PROMEDIO", MAX(SUELDO) "MAXIMO",
MIN(SUELDO) "MINIMO" FROM PRACTITIENDAS.PERSONAL;

--12 LISTAR CODIGO,NOMBRE Y SUELDO DEL PERSONAL QUE GANE ENTRE 2000 Y 4000 ORDENADO POR SUELDO ASC

SELECT CODPER "CODIGO" ,NOMPER "NOMBRE",SUELDO FROM PRACTITIENDAS.PERSONAL WHERE SUELDO BETWEEN 2000 AND 4000
ORDER BY 3 ASC


--13 SE REQUIERE DETERMINAR EN QUE DISTRITOS
-- HAY MAS DE 10 CLIENTES

select dis.NOMDIS Distrito,count(1) Cantidad 
from practitiendas.clientes cli 
join practitiendas.distritos dis
on cli.coddis=dis.coddis  GROUP BY dis.NOMDIS HAVING count(1)>10 ; 


--14 De cada local, se necesita saber el o los personales con mayor sueldo.


WITH 
V1 AS (
  SELECT CODLOC, MAX(SUELDO) SUELDO_MAX
  FROM practitiendas.personal 
  GROUP BY CODLOC
)
SELECT *
FROM practitiendas.personal 
WHERE (CODLOC, sueldo) IN (
  SELECT CODLOC, SUELDO_MAX FROM V1
);


WITH 
V1 AS (
  SELECT CODLOC, MAX(SUELDO) SUELDO_MAX
  FROM practitiendas.personal
  GROUP BY CODLOC
)
SELECT e.*
FROM practitiendas.personal e
JOIN V1
ON E.CODLOC = V1.CODLOC
AND e.sueldo = V1.SUELDO_MAX;


--15 Se desea determinar las ventas por producto


select CODPROD, sum(CANTIDAD*PRECIO-DCTO) venta from practitiendas.COMP_DETALLE group by CODPROD;


--16 Se desea determinar el numero de productos por categoria


select CODCAT, COUNT(1) CANTIDAD from practitiendas.PRODUCTOS group by CODCAT;


--17 Se desea determinar el numero de productos por marca


select CODMAR, COUNT(1) CANTIDAD from practitiendas.PRODUCTOS group by CODMAR;



--18. Se desea conocer cual es la cantidad del personal por distrito y sexo


select dis.NOMDIS Distrito,pe.SEXO Sexo, count(1) Cantidad 
from practitiendas.personal pe
join practitiendas.distritos dis
on pe.coddis=dis.coddis  GROUP BY dis.NOMDIS,pe.SEXO order by 3;


--19 Se desea determinar el numero de operaciones por tipo de pago


select CODFOR, COUNT(1) CANTIDAD from practitiendas.COMP_CABECERA group by CODFOR;


--20 Se desea determinar el numero de operaciones por tipo de pago y local 

select loc.NOMLOC Local,count(1) Cantidad 
from practitiendas.COMP_CABECERA com 
join practitiendas.LOCALES loc
on com.codloc=loc.codloc  GROUP BY loc.NOMLOC ORDER BY 2; 