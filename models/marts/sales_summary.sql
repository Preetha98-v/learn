{{config(materialized='table')}}

SELECT
 CUSTOMER_ID,
 COUNT(ORDER_ID) AS total_orders,
 SUM(Amount) AS total_revenue,
 MAX(ORDER_DATE) AS last_order_date,
 FROM {{ref('stg_sales')}}
 GROUP BY CUSTOMER_ID