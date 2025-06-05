-- Active: 1749075873268@@127.0.0.1@3307@MYSQL_TALLER

--1. Encuentra los nombres de los clientes y los detalles de sus pedidos.
SELECT usuarios.nombre, detalles_pedidos.pedido_id, detalles_pedidos.producto_id 
FROM usuarios
JOIN pedidos ON pedidos.cliente_id = usuarios.usuario_id
JOIN detalles_pedidos ON detalles_pedidos.pedido_id = pedidos.pedido_id;

--2. Lista todos los productos pedidos junto con el precio unitario de cada pedido.
SELECT p.pedido_id, GROUP_CONCAT(CONCAT(po.nombre,  ',',po.categoria)) AS productos, SUM(dp.cantidad * dp.precio_unitario) as Total
FROM pedidos AS p   
INNER JOIN detalles_pedidos AS dp ON p.pedido_id = dp.pedido_id
INNER JOIN productos AS po ON dp.producto_id = po.producto_id
GROUP BY p.pedido_id;

--3. Encuentra los nombres de los clientes y los nombres de los empleados que gestionaron sus pedidos.
SELECT c.nombre AS nombre_cliente, e.nombre AS nombre_empleado
FROM pedidos AS p
INNER JOIN usuarios AS c ON p.cliente_id = c.usuario_id
INNER JOIN empleados AS emp ON p.empleado_id = emp.empleado_id
INNER JOIN usuarios AS e ON emp.usuario_id = e.usuario_id

--4. Muestra todos los pedidos y, si existen, los productos en cada pedido, incluyendo los pedidos sin productos usando `LEFT JOIN`
SELECT productos.nombre AS ProductoNom, pedidos.cliente_id AS Cliente_id, pedidos.empleado_id AS Empleado_id,
detalles_pedidos.cantidad AS CantidadPedidos, pedidos.fecha_pedido AS FechaPedido, pedidos.estado AS EstadoPedidos
FROM pedidos
LEFT JOIN detalles_pedidos
ON pedidos.pedido_id = detalles_pedidos.pedido_id
LEFT JOIN productos
ON detalles_pedidos.producto_id = productos.producto_id;

--5. Encuentra los productos y, si existen, los detalles de pedidos en los que no se ha incluido el producto usando `RIGHT JOIN`.
SELECT productos.producto_id, productos.nombre AS nombre, productos.precio AS precio, 
detalles_pedidos.cantidad AS cantidad, detalles_pedidos.detalle_id AS detallePedido_id
FROM detalles_pedidos
RIGHT JOIN productos
ON detalles_pedidos.producto_id = productos.producto_id;

--6. Lista todos los empleados junto con los pedidos que han gestionado, si existen, usando `LEFT JOIN` para ver los empleados sin pedidos.
SELECT empleados.empleado_id, empleados.puesto AS puesto, empleados.fecha_contratacion AS contratacion,
empleados.salario AS salario, pedidos.fecha_pedido AS fecha, pedidos.estado AS estado
FROM empleados
LEFT JOIN pedidos
ON empleados.empleado_id = pedidos.empleado_id;

--7. Encuentra los empleados que no han gestionado ningún pedido usando un `LEFT JOIN` combinado con `WHERE`.
SELECT empleados.empleado_id, empleados.puesto AS puesto, empleados.fecha_contratacion AS contratacion, empleados.salario AS salario,
pedidos.fecha_pedido AS fechaPedido, pedidos.estado As estado
FROM empleados
LEFT JOIN pedidos
ON empleados.empleado_id = pedidos.empleado_id
WHERE pedidos.fecha_pedido IS NULL AND pedidos.estado IS NULL;

--8. Calcula el total gastado en cada pedido, mostrando el ID del pedido y el total, usando `JOIN`.
SELECT p.pedido_id, 
    SUM(dp.precio_unitario * dp.cantidad) AS Total
FROM pedidos AS p
JOIN detalles_pedidos AS dp ON p.pedido_id = dp.pedido_id
GROUP BY p.pedido_id;

--9. Realiza un `CROSS JOIN` entre clientes y productos para mostrar todas las combinaciones posibles de clientes y productos.
SELECT *
FROM usuarios 
CROSS JOIN productos;

--10. Encuentra los nombres de los clientes y los productos que han comprado, si existen, 
--incluyendo los clientes que no han realizado pedidos usando `LEFT JOIN`.
SELECT usuarios.nombre AS nombre, pedidos.pedido_id AS pedidos
FROM usuarios
LEFT JOIN pedidos
ON usuarios.usuario_id = pedidos.pedido_id;
