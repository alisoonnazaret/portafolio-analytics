-- ================================================
-- PROYECTO 2: SQL Ecommerce Analysis
-- Alisoon Nazaret Lopez | Data Analytics Portfolio
-- ================================================

-- 1. Top 10 clientes por ventas totales
SELECT customer_id,
       SUM(sales) AS total_ventas
FROM orders
GROUP BY customer_id
ORDER BY total_ventas DESC
LIMIT 10;

-- 2. Ventas por categoría de producto
SELECT category,
       COUNT(order_id) AS total_pedidos,
       ROUND(SUM(sales), 2) AS ingresos
FROM orders
GROUP BY category
ORDER BY ingresos DESC;

-- 3. Tendencia mensual de ventas
SELECT DATE_FORMAT(order_date, '%Y-%m') AS mes,
       COUNT(order_id) AS pedidos,
       ROUND(SUM(sales), 2) AS ingresos
FROM orders
GROUP BY mes
ORDER BY mes ASC;

-- 4. Ticket promedio por cliente
SELECT customer_id,
       COUNT(order_id) AS total_pedidos,
       ROUND(AVG(sales), 2) AS ticket_promedio
FROM orders
GROUP BY customer_id
ORDER BY ticket_promedio DESC;

-- 5. Productos más vendidos
SELECT product_name,
       COUNT(order_id) AS veces_vendido,
       ROUND(SUM(sales), 2) AS ingresos_totales
FROM orders
GROUP BY product_name
ORDER BY veces_vendido DESC
LIMIT 10;
