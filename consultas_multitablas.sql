-- Active: 1749052079316@@127.0.0.1@3307@talle_MYSQL

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

