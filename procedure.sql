#devuelve docente
DELIMITER //

CREATE   PROCEDURE devuelveDocente (IN codigo_profesor INT, IN nombre_ciclo VARCHAR(45)) 
BEGIN
 SELECT p.id AS codigo,a.nombres,a.apellidoM,a.apellidoP,t.descripcion,a.telefono,a.correo,s.nombre AS seccion,d.nombre AS departamento
	FROM profesor AS p
	INNER JOIN colaborador AS c
	ON p.id_colaborador = c.id
	INNER JOIN persona AS a
	ON c.id_persona = a.id
	INNER JOIN tipoprofesor AS t
	ON p.id_tipoProfesor = t.id
	INNER JOIN seccion AS s 
	ON s.id=p.id_seccion
	INNER JOIN departamento AS d
	ON d.id=s.id_departamento
 WHERE p.id = codigo_profesor;

END//
DELIMITER ;

#devuelve investigaciones
DELIMITER //

CREATE   PROCEDURE devuelveInvestigaciones (IN codigo_profesor INT, IN nombre_ciclo VARCHAR(45)) 
BEGIN
SELECT p.id_profesor,p.id_investigacion,i.titulo,i.resumen,e.descripcion,i.archivo FROM profesor_investigacion AS p
	INNER JOIN investigacion AS i
	ON p.id_investigacion = i.id
	INNER JOIN estadoinvestigacion AS e
	ON i.id_estadoinvestigacion = e.id
	INNER JOIN ciclo AS c
	ON c.descripcion=nombre_ciclo
WHERE p.id_profesor = codigo_profesor AND i.fecha BETWEEN c.fecha_inicio AND c.fecha_fin;

END//
DELIMITER ;


#devuelve actividades
DELIMITER //
CREATE   PROCEDURE devuelveActividades (IN codigo_profesor INT, IN nombre_ciclo VARCHAR(45)) 
BEGIN
SELECT a.id,a.nombre AS titulo,t.descripcion AS tipo,a.fecha_inicio,a.fecha_fin,e.descripcion AS estado
	FROM actividad AS a
	INNER JOIN tipoactividad AS t
	ON a.id_tipoactividad = t.id
	INNER JOIN estadoactividad AS e
	ON e.id=a.id_estadoActividad
	INNER JOIN ciclo AS c
	ON c.descripcion=nombre_ciclo
WHERE a.id_profesor=codigo_profesor AND a.fecha_inicio BETWEEN c.fecha_inicio AND c.fecha_fin;

END//
DELIMITER ;
