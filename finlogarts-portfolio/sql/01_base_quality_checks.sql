-- 01_base_quality_checks.sql
-- Auditoria: datas negativas, nulos críticos, duplicidades

-- Parâmetros (ajuste conforme seu recorte)
WITH params AS (
  SELECT DATE '2024-01-01' AS dt_ini, DATE '2024-12-31' AS dt_fim
)

-- Datas negativas: envio antes do pedido
SELECT o.order_id, o.order_date, s.ship_date
FROM `meli-bi-data.TMP.orders_kq` o
LEFT JOIN `meli-bi-data.TMP.shipments_kq` s USING(order_id)
WHERE o.order_date BETWEEN (SELECT dt_ini FROM params) AND (SELECT dt_fim FROM params)
  AND s.ship_date < o.order_date;

-- Duplicidade de pedidos
SELECT order_id, COUNT(*) AS c
FROM `meli-bi-data.TMP.orders_kq`
GROUP BY order_id
HAVING c > 1;

-- Nulos críticos
SELECT COUNTIF(order_id IS NULL) AS null_order_id,
       COUNTIF(customer_id IS NULL) AS null_customer_id,
       COUNTIF(order_date IS NULL) AS null_order_date
FROM `meli-bi-data.TMP.orders_kq`;