#insertar departamento:
INSERT INTO departamento(nombre) VALUES ('Ingenieria');
#select * from departamento;

#insertar seccion
INSERT INTO seccion(id_departamento,nombre) VALUES(1,'Informatica');
INSERT INTO seccion(id_departamento,nombre) VALUES(1,'Industrial');
INSERT INTO seccion(id_departamento,nombre) VALUES(1,'Mecanica');
#select * from seccion;

#insertar persona
INSERT INTO persona (nombres,apellidoM,apellidoP,dni,telefono,correo) VALUES ('Freddy','Paz','Espinoza',77766655,4814759,'fpaz@pucp.edu.pe');
INSERT INTO persona (nombres,apellidoM,apellidoP,dni,telefono,correo) VALUES ('Ruben','Jordan','Incognito',11122233,2543762,'rjgod@pucp.edu.pe');
#select * from persona;

#insertar colaborador
INSERT INTO colaborador (id_persona) VALUES (1);
INSERT INTO colaborador (id_persona) VALUES (2);
#select * from colaborador;

#insertar tipo profesor:
INSERT INTO tipoProfesor(descripcion,horasDictado) VALUES ('TC',10);
INSERT INTO tipoProfesor(descripcion,horasDictado) VALUES ('TPA',6);
#select * from tipoprofesor;


#insertar profesor
INSERT INTO profesor (id_colaborador,id_seccion,id_tipoProfesor) VALUES (1,1,1);
INSERT INTO profesor (id_colaborador,id_seccion,id_tipoProfesor) VALUES (2,1,2);
#select * from profesor ;

#ciclo
INSERT INTO ciclo (descripcion,fecha_inicio,fecha_fin,numeroSemanas) VALUES ('2018-1',STR_TO_DATE('12-03-2018', '%d-%m-%Y') ,STR_TO_DATE('07-07-2018', '%d-%m-%Y'),17);
#select * from ciclo;

#facultad
INSERT INTO facultad (nombre) VALUES ('Ciencias e Ingenieria');
INSERT INTO facultad (nombre) VALUES ('Arquitectura');
INSERT INTO facultad (nombre) VALUES ('Ciencias sociales');
#select * from facultad;

#tipocurso
INSERT INTO tipoCurso(descripcion) VALUES ('Pregrado');
INSERT INTO tipoCurso(descripcion) VALUES ('Posgrado');
INSERT INTO tipoCurso(descripcion) VALUES ('Otros');
#select * from tipoCurso;


#curso
INSERT INTO curso(codigo,nombre,creditos,horasDictado,id_facultad,id_tipoCurso,id_seccion) 
	VALUES ('INF282','Lenguaje de programacion 2',5,4,1,1,1);
INSERT INTO curso(codigo,nombre,creditos,horasDictado,id_facultad,id_tipoCurso,id_seccion) 
	VALUES ('INF239','Sistemas operativos',4.5,3,1,1,1);
INSERT INTO curso(codigo,nombre,creditos,horasDictado,id_facultad,id_tipoCurso,id_seccion) 
	VALUES ('INF245','Ingenieria de Software',4,3,1,1,1);
INSERT INTO curso(codigo,nombre,creditos,horasDictado,id_facultad,id_tipoCurso,id_seccion) 
	VALUES ('IND275','Control de Gestion Industrial',4.5,4,1,1,3);
#select * from curso;

#curso_ciclo
INSERT INTO curso_ciclo(id_curso,id_ciclo) VALUES (1,1);
INSERT INTO curso_ciclo(id_curso,id_ciclo) VALUES (2,1);
INSERT INTO curso_ciclo(id_curso,id_ciclo) VALUES (3,1);
INSERT INTO curso_ciclo(id_curso,id_ciclo) VALUES (4,1);
#select * from curso_ciclo;

#horario
INSERT INTO horario(id_curso_ciclo,codigo) VALUES (1,'0781');
INSERT INTO horario(id_curso_ciclo,codigo) VALUES (2,'0781');
INSERT INTO horario(id_curso_ciclo,codigo) VALUES (3,'0881');
INSERT INTO horario(id_curso_ciclo,codigo) VALUES (4,'0731');
#select * from horario;

#horario_profesor
INSERT INTO horario_profesor(id_horario,id_profesor,participacion,puntaje) VALUES (1,1,100,100);
INSERT INTO horario_profesor(id_horario,id_profesor,participacion,puntaje) VALUES (2,2,100,66);
INSERT INTO horario_profesor(id_horario,id_profesor,participacion,puntaje) VALUES (3,1,100,100);
INSERT INTO horario_profesor(id_horario,id_profesor,participacion,puntaje) VALUES (4,2,100,69);
#select * from horario_profesor;


#encuesta
INSERT INTO encuesta (id_horario_profesor,puntaje,comentario) 
	VALUES (1,100,'Excelente profesor de lp2 me enseño clases y yo pense que solo eran clases en salones LP2');
INSERT INTO encuesta (id_horario_profesor,puntaje,comentario) 
	VALUES (1,100,'Freddy Paz es un crack! Yo solo sabía que existían hilos para coser ! LP2');
INSERT INTO encuesta (id_horario_profesor,puntaje,comentario) 
	VALUES (1,100,'El profesor Freddy tiene mucha paciencia para resolver dudas y se toma su tiempo para absolverlas LP2');
INSERT INTO encuesta (id_horario_profesor,puntaje,comentario) 
	VALUES (1,100,'De grande quiero ser como Freddy Paz! LP2');
INSERT INTO encuesta (id_horario_profesor,puntaje,comentario) 
	VALUES (2,66,'Ruben se convirtio en lo que siempre odio de alumno, Ser un profesor terrible!!! S.O.');
INSERT INTO encuesta (id_horario_profesor,puntaje,comentario) 
	VALUES (2,66,'Las TAS de este profesor son imposibles! S.O.');
INSERT INTO encuesta (id_horario_profesor,puntaje,comentario) 
	VALUES (2,66,'Consejo para sacar buena nota en los laboratorios : NO IR! S.O.');	
INSERT INTO encuesta (id_horario_profesor,puntaje,comentario) 
	VALUES (1,100,'F.Paz enseña muy bien este curso I.S');
INSERT INTO encuesta (id_horario_profesor,puntaje,comentario) 
	VALUES (1,100,'Gracias a este profesor aprendi a usar Gestion de configuracion I.S');
INSERT INTO encuesta (id_horario_profesor,puntaje,comentario) 
	VALUES (2,69,'Mal profesor, dijo que pondria 20 a todos en la TA ! CGI');
INSERT INTO encuesta (id_horario_profesor,puntaje,comentario) 
	VALUES (2,69,'Aburrido no sabe ni sumar cuentas financieras! CGI');
#select * from encuesta ;


#estado_investigacion
INSERT INTO estadoInvestigacion (descripcion)VALUES ('Finalizada');
INSERT INTO estadoInvestigacion (descripcion)VALUES ('En proceso');
#select * from estadoinvestigacion;


#investigacion
INSERT INTO investigacion (titulo,resumen,id_estadoInvestigacion,archivo,fecha) VALUES 
	('Como ser bueno en Lp2','Antes que nada, debes reconocer algo: Hay voces dentro de ti. Yo lo aprendí cuando tenía 19 años, el día que causé un accidente de automóvil. No pisé el freno porque en la clase de manejo que tomé me habían dicho que no lo hiciera, que si frenaba bruscamente causaría que decenas de auto..',
	1,X'89504E470D0A1A0A00',STR_TO_DATE('20-04-2018', '%d-%m-%Y'));
INSERT INTO investigacion (titulo,resumen,id_estadoInvestigacion,archivo,fecha) VALUES 
	('Usabilidad en los programas de los alumnos','Liverpool se complicó más de la cuenta luego de ir goleando por 5-0 a la Roma. Con una gran actuación del egipcio Salah, y posterior retirada del campo, los Reds parecieron caerse y se dejaron marcar dos goles generando una gran expectativa para el duelo de vuelta.',
	1,X'89504E470D0A1A0A01',STR_TO_DATE('19-04-2018', '%d-%m-%Y'));
INSERT INTO investigacion (titulo,resumen,id_estadoInvestigacion,archivo,fecha) VALUES 
	('Sistemas operativos para bebes','Tras dejar la conducción del polémico programa La Noche es Mía hace unas semanas, Carlos Galdós reapareció en las pantallas chicas el fin de semana para hacer un mea culpa de lo que mostró en la televisión',
	1,X'89504E470D0A1A0A02',STR_TO_DATE('18-04-2018', '%d-%m-%Y'));
INSERT INTO investigacion (titulo,resumen,id_estadoInvestigacion,archivo,fecha) VALUES 
	('Como matar Halion 25h siendo brujo demonología',"Esto se remonta a Argus, donde el Titán Oscuro Sargeras el Destructor, observó a los Eredar, una raza que dominaba con gran maestría la magia arcana. Sargeras...",
	1,X'89504E470D0A1A0A03',STR_TO_DATE('16-04-2018', '%d-%m-%Y'));
#select * from investigacion;

#profesor_investigacion
INSERT INTO profesor_investigacion(id_profesor,id_investigacion) VALUES (1,4);
INSERT INTO profesor_investigacion(id_profesor,id_investigacion) VALUES (1,1);
INSERT INTO profesor_investigacion(id_profesor,id_investigacion) VALUES (2,2);
INSERT INTO profesor_investigacion(id_profesor,id_investigacion) VALUES (2,3);
#select * from profesor_investigacion

#sin errores

#estadoactividad
INSERT INTO estadoActividad (descripcion) VALUES ("Asistio");
INSERT INTO estadoActividad (descripcion) VALUES ("Cancelada");
INSERT INTO estadoActividad (descripcion) VALUES ("Asistira");
#select * from estadoActividad;

#tipoActividad
INSERT INTO tipoActividad (descripcion) VALUES ("Congreso");
INSERT INTO tipoActividad (descripcion) VALUES ("Taller");
INSERT INTO tipoActividad (descripcion) VALUES ("Visita");
INSERT INTO tipoActividad (descripcion) VALUES ("Capacitacion");
#select * from tipoActividad;






#actividad;
INSERT INTO actividad (id_profesor,id_ciclo,fecha_inicio,fecha_fin,nombre,id_estadoActividad,id_tipoActividad,lugar) 
	VALUES (1,1,STR_TO_DATE('28-04-2018', '%d-%m-%Y'),STR_TO_DATE('28-04-2018', '%d-%m-%Y'),'Reunion congresal de amantes del Hearthstone',3,1,'Laboratorio V205');
INSERT INTO actividad (id_profesor,id_ciclo,fecha_inicio,fecha_fin,nombre,id_estadoActividad,id_tipoActividad,lugar) 
	VALUES (1,1,STR_TO_DATE('23-04-2018', '%d-%m-%Y'),STR_TO_DATE('23-04-2018', '%d-%m-%Y'),'Reunion congresal de amantes del Crouche',2,1,'Centrum Catolica');
INSERT INTO actividad (id_profesor,id_ciclo,fecha_inicio,fecha_fin,nombre,id_estadoActividad,id_tipoActividad,lugar) 
	VALUES (2,1,STR_TO_DATE('27-04-2018', '%d-%m-%Y'),STR_TO_DATE('27-04-2018', '%d-%m-%Y'),'¿Ser un amante de los Jojos es bueno?',3,2,'Salon J666');
INSERT INTO actividad (id_profesor,id_ciclo,fecha_inicio,fecha_fin,nombre,id_estadoActividad,id_tipoActividad,lugar) 
	VALUES (2,1,STR_TO_DATE('20-04-2018', '%d-%m-%Y'),STR_TO_DATE('21-04-2018', '%d-%m-%Y'),'Taller de consola de linux facilito',1,2,'Salon A101');
#select * from actividad;



#descarga:
INSERT INTO descarga (motivo,horasReducidas,id_horario_profesor,numeroSemana) VALUES ('Descanso medico',1,1,7);
INSERT INTO descarga (motivo,horasReducidas,id_horario_profesor,numeroSemana) VALUES ('Ver la champions Real - Bayern',2,2,8);
#select* from descarga;


