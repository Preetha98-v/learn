{% snapshot sales_snapshot %}

{{
    config(
        target_schema='DBT_DEV',
        unique_key='ORDER_ID',
        strategy='check',
        check_cols=['CUSTOMER_ID','ORDER_DATE','AMOUNT']
    )
}}

SELECT
    ORDER_ID,
    CUSTOMER_ID,
    ORDER_DATE,
    AMOUNT
{# FROM {{ source('raw','SALES') }} #}
FROM {{ ref('stg_sales') }}

{% endsnapshot %}