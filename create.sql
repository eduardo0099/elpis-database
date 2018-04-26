-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema dbsw
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema dbsw
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `dbsw` DEFAULT CHARACTER SET utf8 ;
USE `dbsw` ;

-- -----------------------------------------------------
-- Table `dbsw`.`persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbsw`.`persona` (
  `id` BIGINT(15) NOT NULL AUTO_INCREMENT,
  `nombres` VARCHAR(100) NOT NULL,
  `apellidoM` VARCHAR(100) NOT NULL,
  `apellidoP` VARCHAR(100) NOT NULL,
  `dni` INT(15) NOT NULL,
  `telefono` BIGINT(15) NOT NULL,
  `correo` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbsw`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbsw`.`usuario` (
  `id` BIGINT(15) NOT NULL AUTO_INCREMENT,
  `id_persona` BIGINT(15) NOT NULL,
  `nombreusuario` VARCHAR(100) NOT NULL,
  `contrasena` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_usuario_persona1_idx` (`id_persona` ASC),
  CONSTRAINT `fk_usuario_persona1`
    FOREIGN KEY (`id_persona`)
    REFERENCES `dbsw`.`persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbsw`.`ciclo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbsw`.`ciclo` (
  `id` BIGINT(15) NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(45) NOT NULL,
  `fecha_inicio` DATE NOT NULL,
  `fecha_fin` DATE NOT NULL,
  `numeroSemanas` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbsw`.`colaborador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbsw`.`colaborador` (
  `id` BIGINT(15) NOT NULL AUTO_INCREMENT,
  `id_persona` BIGINT(15) NOT NULL,
  INDEX `fk_colaborador_persona1_idx` (`id_persona` ASC),
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_colaborador_persona1`
    FOREIGN KEY (`id_persona`)
    REFERENCES `dbsw`.`persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbsw`.`departamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbsw`.`departamento` (
  `id` BIGINT(15) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbsw`.`seccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbsw`.`seccion` (
  `id` BIGINT(15) NOT NULL AUTO_INCREMENT,
  `id_departamento` BIGINT(15) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_seccion_departamento_idx` (`id_departamento` ASC),
  CONSTRAINT `fk_seccion_departamento`
    FOREIGN KEY (`id_departamento`)
    REFERENCES `dbsw`.`departamento` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbsw`.`tipoProfesor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbsw`.`tipoProfesor` (
  `id` BIGINT(15) NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(45) NOT NULL,
  `horasDictado` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbsw`.`profesor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbsw`.`profesor` (
  `id` BIGINT(15) NOT NULL AUTO_INCREMENT,
  `id_colaborador` BIGINT(15) NOT NULL,
  `id_seccion` BIGINT(15) NOT NULL,
  `id_tipoProfesor` BIGINT(15) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_profesor_colaborador1_idx` (`id_colaborador` ASC),
  INDEX `fk_profesor_seccion1_idx` (`id_seccion` ASC),
  INDEX `fk_profesor_tipoProfesor1_idx` (`id_tipoProfesor` ASC),
  CONSTRAINT `fk_profesor_colaborador1`
    FOREIGN KEY (`id_colaborador`)
    REFERENCES `dbsw`.`colaborador` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_profesor_seccion1`
    FOREIGN KEY (`id_seccion`)
    REFERENCES `dbsw`.`seccion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_profesor_tipoProfesor1`
    FOREIGN KEY (`id_tipoProfesor`)
    REFERENCES `dbsw`.`tipoProfesor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbsw`.`facultad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbsw`.`facultad` (
  `id` BIGINT(15) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbsw`.`tipoCurso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbsw`.`tipoCurso` (
  `id` BIGINT(15) NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbsw`.`curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbsw`.`curso` (
  `id` BIGINT(15) NOT NULL AUTO_INCREMENT,
  `codigo` VARCHAR(10) NOT NULL,
  `nombre` VARCHAR(200) NOT NULL,
  `creditos` DOUBLE NOT NULL,
  `horasDictado` INT NOT NULL,
  `id_facultad` BIGINT(15) NOT NULL,
  `id_tipoCurso` BIGINT(15) NOT NULL,
  `id_seccion` BIGINT(15) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_curso_seccion1_idx` (`id_seccion` ASC),
  INDEX `fk_curso_Facultad1_idx` (`id_facultad` ASC),
  INDEX `fk_curso_tipoCurso1_idx` (`id_tipoCurso` ASC),
  CONSTRAINT `fk_curso_seccion1`
    FOREIGN KEY (`id_seccion`)
    REFERENCES `dbsw`.`seccion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_curso_Facultad1`
    FOREIGN KEY (`id_facultad`)
    REFERENCES `dbsw`.`facultad` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_curso_tipoCurso1`
    FOREIGN KEY (`id_tipoCurso`)
    REFERENCES `dbsw`.`tipoCurso` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbsw`.`curso_ciclo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbsw`.`curso_ciclo` (
  `id` BIGINT(15) NOT NULL AUTO_INCREMENT,
  `id_curso` BIGINT(15) NOT NULL,
  `id_ciclo` BIGINT(15) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_curso_ciclo_curso1_idx` (`id_curso` ASC),
  INDEX `fk_curso_ciclo_ciclo1_idx` (`id_ciclo` ASC),
  CONSTRAINT `fk_curso_ciclo_curso1`
    FOREIGN KEY (`id_curso`)
    REFERENCES `dbsw`.`curso` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_curso_ciclo_ciclo1`
    FOREIGN KEY (`id_ciclo`)
    REFERENCES `dbsw`.`ciclo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbsw`.`horario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbsw`.`horario` (
  `id` BIGINT(15) NOT NULL AUTO_INCREMENT,
  `id_curso_ciclo` BIGINT(15) NOT NULL,
  `codigo` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_horario_curso_ciclo1_idx` (`id_curso_ciclo` ASC),
  CONSTRAINT `fk_horario_curso_ciclo1`
    FOREIGN KEY (`id_curso_ciclo`)
    REFERENCES `dbsw`.`curso_ciclo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbsw`.`horario_profesor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbsw`.`horario_profesor` (
  `id` BIGINT(15) NOT NULL AUTO_INCREMENT,
  `id_horario` BIGINT(15) NOT NULL,
  `id_profesor` BIGINT(15) NOT NULL,
  `participacion` DOUBLE NOT NULL,
  `puntaje` DOUBLE NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_horario_profesor_horario1_idx` (`id_horario` ASC),
  INDEX `fk_horario_profesor_profesor1_idx` (`id_profesor` ASC),
  CONSTRAINT `fk_horario_profesor_horario1`
    FOREIGN KEY (`id_horario`)
    REFERENCES `dbsw`.`horario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_horario_profesor_profesor1`
    FOREIGN KEY (`id_profesor`)
    REFERENCES `dbsw`.`profesor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbsw`.`estadoInvestigacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbsw`.`estadoInvestigacion` (
  `id` BIGINT(15) NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbsw`.`investigacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbsw`.`investigacion` (
  `id` BIGINT(15) NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(100) NOT NULL,
  `resumen` TEXT NOT NULL,
  `id_estadoInvestigacion` BIGINT(15) NOT NULL,
  `archivo` MEDIUMBLOB NOT NULL,
  `fecha` DATE NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_investigacion_estadoInvestigacion1_idx` (`id_estadoInvestigacion` ASC),
  CONSTRAINT `fk_investigacion_estadoInvestigacion1`
    FOREIGN KEY (`id_estadoInvestigacion`)
    REFERENCES `dbsw`.`estadoInvestigacion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbsw`.`convocatoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbsw`.`convocatoria` (
  `id` BIGINT(15) NOT NULL,
  `id_seccion` BIGINT(15) NOT NULL,
  `url` TEXT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_convocatoria_seccion1_idx` (`id_seccion` ASC),
  CONSTRAINT `fk_convocatoria_seccion1`
    FOREIGN KEY (`id_seccion`)
    REFERENCES `dbsw`.`seccion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbsw`.`requisito`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbsw`.`requisito` (
  `id` BIGINT(15) NOT NULL,
  `nombre` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbsw`.`requisito_valor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbsw`.`requisito_valor` (
  `id` BIGINT(15) NOT NULL,
  `id_requisito` BIGINT(15) NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_requisito_valor_requisito1_idx` (`id_requisito` ASC),
  CONSTRAINT `fk_requisito_valor_requisito1`
    FOREIGN KEY (`id_requisito`)
    REFERENCES `dbsw`.`requisito` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbsw`.`convocatoria_requisito`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbsw`.`convocatoria_requisito` (
  `id` BIGINT(15) NOT NULL,
  `id_convocatoria` BIGINT(15) NOT NULL,
  `id_requisito` BIGINT(15) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_convocatoria_requisito_requisito1_idx` (`id_requisito` ASC),
  INDEX `fk_convocatoria_requisito_convocatoria1_idx` (`id_convocatoria` ASC),
  CONSTRAINT `fk_convocatoria_requisito_requisito1`
    FOREIGN KEY (`id_requisito`)
    REFERENCES `dbsw`.`requisito` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_convocatoria_requisito_convocatoria1`
    FOREIGN KEY (`id_convocatoria`)
    REFERENCES `dbsw`.`convocatoria` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbsw`.`rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbsw`.`rol` (
  `id` BIGINT(15) NOT NULL AUTO_INCREMENT,
  `id_usuario` BIGINT(15) NOT NULL,
  `nombre` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_rol_usuario1_idx` (`id_usuario` ASC),
  CONSTRAINT `fk_rol_usuario1`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `dbsw`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbsw`.`menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbsw`.`menu` (
  `id` BIGINT(15) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbsw`.`rol_menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbsw`.`rol_menu` (
  `id` BIGINT(15) NOT NULL AUTO_INCREMENT,
  `id_rol` BIGINT(15) NOT NULL,
  `id_menu` BIGINT(15) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_rol_menu_rol1_idx` (`id_rol` ASC),
  INDEX `fk_rol_menu_menu1_idx` (`id_menu` ASC),
  CONSTRAINT `fk_rol_menu_rol1`
    FOREIGN KEY (`id_rol`)
    REFERENCES `dbsw`.`rol` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_rol_menu_menu1`
    FOREIGN KEY (`id_menu`)
    REFERENCES `dbsw`.`menu` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbsw`.`asistente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbsw`.`asistente` (
  `id` BIGINT(15) NOT NULL AUTO_INCREMENT,
  `id_colaborador` BIGINT(15) NOT NULL,
  `id_seccion` BIGINT(15) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_asistente_seccion1_idx` (`id_seccion` ASC),
  INDEX `fk_asistente_colaborador1_idx` (`id_colaborador` ASC),
  CONSTRAINT `fk_asistente_seccion1`
    FOREIGN KEY (`id_seccion`)
    REFERENCES `dbsw`.`seccion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_asistente_colaborador1`
    FOREIGN KEY (`id_colaborador`)
    REFERENCES `dbsw`.`colaborador` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbsw`.`profesor_investigacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbsw`.`profesor_investigacion` (
  `id` BIGINT(15) NOT NULL AUTO_INCREMENT,
  `id_profesor` BIGINT(15) NOT NULL,
  `id_investigacion` BIGINT(15) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_profesor_investigacion_profesor1_idx` (`id_profesor` ASC),
  INDEX `fk_profesor_investigacion_investigacion1_idx` (`id_investigacion` ASC),
  CONSTRAINT `fk_profesor_investigacion_profesor1`
    FOREIGN KEY (`id_profesor`)
    REFERENCES `dbsw`.`profesor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_profesor_investigacion_investigacion1`
    FOREIGN KEY (`id_investigacion`)
    REFERENCES `dbsw`.`investigacion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbsw`.`estadoAyudaEconomica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbsw`.`estadoAyudaEconomica` (
  `id` BIGINT(15) NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbsw`.`ayuda_economica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbsw`.`ayuda_economica` (
  `id` BIGINT(15) NOT NULL AUTO_INCREMENT,
  `id_profesor_investigacion` BIGINT(15) NOT NULL,
  `monto_otorgado` DOUBLE NOT NULL,
  `monto_justificado` DOUBLE NULL,
  `id_estadoAyudaEconomica` BIGINT(15) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_ayuda_economica_profesor_investigacion1_idx` (`id_profesor_investigacion` ASC),
  INDEX `fk_ayuda_economica_estadoAyudaEconomica1_idx` (`id_estadoAyudaEconomica` ASC),
  CONSTRAINT `fk_ayuda_economica_profesor_investigacion1`
    FOREIGN KEY (`id_profesor_investigacion`)
    REFERENCES `dbsw`.`profesor_investigacion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ayuda_economica_estadoAyudaEconomica1`
    FOREIGN KEY (`id_estadoAyudaEconomica`)
    REFERENCES `dbsw`.`estadoAyudaEconomica` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbsw`.`justificacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbsw`.`justificacion` (
  `id` BIGINT(15) NOT NULL AUTO_INCREMENT,
  `id_ayuda_economica` BIGINT(15) NOT NULL,
  `descripcion` TEXT NOT NULL,
  `monto_justificacion` DOUBLE NOT NULL,
  `obervaciones` TEXT NULL,
  `archivo` MEDIUMBLOB NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_justificación_ayuda_economica1_idx` (`id_ayuda_economica` ASC),
  CONSTRAINT `fk_justificación_ayuda_economica1`
    FOREIGN KEY (`id_ayuda_economica`)
    REFERENCES `dbsw`.`ayuda_economica` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbsw`.`encuesta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbsw`.`encuesta` (
  `id` BIGINT(15) NOT NULL AUTO_INCREMENT,
  `id_horario_profesor` BIGINT(15) NOT NULL,
  `puntaje` DOUBLE NOT NULL,
  `comentario` TEXT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_encuesta_horario_profesor1_idx` (`id_horario_profesor` ASC),
  CONSTRAINT `fk_encuesta_horario_profesor1`
    FOREIGN KEY (`id_horario_profesor`)
    REFERENCES `dbsw`.`horario_profesor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbsw`.`postulante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbsw`.`postulante` (
  `id` BIGINT(15) NOT NULL,
  `id_persona` BIGINT(15) NOT NULL,
  `id_convocatoria` BIGINT(15) NOT NULL,
  INDEX `fk_postulante_persona1_idx` (`id_persona` ASC),
  PRIMARY KEY (`id`),
  INDEX `fk_postulante_convocatoria1_idx` (`id_convocatoria` ASC),
  CONSTRAINT `fk_postulante_persona1`
    FOREIGN KEY (`id_persona`)
    REFERENCES `dbsw`.`persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_postulante_convocatoria1`
    FOREIGN KEY (`id_convocatoria`)
    REFERENCES `dbsw`.`convocatoria` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbsw`.`descarga`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbsw`.`descarga` (
  `id` BIGINT(15) NOT NULL AUTO_INCREMENT,
  `motivo` TEXT(200) NOT NULL,
  `horasReducidas` INT NOT NULL,
  `id_horario_profesor` BIGINT(15) NOT NULL,
  `numeroSemana` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_descarga_horario_profesor1_idx` (`id_horario_profesor` ASC),
  CONSTRAINT `fk_descarga_horario_profesor1`
    FOREIGN KEY (`id_horario_profesor`)
    REFERENCES `dbsw`.`horario_profesor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbsw`.`estadoActividad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbsw`.`estadoActividad` (
  `id` BIGINT(15) NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbsw`.`tipoActividad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbsw`.`tipoActividad` (
  `id` BIGINT(15) NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbsw`.`actividad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbsw`.`actividad` (
  `id` BIGINT(15) NOT NULL AUTO_INCREMENT,
  `id_profesor` BIGINT(15) NOT NULL,
  `id_ciclo` BIGINT(15) NOT NULL,
  `fecha_inicio` DATE NOT NULL,
  `fecha_fin` DATE NOT NULL,
  `nombre` VARCHAR(100) NOT NULL,
  `id_estadoActividad` BIGINT(15) NOT NULL,
  `id_tipoActividad` BIGINT(15) NOT NULL,
  `lugar` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_actividad_profesor1_idx` (`id_profesor` ASC),
  INDEX `fk_actividad_ciclo1_idx` (`id_ciclo` ASC),
  INDEX `fk_actividad_estadoActividad1_idx` (`id_estadoActividad` ASC),
  INDEX `fk_actividad_tipoActividad1_idx` (`id_tipoActividad` ASC),
  CONSTRAINT `fk_actividad_profesor1`
    FOREIGN KEY (`id_profesor`)
    REFERENCES `dbsw`.`profesor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_actividad_ciclo1`
    FOREIGN KEY (`id_ciclo`)
    REFERENCES `dbsw`.`ciclo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_actividad_estadoActividad1`
    FOREIGN KEY (`id_estadoActividad`)
    REFERENCES `dbsw`.`estadoActividad` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_actividad_tipoActividad1`
    FOREIGN KEY (`id_tipoActividad`)
    REFERENCES `dbsw`.`tipoActividad` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbsw`.`jefe_departamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbsw`.`jefe_departamento` (
  `id` BIGINT(15) NOT NULL,
  `id_colaborador` BIGINT(15) NOT NULL,
  `id_departamento` BIGINT(15) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_jefeDepartamento_colaborador1_idx` (`id_colaborador` ASC),
  INDEX `fk_jefe_departamento_departamento1_idx` (`id_departamento` ASC),
  CONSTRAINT `fk_jefeDepartamento_colaborador1`
    FOREIGN KEY (`id_colaborador`)
    REFERENCES `dbsw`.`colaborador` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_jefe_departamento_departamento1`
    FOREIGN KEY (`id_departamento`)
    REFERENCES `dbsw`.`departamento` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbsw`.`curso_elegible`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbsw`.`curso_elegible` (
  `id` BIGINT(15) NOT NULL AUTO_INCREMENT,
  `id_ciclo` BIGINT(15) NOT NULL,
  `id_curso` BIGINT(15) NOT NULL,
  `id_departamento` BIGINT(15) NOT NULL,
  `id_user_registro` BIGINT(15) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_cursoElegible_ciclo1_idx` (`id_ciclo` ASC),
  INDEX `fk_cursoElegible_curso1_idx` (`id_curso` ASC),
  INDEX `fk_curso_elegible_departamento1_idx` (`id_departamento` ASC),
  CONSTRAINT `fk_cursoElegible_ciclo1`
    FOREIGN KEY (`id_ciclo`)
    REFERENCES `dbsw`.`ciclo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cursoElegible_curso1`
    FOREIGN KEY (`id_curso`)
    REFERENCES `dbsw`.`curso` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_curso_elegible_departamento1`
    FOREIGN KEY (`id_departamento`)
    REFERENCES `dbsw`.`departamento` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbsw`.`preferencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbsw`.`preferencia` (
  `id` BIGINT(15) NOT NULL AUTO_INCREMENT,
  `id_profesor` BIGINT(15) NOT NULL,
  `id_cursoElegible` BIGINT(15) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_preferencia_profesor1_idx` (`id_profesor` ASC),
  INDEX `fk_preferencia_cursoElegible1_idx` (`id_cursoElegible` ASC),
  CONSTRAINT `fk_preferencia_profesor1`
    FOREIGN KEY (`id_profesor`)
    REFERENCES `dbsw`.`profesor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_preferencia_cursoElegible1`
    FOREIGN KEY (`id_cursoElegible`)
    REFERENCES `dbsw`.`curso_elegible` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbsw`.`coordinador_seccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbsw`.`coordinador_seccion` (
  `id` BIGINT(15) NOT NULL AUTO_INCREMENT,
  `id_colaborador` BIGINT(15) NOT NULL,
  `id_seccion` BIGINT(15) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_coordinador_seccion_colaborador1_idx` (`id_colaborador` ASC),
  INDEX `fk_coordinador_seccion_seccion1_idx` (`id_seccion` ASC),
  CONSTRAINT `fk_coordinador_seccion_colaborador1`
    FOREIGN KEY (`id_colaborador`)
    REFERENCES `dbsw`.`colaborador` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_coordinador_seccion_seccion1`
    FOREIGN KEY (`id_seccion`)
    REFERENCES `dbsw`.`seccion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
