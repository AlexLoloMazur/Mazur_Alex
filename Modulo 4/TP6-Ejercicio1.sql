-- TP6 Ejercicio 1:

DROP DATABASE IF EXISTS elsistema;
CREATE DATABASE elsistema CHARACTER SET utf8mb4;
USE elsistema;
CREATE TABLE departamentos (
iddepartamento INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
presupuesto DOUBLE UNSIGNED NOT NULL,
estado  boolean NOT NULL
);
CREATE TABLE empleados (
idemplaedo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
cuil_cuit VARCHAR(15) NOT NULL UNIQUE,
nombre VARCHAR(100) NOT NULL,
apellido VARCHAR(100) NOT NULL,
id_departamento INT UNSIGNED,
estado BOOLEAN,
FOREIGN KEY (id_departamento) REFERENCES departamentos(iddepartamento)
);
CREATE TABLE clientes (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(30) NOT NULL,
apellido VARCHAR(30) NOT NULL,
cuitcuil VARCHAR(20),
ciudad VARCHAR(100),
categoría INT UNSIGNED
);
CREATE TABLE vendedores (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(30) NOT NULL,
apellido VARCHAR(30) NOT NULL,
cuitcuil VARCHAR(20),
comisión FLOAT
);
CREATE TABLE pedidos (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
cantidad DOUBLE NOT NULL,
fecha DATE,
id_cliente INT UNSIGNED NOT NULL,
id_vendedor INT UNSIGNED NOT NULL,
FOREIGN KEY (id_cliente) REFERENCES clientes(id),
FOREIGN KEY (id_vendedor) REFERENCES vendedores(id)
);

-- 1. Agregar las entidades paises (id, nombre), provincias (id, nombre, idpais) y localidades (id,nombre, cp,id_provincia).
-- Tener en cuenta que: ●En un país hay muchas provincias. ●En una provincia hay muchas localidades.
CREATE TABLE paises (
id_pais INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(20) NOT NULL UNIQUE,
estado BOOLEAN
);
CREATE TABLE provincias (
id_provincia INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(20) NOT NULL,
estado BOOLEAN,
id_pais INT UNSIGNED,
FOREIGN KEY (id_pais) REFERENCES paises(id_pais)
);
CREATE TABLE localidades (
id_localidad INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(20) NOT NULL,
cp INT NOT NULL,
id_provincia INT UNSIGNED,
estado BOOLEAN,
FOREIGN KEY (id_provincia) REFERENCES provincias(id_provincia)
);

-- 2. Modificar la tabla empleados usando ALTER TABLE y agregar los campos: ●direccion (varchar) 
-- ●id_localidad (pk localidad) –Esta es un relación con la tabla localidades ●email ●telefono ●fecha_ingreso ●tms (timestamp)
ALTER TABLE `elsistema`.`empleados` 
ADD COLUMN `direccion` VARCHAR(45) NULL AFTER `estado`,
ADD COLUMN `id_localidad` INT NOT NULL AFTER `direccion`,
ADD COLUMN `email` VARCHAR(45) NULL AFTER `id_localidad`,
ADD COLUMN `telefono` BIGINT NULL AFTER `email`,
ADD COLUMN `fecha_ingreso` DATE NOT NULL AFTER `telefono`,
ADD COLUMN `tms` TIMESTAMP NULL AFTER `fecha_ingreso`;

ALTER TABLE empleados
MODIFY id_localidad INT UNSIGNED NOT NULL;

ALTER TABLE empleados
add FOREIGN KEY (id_localidad)
REFERENCES localidades (id_localidad);

-- 3. Modificar la tabla de departamentos  usando ALTER TABLE y agregar los campos: ●gasto (double) ●tms (timestamp)
ALTER TABLE `elsistema`.`departamentos` 
ADD COLUMN `gasto` DOUBLE NULL AFTER `presupuesto`,
ADD COLUMN `tms` TIMESTAMP NULL AFTER `gasto`;

-- 4. Insertar 5 registros en cada tabla de: paises, provincias, localidades, departamentos, empleados.
INSERT INTO `elsistema`.`paises` (`nombre`,`estado`) VALUES ('argentina','1');
INSERT INTO `elsistema`.`paises` (`nombre`,`estado`) VALUES ('brasil','1');
INSERT INTO `elsistema`.`paises` (`nombre`,`estado`) VALUES ('paraguay','1');
INSERT INTO `elsistema`.`paises` (`nombre`,`estado`) VALUES ('uruguay','1');
INSERT INTO `elsistema`.`paises` (`nombre`,`estado`) VALUES ('chile','1');
INSERT INTO `elsistema`.`provincias` (`nombre`,`estado`,`id_pais`) VALUES ('misiones','1','1');
INSERT INTO `elsistema`.`provincias` (`nombre`,`estado`,`id_pais`) VALUES ('corrientes','1','1');
INSERT INTO `elsistema`.`provincias` (`nombre`,`estado`,`id_pais`) VALUES ('cordoba','1','1');
INSERT INTO `elsistema`.`provincias` (`nombre`,`estado`,`id_pais`) VALUES ('rio grande do sul','1','2');
INSERT INTO `elsistema`.`provincias` (`nombre`,`estado`,`id_pais`) VALUES ('santa catarina','1','2');
INSERT INTO `elsistema`.`provincias` (`nombre`,`estado`,`id_pais`) VALUES ('itapua','1','4');
INSERT INTO `elsistema`.`provincias` (`nombre`,`estado`,`id_pais`) VALUES ('alto parana','1','4');
INSERT INTO `elsistema`.`provincias` (`nombre`,`estado`,`id_pais`) VALUES ('cerro largo','1','5');
INSERT INTO `elsistema`.`provincias` (`nombre`,`estado`,`id_pais`) VALUES ('antofagasta','1','3');
INSERT INTO `elsistema`.`provincias` (`nombre`,`estado`,`id_pais`) VALUES ('tarapaca','1','3');
INSERT INTO `elsistema`.`localidades` (`nombre`,`cp`,`id_provincia`,`estado`) VALUES ('obera','3360','1','1');
INSERT INTO `elsistema`.`localidades` (`nombre`,`cp`,`id_provincia`,`estado`) VALUES ('posadas','3360','1','1');
INSERT INTO `elsistema`.`localidades` (`nombre`,`cp`,`id_provincia`,`estado`) VALUES ('meia praia','3360','5','1');
INSERT INTO `elsistema`.`localidades` (`nombre`,`cp`,`id_provincia`,`estado`) VALUES ('valparaiso','3360','9','1');
INSERT INTO `elsistema`.`localidades` (`nombre`,`cp`,`id_provincia`,`estado`) VALUES ('itaipu','3360','6','1');
INSERT INTO `elsistema`.`departamentos` (`nombre`,`presupuesto`,`gasto`,`estado`) VALUES ('recursos humanos','280000','280000','1');
INSERT INTO `elsistema`.`departamentos` (`nombre`,`presupuesto`,`gasto`,`estado`) VALUES ('desarrollo','120000','105000','1');
INSERT INTO `elsistema`.`departamentos` (`nombre`,`presupuesto`,`gasto`,`estado`) VALUES ('sistemas','150000','110000','1');
INSERT INTO `elsistema`.`departamentos` (`nombre`,`presupuesto`,`gasto`,`estado`) VALUES ('contabilidad','110000','10000','1');
INSERT INTO `elsistema`.`departamentos` (`nombre`,`presupuesto`,`gasto`,`estado`) VALUES ('I+D','375000','200000','1');
INSERT INTO `elsistema`.`empleados` (`cuil_cuit`, `nombre`, `apellido`, `id_departamento`, `estado`, `direccion`, `id_localidad`, `fecha_ingreso`) VALUES ('23-3372060-9', 'alex', 'mazur', '3', '1', 'calle siempreviva 123', '1', '2020-05-01');
INSERT INTO `elsistema`.`empleados` (`cuil_cuit`, `nombre`, `apellido`, `id_departamento`, `estado`, `direccion`, `id_localidad`, `email`, `fecha_ingreso`) VALUES ('12-15998778-5', 'homero', 'simpson', '4', '1', 'mordor 666', '2', 'tucorreo@electronico.com', '2021-12-12');
INSERT INTO `elsistema`.`empleados` (`cuil_cuit`, `nombre`, `apellido`, `id_departamento`, `estado`, `direccion`, `id_localidad`, `telefono`, `fecha_ingreso`) VALUES ('20-92884578-7', 'carmen', 'sandiego', '2', '1', 'shadol ghul 321', '3', NULL, '2020-03-20');
INSERT INTO `elsistema`.`empleados` (`cuil_cuit`, `nombre`, `apellido`, `id_departamento`, `estado`, `direccion`, `id_localidad`, `email`, `fecha_ingreso`) VALUES ('15-98765432-1', 'elba', 'tracio', '1', '1', 'san luis 4263', '4', 'mail@mail.com', '2022-01-01');
INSERT INTO `elsistema`.`empleados` (`cuil_cuit`, `nombre`, `apellido`, `id_departamento`, `estado`, `direccion`, `id_localidad`, `telefono`, `fecha_ingreso`) VALUES ('23-40356894-5', 'pablo', 'perez', '3', '1', 'orcadas 225', '2', NULL, '2021-08-01');

-- 5. Modificar el nombre de la tabla “pedidos” por “movimientos”. RENAME TABLE
RENAME TABLE pedidos TO movimientos;

-- 6. Agregar las entidades: 
-- ●Proveedores (id, razon_social, nombre, apellido, naturaleza (fisica o juridica), cuit, id_localidad fk, estado,tms)
-- ●Marcas (id, nombre, descripción, imagen, id_proveedor, estado, tms)
-- ●Productos (id, nombre, descripcion, id_marca fk, stock, precio, estado, tms)
-- ●Cajas (id,horainicio(datatime),horacierre(datatime), estado, tms)
CREATE TABLE proveedores (
id_proveedor INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
razon_social VARCHAR(45) NOT NULL,
nombre VARCHAR(25) NOT NULL,
apellido VARCHAR(25) NOT NULL,
naturaleza ENUM('F','J') NULL DEFAULT 'J',
cuit BIGINT NOT NULL,
id_localidad INT UNSIGNED NOT NULL,
estado BOOLEAN,
tms TIMESTAMP NULL,
FOREIGN KEY (id_localidad) REFERENCES localidades(id_localidad)
);

ALTER TABLE `elsistema`.`proveedores` 
CHANGE COLUMN `naturaleza` `naturaleza` ENUM('Fisica', 'Juridica', 'F', 'J') NULL DEFAULT 'J' ,
CHANGE COLUMN `cuit` `cuit` VARCHAR(15) NOT NULL ;

ALTER TABLE `elsistema`.`proveedores` 
ADD UNIQUE INDEX `cuit_UNIQUE` (`cuit` ASC) VISIBLE;
;

CREATE TABLE marcas (
id_marca INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(45) NOT NULL,
descripcion VARCHAR(75) NULL,
imagen MEDIUMBLOB NULL,
id_proveedor INT UNSIGNED NOT NULL,
estado BOOLEAN,
tms TIMESTAMP NULL,
FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor)
);
CREATE TABLE productos (
id_producto INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(45) NOT NULL,
descripcion VARCHAR(75) NULL,
id_marca INT UNSIGNED NOT NULL,
stock INT NULL,
precio INT NULL,
estado BOOLEAN,
tms TIMESTAMP NULL,
FOREIGN KEY (id_marca) REFERENCES marcas(id_marca)
);
CREATE TABLE cajas (
id_caja INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
hora_inicio DATETIME NULL,
hora_cierre DATETIME NULL,
estado BOOLEAN,
tms TIMESTAMP NULL
);

-- 7. Insertar 5 registros en cada tabla del punto 6. Tener en cuenta que el script debe ejecutarse secuencialmente y no fallar.
INSERT INTO `elsistema`.`proveedores` (`razon_social`, `nombre`, `apellido`, `naturaleza`, `cuit`, `id_localidad`, `estado`) VALUES ('Total distribuciones', 'juan pablo', 'koch', 'J', '20-15236478-5', '1', '1');
INSERT INTO `elsistema`.`proveedores` (`razon_social`, `nombre`, `apellido`, `naturaleza`, `cuit`, `id_localidad`, `estado`) VALUES ('econor', 'pedro', 'andueza', 'J', '20-15748258-9', '1', '1');
INSERT INTO `elsistema`.`proveedores` (`razon_social`, `nombre`, `apellido`, `naturaleza`, `cuit`, `id_localidad`, `estado`) VALUES ('dinco', 'mario', 'dini', 'J', '20-32654987-1', '1', '1');
INSERT INTO `elsistema`.`proveedores` (`razon_social`, `nombre`, `apellido`, `naturaleza`, `cuit`, `id_localidad`, `estado`) VALUES ('maxiconsumo', 'maxi', 'consumo', 'J', '20-98765432-1', '2', '1');
INSERT INTO `elsistema`.`proveedores` (`razon_social`, `nombre`, `apellido`, `naturaleza`, `cuit`, `id_localidad`, `estado`) VALUES ('koch atacadista', 'joao', 'preto', 'J', '45-235689-4', '3', '1');
INSERT INTO `elsistema`.`marcas` (`id_marca`, `nombre`, `descripcion`, `id_proveedor`, `estado`) VALUES ('1', 'coca cola', 'gaseosas cola', '2', '1');
INSERT INTO `elsistema`.`marcas` (`id_marca`, `nombre`, `descripcion`, `id_proveedor`, `estado`) VALUES ('2', 'fanta', 'gaseosas frutales', '2', '1');
INSERT INTO `elsistema`.`marcas` (`id_marca`, `nombre`, `descripcion`, `id_proveedor`, `estado`) VALUES ('3', 'pepsi', 'gaseosas cola', '1', '1');
INSERT INTO `elsistema`.`marcas` (`id_marca`, `nombre`, `descripcion`, `id_proveedor`, `estado`) VALUES ('4', 'mirinda', 'gaseosas frutales', '1', '1');
INSERT INTO `elsistema`.`marcas` (`id_marca`, `nombre`, `descripcion`, `id_proveedor`, `estado`) VALUES ('5', 'antarctica', 'gaseosa guarana', '5', '1');
INSERT INTO `elsistema`.`productos` (`nombre`, `descripcion`, `id_marca`, `stock`, `precio`, `estado`) VALUES ('coca cola 2.25', 'gaseosa cola 2.25L', '1', '100', '400', '1');
INSERT INTO `elsistema`.`productos` (`nombre`, `descripcion`, `id_marca`, `stock`, `precio`, `estado`) VALUES ('pepsi 2.25', 'gaseosa cola 2.25L', '3', '100', '350', '1');
INSERT INTO `elsistema`.`productos` (`nombre`, `descripcion`, `id_marca`, `stock`, `precio`, `estado`) VALUES ('fanta naranja 2.25', 'gaseosa sabor naranja 2.25L', '2', '100', '350', '1');
INSERT INTO `elsistema`.`productos` (`nombre`, `descripcion`, `id_marca`, `stock`, `precio`, `estado`) VALUES ('mirinda naranja 2.25', 'gaseosa sabor naranja 2.25L', '4', '100', '300', '1');
INSERT INTO `elsistema`.`productos` (`nombre`, `descripcion`, `id_marca`, `stock`, `precio`, `estado`) VALUES ('guarana antarctica 2.25L', 'gaseosa sabor guarana 2.25L', '5', '100', '400', '1');
INSERT INTO `elsistema`.`cajas` (`id_caja`, `hora_inicio`, `hora_cierre`, `estado`) VALUES ('1', '2022-08-01 08:00', '2022-08-01 12:00', '0');
INSERT INTO `elsistema`.`cajas` (`hora_inicio`, `hora_cierre`, `estado`) VALUES ('2022-08-01 16:00', '2022-08-01 20:00', '0');
INSERT INTO `elsistema`.`cajas` (`hora_inicio`, `hora_cierre`, `estado`) VALUES ('2022-08-02 08:00', '2022-08-02 12:00', '0');
INSERT INTO `elsistema`.`cajas` (`hora_inicio`, `hora_cierre`, `estado`) VALUES ('2022-08-02 16:00', '2022-08-02 20:00', '0');
INSERT INTO `elsistema`.`cajas` (`hora_inicio`, `hora_cierre`, `estado`) VALUES ('2022-08-03 08:00', '2022-08-03 12:00', '0');
INSERT INTO `elsistema`.`cajas` (`hora_inicio`, `hora_cierre`, `estado`) VALUES ('2022-08-03 16:00', '2022-08-03 20:00', '0');

-- 8. Listar el nombre, presupuesto, gastos y diferencia(presupuesto-gasto) de todos los departamentos con estado activo o 1.
SELECT Nombre, Presupuesto, (presupuesto-gasto) as Diferencia FROM departamentos where estado =1;

-- 9. Listar todas todas las localidades agrupadas por pais. En la vista se deberia ver el nombre del pais y el nombre de la localidad
SELECT UCASE(loc.nombre) Localidad, UCASE(pa.nombre) País FROM elsistema.paises AS pa
JOIN elsistema.provincias AS pro ON pa.id_pais = pro.id_pais 
JOIN elsistema.localidades AS loc ON pro.id_provincia = loc.id_provincia GROUP BY pa.nombre, loc.nombre;

-- 10. Modificar (UPADTE):
-- ●el telefono de un empleado cuando el id es igual a uno que hayan declarado.
-- ●la fecha_ingreso y la localidad de otro empleado.
UPDATE `elsistema`.`empleados` SET `telefono` = '3755422222' WHERE (`idemplaedo` = '3');
UPDATE `elsistema`.`empleados` SET `id_localidad` = '5', `fecha_ingreso` = '2021-07-01' WHERE (`idemplaedo` = '5');

-- 11. Insertar 5 vendedores.
INSERT INTO `elsistema`.`vendedores` (`nombre`, `apellido`, `cuitcuil`, `comisión`) VALUES ('eduardo', 'ferreira', '25-14254879-2', '1.5');
INSERT INTO `elsistema`.`vendedores` (`nombre`, `apellido`, `cuitcuil`, `comisión`) VALUES ('esteban', 'gonzalez', '22-13698547-5', '1.2');
INSERT INTO `elsistema`.`vendedores` (`nombre`, `apellido`, `cuitcuil`, `comisión`) VALUES ('leonardo', 'cortez', '21-23569852-4', '1.4');
INSERT INTO `elsistema`.`vendedores` (`nombre`, `apellido`, `cuitcuil`, `comisión`) VALUES ('luciana', 'estrade', '20-45857214-6', '1.3');
INSERT INTO `elsistema`.`vendedores` (`nombre`, `apellido`, `cuitcuil`, `comisión`) VALUES ('santiago', 'atencio', '23-78523654-7', '1.6');

-- 12. Modificar la tabla movimientos y agregar los campos: id_producto fk, estado, tms(timestamp), tipo_movimiento (ingreso, egreso, pedido).
ALTER TABLE `elsistema`.`movimientos`
add column `id_producto` INT UNSIGNED NOT NULL AFTER `id_vendedor`,
add column `estado` BOOLEAN AFTER `id_producto`,
add column `tms` TIMESTAMP NULL AFTER `estado`,
add column `tipo_movimiento` ENUM('ingreso', 'egreso', 'pedido') NOT NULL AFTER `tms`,
add FOREIGN KEY (id_producto) REFERENCES productos(id_producto);

-- 13. Insertar 5 movimientos distintos.
INSERT INTO `elsistema`.`clientes` (`nombre`, `apellido`) VALUES ('esteban', 'quito');
INSERT INTO `elsistema`.`clientes` (`nombre`, `apellido`) VALUES ('elsa', 'pato');
INSERT INTO `elsistema`.`clientes` (`nombre`, `apellido`) VALUES ('yatumoto', 'nokamina');
INSERT INTO `elsistema`.`movimientos` (`cantidad`, `id_cliente`, `id_vendedor`, `id_producto`, `estado`, `tipo_movimiento`) VALUES ('50', '1', '1', '1', '1', 'entrada');
INSERT INTO `elsistema`.`movimientos` (`cantidad`, `id_cliente`, `id_vendedor`, `id_producto`, `estado`, `tipo_movimiento`) VALUES ('50', '2', '2', '2', '1', 'entrada');
INSERT INTO `elsistema`.`movimientos` (`cantidad`, `id_cliente`, `id_vendedor`, `id_producto`, `estado`, `tipo_movimiento`) VALUES ('50', '3', '3', '3', '1', 'entrada');
INSERT INTO `elsistema`.`movimientos` (`cantidad`, `id_cliente`, `id_vendedor`, `id_producto`, `estado`, `tipo_movimiento`) VALUES ('50', '2', '4', '4', '1', 'entrada');
INSERT INTO `elsistema`.`movimientos` (`cantidad`, `id_cliente`, `id_vendedor`, `id_producto`, `estado`, `tipo_movimiento`) VALUES ('50', '1', '5', '5', '1', 'entrada');

-- 14. Borrar lógicamente (UPDATE de la columna estado):
-- ●2 movimientos que fueron cargados mal
-- ●un pais que tenga al menos 3 localidades
UPDATE `elsistema`.`movimientos` SET `estado` = '0' WHERE (`id` = '2');
UPDATE `elsistema`.`movimientos` SET `estado` = '0' WHERE (`id` = '4');
UPDATE `elsistema`.`paises` SET `estado` = '0' WHERE (`id_pais` = '1');

-- 15. Modificar el campo stock de la tabla productos teniendo en cuenta la cantidad de la tablade movimientos. Sumar el stock si es un 
-- ingreso, restar si es un egreso. Esto hacerlo de manera manual en base los 5 movimientos insertados en el punto 13. Es decir deben haber
-- 5 updates de la tabla producto.
UPDATE `elsistema`.`productos` SET `stock` = '150' WHERE (`id_producto` = '1');
UPDATE `elsistema`.`productos` SET `stock` = '150' WHERE (`id_producto` = '2');
UPDATE `elsistema`.`productos` SET `stock` = '150' WHERE (`id_producto` = '3');
UPDATE `elsistema`.`productos` SET `stock` = '150' WHERE (`id_producto` = '4');
UPDATE `elsistema`.`productos` SET `stock` = '150' WHERE (`id_producto` = '5');
-- movimientos dados de baja logicamente
UPDATE `elsistema`.`productos` SET `stock` = '100' WHERE (`id_producto` = '2');
UPDATE `elsistema`.`productos` SET `stock` = '100' WHERE (`id_producto` = '4');

-- 16. Cear la tabla parametros (id, tms,cosas(json), id_usuario)
CREATE TABLE parametros (
id_parametro INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
tms TIMESTAMP NULL,
cosas JSON NULL,
id_usuario INT NULL
);

-- 17. Insertar en la tabla parametros teniendo en cuenta la columna cosas:
-- ●{"idDeLaCosa": 101, "permisos": "PUT, GET"}
-- ●{"vistasPermitidas":"menuPrincipal,menuSecundario,ventas,estadisticaVentas,listaCliente", "grupo": "ventas"}
-- ●{"zonaHoraria": "America/Argentina/BuenosAires"}
-- ●{"fechaInicioActividades": 01/01/2019, "mesAperturaCaja": "Enero", "mesCierreCaja":"Diciembre"}
-- ●{"balancesAniosAnteriores": {"2019": {"ingreso": "7374901.93","egreso":"3732538,75"},
-- "2020":{"ingreso": "27442665,12","egreso": "8522331,82"},"2021": {"ingreso":"31634912,57","egreso": "9757142,66"}}}
-- Nota: Rellenar a criterio los campos id, tms,id_usuario
INSERT INTO `elsistema`.`parametros` (`id_parametro`, `cosas`, `id_usuario`)
VALUES 
(1,'{"idDeLaCosa": 101, "permisos": "PUT, GET"}','1'),
(2,'{"vistasPermitidas": "menuPrincipal,menuSecundario,ventas,estadisticaVentas,listaCliente", "grupo": "ventas"}','2'),
(3,'{"zonaHoraria": "America/Argentina/BuenosAires"}','3'),
(4,'{"fechaInicioActividades": "01/01/2019", "mesAperturaCaja": "Enero", "mesCierreCaja": "Diciembre"}','4'),
(5,'{"balancesAniosAnteriores": {"2019": {"ingreso": "7374901.93", "egreso": "3732538.75"}, "2020":{"ingreso": "27442665.12", "egreso": "8522331.82"},"2021": {"ingreso":"31634912.57", "egreso": "9757142.66"}}}','5');