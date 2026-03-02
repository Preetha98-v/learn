SELECT
    ORDER_ID,
    CUSTOMER_ID,
    ORDER_DATE,
    AMOUNT,
    CURRENT_TIMESTAMP() AS LOADED_AT
FROM {{source('raw','sales')}}