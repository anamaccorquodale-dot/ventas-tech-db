SELECT
    MONTH(fecha_venta) AS mes,
    SUM(cantidad * precio_unitario) AS total_facturado,
    COUNT(*) AS cantidad_pedidos,
    AVG(cantidad * precio_unitario) AS ticket_promedio
FROM ventas
GROUP BY MONTH(fecha_venta)
ORDER BY mes;


-- Consulta 2: Ranking Top 5 de productos

SELECT TOP 5
    id_producto,
    SUM(cantidad) AS unidades_vendidas,
    SUM(cantidad * precio_unitario) AS total_facturado
FROM ventas
GROUP BY id_producto
ORDER BY total_facturado DESC;

-- Consulta 3: Clientes recurrentes

SELECT
    id_cliente,
    COUNT(*) AS cantidad_pedidos,
    SUM(cantidad * precio_unitario) AS total_gastado
FROM ventas
GROUP BY id_cliente
HAVING COUNT(*) > 1
ORDER BY total_gastado DESC;

-- Consulta 4: Meses por encima / por debajo del promedio

WITH facturacion_mensual AS (
    SELECT
        MONTH(fecha_venta) AS mes,
        SUM(cantidad * precio_unitario) AS total_facturado
    FROM ventas
    GROUP BY MONTH(fecha_venta)
)
SELECT
    mes,
    total_facturado,
    CASE
        WHEN total_facturado > (SELECT AVG(total_facturado) FROM facturacion_mensual)
            THEN 'Por encima'
        ELSE 'Por debajo'
    END AS comparacion_promedio
FROM facturacion_mensual
ORDER BY mes;

/*
HALLAZGOS DE NEGOCIO

1. La facturación total del período analizado fue de $5.119,
   correspondiente a 10 pedidos, con un ticket promedio de $511,90.

2. El producto con ID 1 fue el de mayor facturación, generando $3.600
   con 3 unidades vendidas. Representa aproximadamente el 70,3%
   de la facturación total.

3. Todos los clientes analizados realizaron más de un pedido.
   El cliente con ID 1 fue el de mayor gasto, con $2.900 en 3 pedidos,
   representando aproximadamente el 56,7% de la facturación total.

Nota: la base contiene ventas únicamente del mes 3 (marzo).
Por este motivo no es posible realizar una comparación real entre meses.
La facturación de marzo ($5.119) coincide con el promedio mensual.
*/