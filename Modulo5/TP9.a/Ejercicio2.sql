CREATE TABLE `alpha-silicon-01`.`cursos` (
  `idcurso` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `descripcion` TEXT(500) NULL,
  `estado` CHAR(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idcursos`),
  UNIQUE INDEX `idcursos_UNIQUE` (`idcursos` ASC) VISIBLE);
  
  CREATE TABLE `alpha-silicon-01`.`usuarios` (
  `idusuario` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nickname` VARCHAR(100) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `estado` CHAR(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idusuarios`),
  UNIQUE INDEX `idusuarios_UNIQUE` (`idusuarios` ASC) VISIBLE,
  UNIQUE INDEX `nickname_UNIQUE` (`nickname` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE);
  
CREATE TABLE `alpha-silicon-01`.`materias` (
  `idmateria` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `objetivo` TEXT(500) NULL,
  `plan_estudio` TEXT(500) NULL,
  `estado` CHAR(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idmateria`),
  UNIQUE INDEX `idmateria_UNIQUE` (`idmateria` ASC) VISIBLE);
  
  CREATE TABLE `alpha-silicon-01`.`sedes` (
  `idsede` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `direccion` TEXT(500) NULL,
  `localidad` VARCHAR(50) NOT NULL,
  `cod_postal` VARCHAR(10) NOT NULL,
  `telcontacto` VARCHAR(15) NULL,
  `telcontacto2` VARCHAR(15) NULL,
  `estado` CHAR(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idsede`),
  UNIQUE INDEX `idsede_UNIQUE` (`idsede` ASC) VISIBLE);
  
INSERT INTO `alpha-silicon-01`.`cursos` (`nombre`, `estado`) VALUES ('introduccion a la programacion', '1');
INSERT INTO `alpha-silicon-01`.`cursos` (`nombre`, `estado`) VALUES ('programacion full stack', '1');
INSERT INTO `alpha-silicon-01`.`cursos` (`nombre`, `estado`) VALUES ('data & analitics 1', '1');
INSERT INTO `alpha-silicon-01`.`cursos` (`nombre`, `estado`) VALUES ('Ingles intermediate', '1');
INSERT INTO `alpha-silicon-01`.`cursos` (`nombre`, `estado`) VALUES ('Ingles begginers', '1');
INSERT INTO `alpha-silicon-01`.`usuarios` (`nickname`, `email`, `password`, `estado`) VALUES ('Lolo', 'lolo@gmail.com', 'lolo123', '1');
INSERT INTO `alpha-silicon-01`.`usuarios` (`nickname`, `email`, `password`, `estado`) VALUES ('Alfo', 'alfo@gmail.com', 'alfo123', '1');
INSERT INTO `alpha-silicon-01`.`usuarios` (`nickname`, `email`, `password`, `estado`) VALUES ('Seba', 'seba@gmail.com', 'seba123', '1');
INSERT INTO `alpha-silicon-01`.`usuarios` (`nickname`, `email`, `password`, `estado`) VALUES ('Laika', 'laika@gmail.com', 'laika123', '1');
INSERT INTO `alpha-silicon-01`.`usuarios` (`nickname`, `email`, `password`, `estado`) VALUES ('Sam', 'sam@gmail.com', 'sam123', '1');
INSERT INTO `alpha-silicon-01`.`usuarios` (`nickname`, `email`, `password`, `estado`) VALUES ('Lola', 'lola@gmail.com', 'lola123', '1');
INSERT INTO `alpha-silicon-01`.`materias` (`nombre`, `estado`) VALUES ('Estadistica 1', '1');
INSERT INTO `alpha-silicon-01`.`materias` (`nombre`, `estado`) VALUES ('Practicas', '1');
INSERT INTO `alpha-silicon-01`.`materias` (`nombre`, `estado`) VALUES ('Teoria 1', '1');
INSERT INTO `alpha-silicon-01`.`materias` (`nombre`, `estado`) VALUES ('Ingles 1', '1');
INSERT INTO `alpha-silicon-01`.`materias` (`nombre`, `estado`) VALUES ('Ingles 2', '1');
INSERT INTO `alpha-silicon-01`.`materias` (`nombre`, `estado`) VALUES ('Programacion Practica', '1');
INSERT INTO `alpha-silicon-01`.`materias` (`nombre`, `estado`) VALUES ('Programacion Teorica', '1');
INSERT INTO `alpha-silicon-01`.`sedes` (`nombre`, `localidad`, `cod_postal`, `estado`) VALUES ('Posadas', 'posadas', '3375', '1');
INSERT INTO `alpha-silicon-01`.`sedes` (`nombre`, `localidad`, `cod_postal`, `estado`) VALUES ('Obera', 'obera', '3360', '1');
INSERT INTO `alpha-silicon-01`.`sedes` (`nombre`, `localidad`, `cod_postal`, `estado`) VALUES ('San Vicente', 'san vicente', '3354', '1');
INSERT INTO `alpha-silicon-01`.`sedes` (`nombre`, `localidad`, `cod_postal`, `estado`) VALUES ('Iguazu', 'iguazu', '3368', '1');
INSERT INTO `alpha-silicon-01`.`sedes` (`nombre`, `localidad`, `cod_postal`, `estado`) VALUES ('Apostoles', 'apostoles', '3389', '1');
