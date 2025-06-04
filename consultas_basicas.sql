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


--5. Lista los nombres de los productos en la categoría "Electrónica", ordenados alfabéticamente.
SELECT nombre FROM productos WHERE categoria = 'Electrónica' ORDER BY nombre ASC;


--6. Muestra los detalles de los pedidos que están en estado "Pendiente", incluyendo el ID del pedido, el ID del cliente y la fecha del pedido.
SELECT pedido_id, cliente_id, fecha_pedido FROM pedidos WHERE estado = 'Pendiente';

--7. Encuentra el nombre y el precio del producto más caro en la base de datos.
SELECT nombre, precio FROM productos
ORDER BY precio DESC
LIMIT 1;

--8. Obtén el total de pedidos realizados por cada cliente, mostrando el ID del cliente y el total de pedidos.
SELECT cliente_id, COUNT(*) FROM pedidos GROUP BY cliente_id





