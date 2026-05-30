WITH sales AS (

    SELECT *
    FROM {{ ref('stg_raw__sales') }}

),

product AS (

    SELECT *
    FROM {{ ref('stg_raw__product') }}

)

SELECT
    sales.date_date,
    sales.orders_id,
    sales.products_id,
    sales.qty,
    sales.turnover,
    product.purchase_price,
    sales.qty * product.purchase_price AS purchase_cost,
    sales.turnover - (sales.qty * product.purchase_price) AS margin

FROM sales
LEFT JOIN product
    ON sales.products_id = product.products_id