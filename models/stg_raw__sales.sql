WITH source AS (

    SELECT *
    FROM {{ source('raw', 'sales') }}

),

renamed AS (

    SELECT
        date_date,
        orders_id,
        pdt_id AS products_id,
        revenue AS turnover,
        quantity AS qty
    FROM source

)

SELECT *
FROM renamed