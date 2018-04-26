DROP procedure IF EXISTS `cursoXcicloXprofesor`;
DELIMITER $$
CREATE PROCEDURE `cursoXcicloXprofesor`(in codProf int,in cicloP varchar(45),in tipoP varchar(45))
BEGIN
	SELECT
		c.codigo as codigo, c.nombre as nombre,h.codigo as horario,
		f.nombre as unidad,c.creditos as creditos, c.horasDictado as horas
	from 
		curso c, horario h, facultad f, tipo_curso tp, curso_ciclo cc, horario_profesor hp,
		ciclo cl
	where
		hp.id_profesor= codProf and cl.descripcion like cicloP and 
		tp.descripcion like tipoP and  hp.id_horario = h.id
		and h.id_curso_ciclo = cc.id and cc.id_ciclo = cl.id
		and cc.id_curso = c.id and tp.id = c.id_tipoCurso
		and c.id_facultad = f.id;
END$$
DELIMITER ;


DROP procedure IF EXISTS `devuelveActividades`;
DELIMITER $$
CREATE PROCEDURE `devuelveActividades`(IN codigo_profesor INT, IN nombre_ciclo VARCHAR(45))
BEGIN
SELECT a.id,a.nombre AS titulo,t.descripcion AS tipo,a.fecha_inicio,a.fecha_fin,e.descripcion AS estado
	FROM actividad AS a
	INNER JOIN tipo_actividad AS t
	ON a.id_tipoactividad = t.id
	INNER JOIN estado_actividad AS e
	ON e.id=a.id_estadoActividad
	INNER JOIN ciclo AS c
	ON c.descripcion=nombre_ciclo
WHERE a.id_profesor=codigo_profesor AND a.fecha_inicio BETWEEN c.fecha_inicio AND c.fecha_fin;
END$$
DELIMITER ;

DROP procedure IF EXISTS `devuelveDocente`;
DELIMITER $$
CREATE PROCEDURE `devuelveDocente`(IN codigo_profesor INT, IN nombre_ciclo VARCHAR(45))
BEGIN
 SELECT p.id AS codigo,a.nombres,a.apellidoM,a.apellidoP,t.descripcion,a.telefono,a.correo,s.nombre AS seccion,d.nombre AS departamento
	FROM profesor AS p
	INNER JOIN colaborador AS c
	ON p.id_colaborador = c.id
	INNER JOIN persona AS a
	ON c.id_persona = a.id
	INNER JOIN tipo_profesor AS t
	ON p.id_tipoProfesor = t.id
	INNER JOIN seccion AS s 
	ON s.id=p.id_seccion
	INNER JOIN departamento AS d
	ON d.id=s.id_departamento
 WHERE p.id = codigo_profesor;
END$$
DELIMITER ;


DROP procedure IF EXISTS `devuelveInvestigaciones`;
DELIMITER $$
CREATE PROCEDURE `devuelveInvestigaciones`(IN codigo_profesor INT, IN nombre_ciclo VARCHAR(45))
BEGIN
SELECT p.id_profesor,p.id_investigacion,i.titulo,i.resumen,e.descripcion,i.archivo FROM profesor_investigacion AS p
	INNER JOIN investigacion AS i
	ON p.id_investigacion = i.id
	INNER JOIN estado_investigacion AS e
	ON i.id_estadoinvestigacion = e.id
	INNER JOIN ciclo AS c
	ON c.descripcion=nombre_ciclo
WHERE p.id_profesor = codigo_profesor AND i.fecha BETWEEN c.fecha_inicio AND c.fecha_fin;
END$$
DELIMITER ;


DROP procedure IF EXISTS `encuesta_comentarios`;
DELIMITER $$
CREATE PROCEDURE `encuesta_comentarios`(IN codigo BIGINT(15),IN ciclo varchar(45))
BEGIN

select 
	Encuesta.comentario
from
	encuesta Encuesta,
	curso_ciclo Curso_Ciclo,
	horario Horario,
	horario_profesor Horario_Profesor,
	ciclo Ciclo
where
	Ciclo.descripcion like ciclo and
	Curso_Ciclo.id_ciclo = Ciclo.id and
	Horario.id_curso_ciclo = Curso_Ciclo.id and
	Horario_Profesor.id_horario = Horario.id and
	Horario_Profesor.id_profesor = codigo and
	Encuesta.id_horario_profesor = Horario_Profesor.id;
	
END$$
DELIMITER ;


DROP procedure IF EXISTS `encuesta_listar`;
DELIMITER $$
CREATE PROCEDURE `encuesta_listar`(IN codigo BIGINT(15))
BEGIN

select 
	Horario_Profesor.id as id,Ciclo.descripcion as ciclo, Curso.nombre as curso, Horario.codigo as horario, Horario_Profesor.participacion as porcentaje,Horario_Profesor.puntaje
from 
	curso Curso, 
curso_ciclo Curso_Ciclo, 
ciclo as Ciclo,
	horario Horario, 
horario_profesor Horario_Profesor
where
	Curso.id = Curso_Ciclo.id and
	Curso_Ciclo.id_ciclo = Ciclo.id and
    Curso_Ciclo.id = Horario.id_curso_ciclo and
    Horario.id = Horario_Profesor.id_horario and
    Horario_Profesor.id_profesor = codigo;
	
END$$
DELIMITER ;


DROP procedure IF EXISTS `horas_descarga_detalle`;
DELIMITER $$
CREATE PROCEDURE `horas_descarga_detalle`(IN codigo BIGINT(15),IN ciclo varchar(45))
BEGIN

select 
	Curso.nombre, Horario.codigo, Descarga.numeroSemana as numero, Descarga.horasReducidas as hDescarga, Descarga.motivo as motivo
from
	curso Curso,
	curso_ciclo Curso_Ciclo,
	horario Horario,
	horario_profesor Horario_Profesor,
	descarga Descarga,
	ciclo Ciclo
where
	Ciclo.descripcion like ciclo and
	Curso_Ciclo.id_ciclo = Ciclo.id and
	Horario.id_curso_ciclo = Curso_Ciclo.id and
	Horario_Profesor.id_horario = Horario.id and
	Horario_Profesor.id_profesor = codigo and
	Descarga.id_horario_profesor = Horario_Profesor.id;


END$$
DELIMITER ;


DROP procedure IF EXISTS `horas_descarga_listar`;
DELIMITER $$
CREATE PROCEDURE `horas_descarga_listar`(IN codigo BIGINT(15),IN ciclo varchar(45))
BEGIN

select 
	Curso.nombre, Horario.codigo,SUM(Descarga.horasReducidas) AS hDescarga, Descarga.motivo
from
	curso Curso,
	curso_ciclo Curso_Ciclo,
	horario Horario,
	horario_profesor Horario_Profesor,
	descarga Descarga,
	ciclo Ciclo
where
	Ciclo.descripcion like ciclo and
	Curso_Ciclo.id_ciclo = Ciclo.id and
	Horario.id_curso_ciclo = Curso_Ciclo.id and
	Horario_Profesor.id_horario = Horario.id and
	Horario_Profesor.id_profesor = codigo and
	Descarga.id_horario_profesor = Horario_Profesor.id
group by
	CONCAT(Curso.nombre, "-", Horario.codigo);

END$$
DELIMITER ;


DROP procedure IF EXISTS `insert_docente`;
DELIMITER $$
CREATE PROCEDURE `insert_docente`(in nombresC varchar(100),in apellidoPC varchar(100),
in apellidoMC varchar(100), in dniC int(15),in telefono bigint(15),in correoC varchar(100),
in seccionC varchar(45),in tipoC varchar(45))
BEGIN
	INSERT INTO persona (nombres,apellidoP,apellidoM,dni,telefono,correo) 
    VALUES (nombresC,apellidoPC,apellidoMC,dniC,telefono,correoC);
    INSERT INTO colaborador (id_persona) VALUES ((select max(id) from persona));
    INSERT INTO profesor (id_colaborador,id_seccion,id_tipoProfesor) 
    VALUES ((select max(id) from colaborador),(select id from seccion where nombre like seccionC)
    ,(select id from tipo_profesor where descripcion like tipoC));
END$$
DELIMITER ;


DROP procedure IF EXISTS `listaCiclos`;
DELIMITER $$
CREATE PROCEDURE `listaCiclos`()
BEGIN
	select id, descripcion
    from ciclo
    order by descripcion desc;
END$$
DELIMITER ;


DROP procedure IF EXISTS `listaDocentes`;
DELIMITER $$
CREATE PROCEDURE `listaDocentes`()
BEGIN
	select
    p.id, concat(pe.apellidoP,' ',pe.apellidoM,' ',pe.nombres) as nombre
    from
    colaborador c, persona pe, profesor p
    where
    p.id_colaborador = c.id and pe.id = c.id_persona;
END$$
DELIMITER ;


DROP procedure IF EXISTS `verifica_docente_repetido`;
DELIMITER $$
CREATE PROCEDURE `verifica_docente_repetido`(in dniC int)
BEGIN
	select id from persona where dni = dniC;
END$$
DELIMITER ;