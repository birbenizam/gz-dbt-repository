WITH source AS (

    SELECT *
    FROM {{ source('raw', 'ship') }}

),

renamed AS (

    SELECT
    orders_id,
    shipping_fee,
    CAST(ship_cost AS FLOAT64) AS ship_cost,
    CAST(logCost AS FLOAT64) AS log_cost
FROM source

)

SELECT *
FROM renamed