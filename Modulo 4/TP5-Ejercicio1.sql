-- Ejercicio 1:

-- 1. Lista el apellido de todos los empleados.
SELECT empleados.apellido FROM sistema.empleados;

-- 2. Lista el apellido de los empleados eliminando los apellidos que estén repetidos.
SELECT empleados.apellido FROM sistema.empleados group by empleados.apellido;

-- 3. Lista todas las columnas de la tabla empleados.
Select * from sistema.empleados;

-- 4. Lista el nombre y apellido de todos los empleados.
SELECT nombre, apellido FROM sistema.empleados;

-- 5. Lista el cuit/cuil de los empleados que aparecen en la tabla empleados.
SELECT cuil_cuit FROM sistema.empleados;

-- 6. Lista el nombre y apellido de los empleados en una única columna.
SELECT concat_ws(' ', nombre, apellido) as Empleado FROM empleados;

-- 7. Lista el nombre y apellido de los empleados en una única columna, convirtiendo todos los caracteres en mayúscula.
SELECT ucase(concat_ws(' ', nombre, apellido)) as Empleado FROM empleados;

-- 8. Lista el nombre y apellido de los empleados en una única columna, convirtiendo todos los caracteres en minúscula.
SELECT Lcase(concat_ws(' ', nombre, apellido)) as Empleado FROM empleados;

-- 9. Lista el nombre de los departamentos y el valor del presupuesto actual ordenado de forma ascendente.
SELECT d.nombre FROM sistema.departamentos as d order by presupuesto asc;

-- 10. Lista el nombre de todos los departamentos ordenados de forma ascendente.
SELECT d.nombre FROM sistema.departamentos as d order by nombre asc;

-- 11. Lista el nombre de todos los departamentos ordenados de forma descendente.
SELECT d.nombre FROM sistema.departamentos as d order by nombre desc;

-- 12. Lista el apellido y el nombre de todos los empleados, ordenados de forma alfabética
-- teniendo en cuenta en primer lugar su apellido y luego su nombre.
select e.nombre as Nombre, e.apellido as Apellido from sistema.empleados as e order by apellido asc;

-- 13. Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos que tienen mayor presupuesto.
SELECT d.nombre, d.presupuesto FROM sistema.departamentos as d order by presupuesto desc limit 3;

-- 14. Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos que tienen menor presupuesto.
SELECT d.nombre, d.presupuesto FROM sistema.departamentos as d order by presupuesto asc limit 3;

-- 15. Devuelve una lista con el nombre de los departamentos y el presupuesto, de aquellos que tienen un presupuesto mayor o igual a $150000.
SELECT d.nombre, d.presupuesto FROM sistema.departamentos as d where d.presupuesto >=150000;

-- 16. Devuelve una lista con el nombre de los departamentos y el presupuesto, de aquellos que
-- tienen un presupuesto entre $100000 y $200000. Sin utilizar el operador BETWEEN.
SELECT d.nombre, d.presupuesto FROM sistema.departamentos as d where d.presupuesto >100000 and d.presupuesto <200000;

-- 17. Devuelve una lista con el nombre de los departamentos que no tienen un presupuesto
-- entre $100000 y $200000. Sin utilizar el operador BETWEEN.
SELECT d.nombre, d.presupuesto FROM sistema.departamentos as d where d.presupuesto <100000 or d.presupuesto >200000;

-- 18. Devuelve una lista con el nombre de los departamentos que tienen un presupuesto entre $100000 y $200000. Utilizando el operador BETWEEN
SELECT d.nombre, d.presupuesto FROM sistema.departamentos as d where d.presupuesto between 100000 and 200000;

-- 19. Devuelve una lista con el nombre de los departamentos que no tienen un presupuesto
-- entre $100000 y $200000. Utilizando el operador BETWEEN.
SELECT d.nombre, d.presupuesto FROM sistema.departamentos as d where d.presupuesto not between 100000 and 200000;

-- 20. Devuelve un listado con los empleados y los datos de los departamentos donde trabaja cada uno.
select e.nombre, e.apellido, d.nombre from sistema.empleados as e
inner join sistema.departamentos as d where e.id_departamento = d.iddepartamento;

-- 21. Devuelve un listado con los empleados y los datos de los departamentos donde trabaja cada
-- uno. Ordena el resultado, en primer lugar por el nombre del departamento (en orden alfabético)
-- y en segundo lugar por apellido y el nombre de los empleados
select e.Nombre, e.Apellido, d.Nombre from sistema.empleados as e
inner join sistema.departamentos as d where e.id_departamento = d.iddepartamento order by d.nombre asc, e.apellido asc;

-- 22. Devuelve un listado con el código y el nombre del departamento, solamente de aquellos departamentos que tienen empleados.
select d.iddepartamento as ID, d.Nombre from sistema.departamentos as d
join sistema.empleados as e where e.id_departamento = d.iddepartamento group by d.nombre;

-- 23. Devuelve el nombre del departamento donde trabaja el empleado que tiene el cuit 27-38382980-3.
select d.Nombre Departamento, e.Apellido, e.Nombre from sistema.departamentos as d
join sistema.empleados as e where e.id_departamento = d.iddepartamento and e.cuil_cuit like '27-3838%';

-- 24. Devuelve el nombre del departamento donde trabaja el empleado Pepe Ruiz.
select d.Nombre Departamento, e.Apellido, e.Nombre from sistema.departamentos as d
join sistema.empleados as e where e.id_departamento = d.iddepartamento and e.nombre like 'pepe%';

-- 25. Devuelve un listado con los datos de los empleados que trabajan en el departamento de I+D. Ordena el resultado alfabéticamente.
select e.idemplaedo as ID, e.Apellido, e.Nombre, e.Cuil_Cuit, d.nombre as Departamento from sistema.empleados as e
join sistema.departamentos as d where e.id_departamento = d.iddepartamento and d.iddepartamento=5 order by e.apellido asc;

-- 26. Devuelve un listado con los datos de los empleados que trabajan en el departamento de Sistemas, Contabilidad o I+D.
-- Ordena el resultado alfabéticamente.
select e.idemplaedo as ID, e.Apellido, e.Nombre, e.Cuil_Cuit, d.nombre as Departamento from sistema.empleados as e
join sistema.departamentos as d where e.id_departamento = d.iddepartamento and d.iddepartamento in ('2', '4', '5') order by e.apellido asc;

-- 27. Devuelve una lista con el nombre de los empleados que tienen los departamentos que no tienen un presupuesto entre $100000 y $200000.
select e.Apellido, e.Nombre, d.nombre as Departamento from sistema.empleados as e
join sistema.departamentos as d where e.id_departamento = d.iddepartamento and d.presupuesto not between 100000 and 200000 order by e.apellido asc;