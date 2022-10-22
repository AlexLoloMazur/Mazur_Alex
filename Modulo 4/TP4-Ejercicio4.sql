-- Ejercicio 1

DROP DATABASE IF EXISTS alumnos_cursos;
CREATE DATABASE alumnos_cursos CHARACTER SET utf8mb4;
USE alumnos_cursos;

CREATE TABLE IF NOT EXISTS `alumnos_cursos`.`alumnos` (
  `cod_matricula` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `apellido` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `dni` INT NOT NULL,
  `fecha_nacimiento` DATE NOT NULL,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`cod_matricula`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


CREATE TABLE IF NOT EXISTS `alumnos_cursos`.`curso` (
  `cod_curso` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cod_curso`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


CREATE TABLE IF NOT EXISTS `alumnos_cursos`.`profesor` (
  `id_profesor` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `apellido` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `especialidad` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id_profesor`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


CREATE TABLE IF NOT EXISTS `alumnos_cursos`.`alumno_curso` (
  `id_alumno-curso` INT NOT NULL AUTO_INCREMENT,
  `cod_matricula` INT NOT NULL,
  `cod_curso` INT NOT NULL,
  `alumnos_cod_matricula` INT UNSIGNED NOT NULL,
  `curso_cod_curso` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id_alumno-curso`, `cod_matricula`, `cod_curso`, `alumnos_cod_matricula`, `curso_cod_curso`),
  INDEX `fk_alumno_curso_alumnos_idx` (`alumnos_cod_matricula` ASC) VISIBLE,
  INDEX `fk_alumno_curso_curso1_idx` (`curso_cod_curso` ASC) VISIBLE,
  CONSTRAINT `fk_alumno_curso_alumnos`
    FOREIGN KEY (`alumnos_cod_matricula`)
    REFERENCES `alumnos_cursos`.`alumnos` (`cod_matricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_alumno_curso_curso1`
    FOREIGN KEY (`curso_cod_curso`)
    REFERENCES `alumnos_cursos`.`curso` (`cod_curso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


CREATE TABLE IF NOT EXISTS `alumnos_cursos`.`curso_profesor` (
  `id_curso-profesor` INT NOT NULL AUTO_INCREMENT,
  `cod_curso` INT NOT NULL,
  `id_profesor` INT NOT NULL,
  `curso_cod_curso` INT UNSIGNED NOT NULL,
  `profesor_id_profesor` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id_curso-profesor`, `cod_curso`, `id_profesor`, `curso_cod_curso`, `profesor_id_profesor`),
  INDEX `fk_curso_profesor_curso1_idx` (`curso_cod_curso` ASC) VISIBLE,
  INDEX `fk_curso_profesor_profesor1_idx` (`profesor_id_profesor` ASC) VISIBLE,
  CONSTRAINT `fk_curso_profesor_curso1`
    FOREIGN KEY (`curso_cod_curso`)
    REFERENCES `alumnos_cursos`.`curso` (`cod_curso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_curso_profesor_profesor1`
    FOREIGN KEY (`profesor_id_profesor`)
    REFERENCES `alumnos_cursos`.`profesor` (`id_profesor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


INSERT INTO `alumnos_cursos`.`alumnos` (`apellido`, `nombre`, `dni`, `fecha_nacimiento`, `email`) VALUES ('mazur', 'alex', '33720606', '1988-04-17', 'quecharly@hotmail.com');
INSERT INTO `alumnos_cursos`.`alumnos` (`apellido`, `nombre`, `dni`, `fecha_nacimiento`) VALUES ('esquivel', 'alfonsina', '32884578', '1987-10-21');
INSERT INTO `alumnos_cursos`.`alumnos` (`apellido`, `nombre`, `dni`, `fecha_nacimiento`) VALUES ('mazur', 'sebastian', '47111542', '2006-07-19');
INSERT INTO `alumnos_cursos`.`curso` (`nombre`) VALUES ('Programacion Teorica');
INSERT INTO `alumnos_cursos`.`curso` (`nombre`) VALUES ('Programacion Practica');
INSERT INTO `alumnos_cursos`.`curso` (`nombre`) VALUES ('Ingles Intermediate');
INSERT INTO `alumnos_cursos`.`profesor` (`apellido`, `nombre`, `especialidad`) VALUES ('ponce', 'jose', 'programador');
INSERT INTO `alumnos_cursos`.`profesor` (`apellido`, `nombre`, `especialidad`) VALUES ('rauber', 'facundo', 'programador');
INSERT INTO `alumnos_cursos`.`profesor` (`apellido`, `nombre`, `especialidad`) VALUES ('lezcano', 'veronica', 'prof ingles');
INSERT INTO `alumnos_cursos`.`alumno_curso` (`cod_matricula`, `cod_curso`) VALUES ('1', '1');
INSERT INTO `alumnos_cursos`.`alumno_curso` (`cod_matricula`, `cod_curso`) VALUES ('1', '2');
INSERT INTO `alumnos_cursos`.`alumno_curso` (`cod_matricula`, `cod_curso`) VALUES ('1', '3');
INSERT INTO `alumnos_cursos`.`alumno_curso` (`cod_matricula`, `cod_curso`) VALUES ('2', '1');
INSERT INTO `alumnos_cursos`.`alumno_curso` (`cod_matricula`, `cod_curso`) VALUES ('2', '3');
INSERT INTO `alumnos_cursos`.`alumno_curso` (`cod_matricula`, `cod_curso`) VALUES ('3', '2');
INSERT INTO `alumnos_cursos`.`curso_profesor` (`cod_curso`, `id_profesor`) VALUES ('1', '1');
INSERT INTO `alumnos_cursos`.`curso_profesor` (`cod_curso`, `id_profesor`) VALUES ('2', '2');
INSERT INTO `alumnos_cursos`.`curso_profesor` (`cod_curso`, `id_profesor`) VALUES ('3', '3');
INSERT INTO `alumnos_cursos`.`curso_profesor` (`cod_curso`, `id_profesor`) VALUES ('1', '2');
INSERT INTO `alumnos_cursos`.`curso_profesor` (`cod_curso`, `id_profesor`) VALUES ('2', '1');


-- Ejercicio 2

DROP DATABASE IF EXISTS paises;
CREATE DATABASE paises CHARACTER SET utf8mb4;
USE paises;

CREATE TABLE IF NOT EXISTS `paises`.`pais` (
  `id_pais` INT NOT NULL AUTO_INCREMENT,
  `nombre_pais` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_pais`),
  UNIQUE INDEX `nombre_pais_UNIQUE` (`nombre_pais` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `paises`.`provincia` (
  `id_provincia` INT NOT NULL AUTO_INCREMENT,
  `nombre_provincia` VARCHAR(45) NOT NULL,
  `pais_id_pais` INT NOT NULL,
  PRIMARY KEY (`id_provincia`, `pais_id_pais`),
  INDEX `fk_provincia_pais_idx` (`pais_id_pais` ASC) VISIBLE,
  CONSTRAINT `fk_provincia_pais`
    FOREIGN KEY (`pais_id_pais`)
    REFERENCES `paises`.`pais` (`id_pais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `paises`.`localidad` (
  `id_localidad` INT NOT NULL AUTO_INCREMENT,
  `nombre_localidad` VARCHAR(45) NOT NULL,
  `codigo_postal` VARCHAR(45) NOT NULL,
  `provincia_id_provincia` INT NOT NULL,
  `provincia_pais_id_pais` INT NOT NULL,
  PRIMARY KEY (`id_localidad`, `provincia_id_provincia`, `provincia_pais_id_pais`),
  INDEX `fk_localidad_provincia1_idx` (`provincia_id_provincia` ASC, `provincia_pais_id_pais` ASC) VISIBLE,
  CONSTRAINT `fk_localidad_provincia1`
    FOREIGN KEY (`provincia_id_provincia` , `provincia_pais_id_pais`)
    REFERENCES `paises`.`provincia` (`id_provincia` , `pais_id_pais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `paises`.`empleado` (
  `id_empleado` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `dni` INT NOT NULL,
  `telefono` VARCHAR(15) NULL DEFAULT NULL,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  `fecha_alta` DATE NOT NULL,
  `localidad_id_localidad` INT NOT NULL,
  `localidad_provincia_id_provincia` INT NOT NULL,
  `localidad_provincia_pais_id_pais` INT NOT NULL,
  PRIMARY KEY (`id_empleado`, `localidad_id_localidad`, `localidad_provincia_id_provincia`, `localidad_provincia_pais_id_pais`),
  INDEX `fk_empleado_localidad1_idx` (`localidad_id_localidad` ASC, `localidad_provincia_id_provincia` ASC, `localidad_provincia_pais_id_pais` ASC) VISIBLE,
  CONSTRAINT `fk_empleado_localidad1`
    FOREIGN KEY (`localidad_id_localidad` , `localidad_provincia_id_provincia` , `localidad_provincia_pais_id_pais`)
    REFERENCES `paises`.`localidad` (`id_localidad` , `provincia_id_provincia` , `provincia_pais_id_pais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

INSERT INTO `paises`.`pais` (`nombre_pais`) VALUES ('argentina');
INSERT INTO `paises`.`pais` (`nombre_pais`) VALUES ('brasil');
INSERT INTO `paises`.`pais` (`nombre_pais`) VALUES ('paraguay');
INSERT INTO `paises`.`pais` (`nombre_pais`) VALUES ('uruguay');
INSERT INTO `paises`.`pais` (`nombre_pais`) VALUES ('chile');
INSERT INTO `paises`.`provincia` (`nombre_provincia`) VALUES ('misiones');
INSERT INTO `paises`.`provincia` (`nombre_provincia`) VALUES ('corrientes');
INSERT INTO `paises`.`provincia` (`nombre_provincia`) VALUES ('cordoba');
INSERT INTO `paises`.`provincia` (`nombre_provincia`) VALUES ('rio grande do sul');
INSERT INTO `paises`.`provincia` (`nombre_provincia`) VALUES ('santa catarina');
INSERT INTO `paises`.`provincia` (`nombre_provincia`) VALUES ('itapúa');
INSERT INTO `paises`.`provincia` (`nombre_provincia`) VALUES ('alto parana');
INSERT INTO `paises`.`provincia` (`nombre_provincia`) VALUES ('canindeyú');
INSERT INTO `paises`.`provincia` (`nombre_provincia`) VALUES ('artigas');
INSERT INTO `paises`.`provincia` (`nombre_provincia`) VALUES ('canelones');
INSERT INTO `paises`.`provincia` (`nombre_provincia`) VALUES ('cerro largo');
INSERT INTO `paises`.`provincia` (`nombre_provincia`) VALUES ('tarapacá');
INSERT INTO `paises`.`provincia` (`nombre_provincia`) VALUES ('antofagasta');
INSERT INTO `paises`.`localidad` (`nombre_localidad`, `codigo_postal`) VALUES ('obera', '3360');
INSERT INTO `paises`.`localidad` (`nombre_localidad`, `codigo_postal`) VALUES ('posadas', '3324');
INSERT INTO `paises`.`localidad` (`nombre_localidad`, `codigo_postal`) VALUES ('meia praia', '1527');
INSERT INTO `paises`.`localidad` (`nombre_localidad`, `codigo_postal`) VALUES ('valparaiso', '3861');
INSERT INTO `paises`.`localidad` (`nombre_localidad`, `codigo_postal`) VALUES ('itaipú', '1587');
INSERT INTO `paises`.`empleado` (`nombre`, `apellido`, `dni`, `telefono`, `email`, `fecha_alta`) VALUES ('alex', 'mazur', '33720606', '3755641094', 'quecharly@hotmail.com', '2016-05-01');
INSERT INTO `paises`.`empleado` (`nombre`, `apellido`, `dni`, `telefono`, `fecha_alta`) VALUES ('juan', 'markovich', '30456789', '3764212121', '2018-08-08');
INSERT INTO `paises`.`empleado` (`nombre`, `apellido`, `dni`, `fecha_alta`) VALUES ('eduardo', 'ferreira', '32887654', '2019-10-10');


-- Ejercicio 3

DROP DATABASE IF EXISTS alquileres_autos;
CREATE DATABASE alquileres_autos CHARACTER SET utf8mb4;
USE alquileres_autos;

CREATE TABLE IF NOT EXISTS `alquileres_autos`.`cliente` (
  `id_cliente` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `dni` INT NOT NULL,
  `apellido` VARCHAR(20) NOT NULL,
  `nombre` VARCHAR(20) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `telefono` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id_cliente`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `alquileres_autos`.`avales` (
  `id_avales` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_cliente_avalado` INT NOT NULL,
  `id_cliente_validador` INT NOT NULL,
  `cliente_id_cliente` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id_avales`, `cliente_id_cliente`),
  INDEX `fk_avales_cliente_idx` (`cliente_id_cliente` ASC) VISIBLE,
  CONSTRAINT `fk_avales_cliente`
    FOREIGN KEY (`cliente_id_cliente`)
    REFERENCES `alquileres_autos`.`cliente` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `alquileres_autos`.`autos` (
  `id_auto` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `matricula` VARCHAR(12) NOT NULL,
  `modelo` VARCHAR(12) NOT NULL,
  `color` VARCHAR(24) NOT NULL,
  `marca` VARCHAR(24) NOT NULL,
  `precio_hora` INT NOT NULL,
  `litros_nafta` INT NOT NULL,
  PRIMARY KEY (`id_auto`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `alquileres_autos`.`reservas` (
  `id_reserva` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `fecha_inicio` DATE NOT NULL,
  `fecha_final` DATE NOT NULL,
  `cliente_id_cliente` INT UNSIGNED NOT NULL,
  `autos_id_auto` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id_reserva`, `cliente_id_cliente`, `autos_id_auto`),
  INDEX `fk_reservas_cliente1_idx` (`cliente_id_cliente` ASC) VISIBLE,
  INDEX `fk_reservas_autos1_idx` (`autos_id_auto` ASC) VISIBLE,
  CONSTRAINT `fk_reservas_cliente1`
    FOREIGN KEY (`cliente_id_cliente`)
    REFERENCES `alquileres_autos`.`cliente` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reservas_autos1`
    FOREIGN KEY (`autos_id_auto`)
    REFERENCES `alquileres_autos`.`autos` (`id_auto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

INSERT INTO `alquileres_autos`.`cliente` (`dni`, `apellido`, `nombre`, `direccion`, `telefono`) VALUES ('33720606', 'mazur', 'alex', 'siempreviva 123', '402323');
INSERT INTO `alquileres_autos`.`cliente` (`dni`, `apellido`, `nombre`, `direccion`, `telefono`) VALUES ('15879654', 'perez', 'juan', 'orca 456', '422222');
INSERT INTO `alquileres_autos`.`cliente` (`dni`, `apellido`, `nombre`, `direccion`, `telefono`) VALUES ('98765432', 'lopez', 'jose', 'mordor 666', '0303456');
INSERT INTO `alquileres_autos`.`autos` (`matricula`, `modelo`, `color`, `marca`, `precio_hora`, `litros_nafta`) VALUES ('OBL679', 'fiesta', 'azul', 'ford', '56', '12');
INSERT INTO `alquileres_autos`.`autos` (`matricula`, `modelo`, `color`, `marca`, `precio_hora`, `litros_nafta`) VALUES ('RDW457', 'escort', 'gris', 'ford', '23', '5');
INSERT INTO `alquileres_autos`.`autos` (`matricula`, `modelo`, `color`, `marca`, `precio_hora`, `litros_nafta`) VALUES ('AF789BB', 'cronos', 'rojo', 'fiat', '75', '23');
INSERT INTO `alquileres_autos`.`avales` (`id_cliente_avalado`, `id_cliente_validador`) VALUES ('2', '1');
INSERT INTO `alquileres_autos`.`avales` (`id_cliente_avalado`, `id_cliente_validador`) VALUES ('3', '2');
