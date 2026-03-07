{{ config(
    materialized='incremental',
    unique_key='ORDER_ID'
) }}

SELECT
    ORDER_ID,
    CUSTOMER_ID,
    ORDER_DATE,
    AMOUNT,
    {{add_tax('AMOUNT') }} AS AMOUNT_WITH_TAX,
    CURRENT_TIMESTAMP() AS LOADED_AT
FROM {{ source('raw','SALES') }}

{% if is_incremental() %}
WHERE ORDER_ID > (SELECT MAX(ORDER_ID) FROM {{ this }})
{% endif %}