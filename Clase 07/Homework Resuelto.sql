-- select * from cohorte;

/* 2 
No se sabe con certeza el lanzamiento de las cohortes N° 1245 y N° 1246, 
se solicita que las elimine de la tabla.
*/
DELETE FROM cohorte 
WHERE id_cohorte = 1245 OR id_cohorte = 1246 ;

/* 3 
Se ha decidido retrasar el comienzo de la cohorte N°1243, 
por lo que la nueva fecha de inicio será el 16/05. 
Se le solicita modificar la fecha de inicio de esos alumnos.
*/

UPDATE cohorte 
SET fecha_inicio = '2022-05-16'
WHERE id_cohorte = 1243;
SELECT * FROM cohorte;

/* 4
El alumno N° 165 solicito el cambio de su Apellido por “Ramirez”.
*/
UPDATE alumno
SET apellido = 'Ramirez'
WHERE id_alumno = 165;
SELECT * FROM alumno;

/* 5
El área de Learning le solicita un listado de alumnos de la Cohorte N°1243 que incluya la fecha de ingreso.
*/
SELECT nombre, apellido, fecha_ing
FROM alumno
WHERE id_cohorte = 1243;

/* 6
Como parte de un programa de actualización, el área de People le solicita un listado de los instructores que dictan la carrera de Full Stack Developer.
*/
SELECT 
	A.id_instructor as ID, 
    nombre as Nombre, 
    apellido as Apellido
FROM instructor A
LEFT JOIN cohorte B
ON A.id_instructor = B.id_instructor
WHERE B.codigo like 'FT-%'
GROUP BY ID;

/* 7
Se desea saber que alumnos formaron parte de la cohorte N° 1235. Elabore un listado.
*/
SELECT id_alumno, nombre, apellido
FROM alumno
WHERE id_cohorte = 1235;

/* 8
Del listado anterior se desea saber quienes ingresaron en el año 2019.
*/
SELECT id_alumno, nombre, apellido
FROM alumno
WHERE id_cohorte = 1235 AND YEAR(fecha_ing) = 2019;

/* 9
La siguiente consulta permite acceder a datos de otras tablas 
y devolver un listado con la carrera a la cual pertenece cada alumno:
*/
SELECT A.id_alumno, A.nombre, A.apellido, C.nombre
FROM alumno A
INNER JOIN cohorte B
ON A.id_cohorte = B.id_cohorte
INNER JOIN carrera C
ON B.id_carrera = C.id_carrera;