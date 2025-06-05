-- Active: 1749153997759@@127.0.0.1@3307@Taller_MYSQL

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

--11. Listar todos los proveedores que suministran un determinado producto.
SELECT proveedores.nombre AS proveedoresNombre, productos.nombre AS productosNombre
FROM proveedores 
JOIN proveedores_productos 
ON proveedores.proveedor_id = proveedores_productos.proveedor_id
JOIN productos
ON productos.producto_id = proveedores_productos.producto_id
WHERE productos.nombre = 'Televisor';

--12. Obtener todos los productos que ofrece un proveedor específico.
SELECT productos.nombre, proveedores.nombre
FROM productos
JOIN proveedores_productos
ON productos.producto_id = proveedores_productos.producto_id
JOIN proveedores
ON proveedores.proveedor_id = proveedores_productos.proveedor_id
WHERE proveedores.nombre = 'Tech Supplies S.A.';

--13. Lista los proveedores que no están asociados a ningún producto (es decir, que aún no suministran).
SELECT proveedores.nombre
FROM proveedores
LEFT JOIN proveedores_productos 
ON proveedores.proveedor_id = proveedores_productos.proveedor_id
WHERE producto_id IS NULL ;

--14. Contar cuántos proveedores tiene cada producto.
SELECT COUNT(proveedores.nombre) AS proveedoresNom, productos.nombre
FROM proveedores
LEFT JOIN proveedores_productos
ON proveedores.proveedor_id = proveedores_productos.proveedor_id
LEFT JOIN productos
ON productos.producto_id = proveedores_productos.producto_id
GROUP BY productos.nombre;

--15. Para un proveedor determinado (p. ej. `proveedor_id = 3`), muestra el nombre de todos los productos que suministra.
SELECT productos.nombre, COUNT(proveedores_productos.proveedor_id) 
FROM productos
JOIN proveedores_productos
ON productos.producto_id = proveedores_productos.producto_id
GROUP BY productos.nombre;

--16. Para un producto específico (p. ej. `producto_id = 1`), muestra todos los proveedores que lo distribuyen, con sus datos de contacto.
SELECT p2.producto_id,  p2.nombre, p.*
FROM proveedores p
JOIN proveedores_productos pp 
ON pp.proveedor_id = p.proveedor_id
JOIN productos p2
ON p2.producto_id = pp.producto_id 
WHERE p2.producto_id = 2;


--17. Cuenta cuántos proveedores tiene cada producto, listando `producto_id`, `nombre` y `cantidad_proveedores`.
SELECT 
FROM 
JOIN 