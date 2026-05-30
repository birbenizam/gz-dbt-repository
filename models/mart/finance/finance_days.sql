WITH orders_operational AS (

    SELECT *
    FROM {{ ref('int_orders_operational') }}

)

SELECT
    date_date,
    COUNT(orders_id) AS nb_transaction,
    SUM(turnover) AS turnover,
    SUM(turnover) / COUNT(orders_id) AS average_basket,
    SUM(operational_margin) AS operational_margin,
    SUM(purchase_cost) AS purchase_cost,
    SUM(shipping_fee) AS shipping_fee,
    SUM(log_cost) AS log_cost,
    SUM(ship_cost) AS ship_cost,
    SUM(qty) AS qty

FROM orders_operational

GROUP BY
    date_date