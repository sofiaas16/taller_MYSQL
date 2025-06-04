-- 1. Consulta todos los datos de la tabla `usuarios` para ver la lista completa de clientes.
SELECT * FROM usuarios;

-- 2. Muestra los nombre y correos electrónicos de todos los clientes que residen en la ciudad de Madrid.
SELECT nombre, email FROM usuarios WHERE ciudad = 'Madrid';


--3. Obtén una lista de productos con un precio mayor a $100.000, mostrando solo el nombre y el precio.
SELECT nombre, precio FROM productos WHERE precio > 100000;

--4. Encuentra todos los empleados que tienen un salario superior a $2.500.000, mostrando su nombre, puesto y salario.
SELECT empleados.puesto, empleados.salario, usuarios.nombre 
FROM usuarios
JOIN empleados ON usuarios.usuario_id = empleados.usuario_id
WHERE empleados.salario > 2500000;
