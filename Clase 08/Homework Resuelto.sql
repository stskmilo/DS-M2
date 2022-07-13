#1. ¿Cuantas carreas tiene Henry?
SELECT COUNT(*) as Carreras 
FROM carrera;

#2. ¿Cuantos alumnos hay en total?
SELECT COUNT(*) as Alumnos
FROM alumno;

#3. ¿Cuantos alumnos tiene cada cohorte?
SELECT B.codigo AS Cohorte, COUNT(*) AS Alumnos
FROM alumno A
JOIN cohorte B
ON A.id_cohorte = B.id_cohorte
GROUP BY codigo;

#4. Confecciona un listado de los alumnos ordenado por los últimos alumnos que ingresaron, con nombre y apellido en un solo campo.
SELECT 
	CONCAT(nombre,' ',apellido) AS 'Alumno', 
	fecha_ing AS 'Fecha Ingreso'
FROM alumno
ORDER BY fecha_ing DESC;

#5. ¿Cual es el nombre del primer alumno que ingreso a Henry?
SELECT nombre
FROM alumno
ORDER BY fecha_ing
LIMIT 1;

SELECT nombre
FROM alumno
WHERE fecha_ing IN (SELECT MIN(fecha_ing) FROM alumno);

#6. ¿En que fecha ingreso?
SELECT fecha_ing AS Fecha
FROM alumno
WHERE fecha_ing IN (SELECT MIN(fecha_ing) FROM alumno);

#7. ¿Cual es el nombre del ultimo alumno que ingreso a Henry?
SELECT nombre
FROM alumno
WHERE fecha_ing IN (SELECT MAX(fecha_ing) FROM alumno);

#8. La función YEAR le permite extraer el año de un campo date, utilice esta función y especifique cuantos alumnos ingresarona a Henry por año.
SELECT 
	YEAR(fecha_ing) as Anio,
    COUNT(*) as Alumnos
FROM alumno
GROUP BY Anio
ORDER BY Anio ;

#9. ¿Cuantos alumnos ingresaron por semana a henry?, indique también el año. WEEKOFYEAR()
SELECT 
	YEAR(fecha_ing) as Anio,
    WEEKOFYEAR(fecha_ing) as Semana,
    COUNT(*) as Alumnos
FROM alumno
GROUP BY Anio, Semana
ORDER BY Anio, Semana;

#10. ¿En que años ingresaron más de 20 alumnos?
SELECT 
	YEAR(fecha_ing) as Anio
FROM alumno
GROUP BY Anio
HAVING COUNT(*) > 20;

/*11. Investigue las funciones TIMESTAMPDIFF() y CURDATE(). 
¿Podría utilizarlas para saber cual es la edad de los instructores?. 
¿Como podrías verificar si la función cálcula años completos? Utiliza DATE_ADD().
*/
SELECT 
	nombre, 
    apellido, 
    TIMESTAMPDIFF(YEAR,fecha_nac,CURDATE()) AS Edad
FROM instructor;

SELECT 
	nombre, 
    apellido, 
    TIMESTAMPDIFF(YEAR,fecha_nac,CURDATE()) AS Edad,
    fecha_nac as 'Fecha Nacimiento',
    DATE_ADD(fecha_nac, INTERVAL TIMESTAMPDIFF(YEAR,fecha_nac,CURDATE()) YEAR) AS Comprobacion
FROM instructor
ORDER BY Comprobacion DESC;
# Se puede ver que aproxima, ya que por ej "Antonio Barrios" cumpliría 41 años en una fecha posterior

/*12. Cálcula:<br>
            - La edad de cada alumno.<br>
            - La edad promedio de los alumnos de henry.<br>
            - La edad promedio de los alumnos de cada cohorte.<br>
*/
SELECT 
	nombre,
    apellido,
	TIMESTAMPDIFF(YEAR,fecha_nac,CURDATE()) AS Edad
FROM alumno;

SELECT
	AVG(TIMESTAMPDIFF(YEAR,fecha_nac,CURDATE())) as 'Edad Promedio'
FROM alumno;

SELECT
	id_cohorte as Cohorte,
	AVG(TIMESTAMPDIFF(YEAR,fecha_nac,CURDATE())) as 'Edad Promedio'
FROM alumno
GROUP BY Cohorte;

#13. Elabora un listado de los alumnos que superan la edad promedio de Henry.

SELECT 
	nombre,
    apellido,
	TIMESTAMPDIFF(YEAR,fecha_nac,CURDATE()) AS Edad
FROM alumno
HAVING Edad > (SELECT AVG(TIMESTAMPDIFF(YEAR,fecha_nac,CURDATE())) FROM alumno);