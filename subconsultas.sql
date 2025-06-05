-- Active: 1749153997759@@127.0.0.1@3307@Taller_MYSQL

--1. Encuentra los nombres de los clientes que han realizado al menos un pedido de más de $500.000.
SELECT u.nombre
FROM usuarios u
WHERE u.usuario_id IN (
    SELECT p.cliente_id
    FROM pedidos p
    JOIN detalles_pedidos dp ON dp.pedido_id = p.pedido_id
    WHERE dp.precio_unitario > 500000
)

--2. Muestra los productos que nunca han sido pedidos.
SELECT p.nombre, p.producto_id
FROM productos p
WHERE p.producto_id NOT IN  (
    SELECT dp.producto_id
    FROM detalles_pedidos dp
      
    )

--3. Lista los empleados que han gestionado pedidos en los últimos 6 meses.
SELECT emp.empleado_id
FROM empleados emp
WHERE emp.empleado_id IN (
    SELECT us.
    FROM usuarios us
)