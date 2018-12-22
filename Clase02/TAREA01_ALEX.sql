
/*
OPERADOR :LIKE

Sintaxis :
campo [NOT] LIKE 'patron'

Comodines :
subrayado (_) : Un caracter
Porcentaje (%) :Una cadena

*/

-- Ejemplo 01

SELECT * FROM recursos.empleado
WHERE nombre LIKE 'G%' ;

--Ejemplo 02
SELECT * FROM recursos.empleado
WHERE nombre LIKE '_o%' ;

--Ejemplo 03( para buscar en cualquier parte de la tabla)
SELECT * FROM recursos.empleado
WHERE nombre LIKE '%ui%';

--Ejemplo 04

SELECT * FROM recursos.empleado
WHERE nombre NOT LIKE '%ui%';


/*
OPERADOR : BETWEEN

Sintaxis :
campo [NOT] BETWEEN valor1 AND valor2

*/
-- Ejemplo 06
 SELECT * FROM recursos.empleado
 ORDER BY NOMBRE;
 
 SELECT * FROM recursos.empleado
 WHERE nombre BETWEEN 'L' AND 'R'
 ORDER BY nombre;
 
 SELECT * FROM recursos.empleado
 WHERE fecingreso BETWEEN
  			  TO_DATE( '05/04/2000' , 'DD/MM/YYYY') AND 
  			  TO_DATE( '12/06/2000' , 'DD/MM/YYYY')
 ORDER BY fecingreso;

/*
OPERADOR : IN ( es para saber si pertenece al valor entre parentesis(valor1, . . .)
Sintaxis :
Campo [NOT] IN ( valor1, valor2, . . .)
*/

--Ejemplo 09

SELECT * FROM recursos.empleado
WHERE IDDEPARTAMENTO IN (102,104);
/*
--tarea 1
 Se necesita un listado de los empleados que la segunda letra de su nombre sea A u O.
 */
 
SELECT * FROM recursos.empleado
WHERE nombre LIKE '_a%'  OR  NOMBRE LIKE '_o%';
 



