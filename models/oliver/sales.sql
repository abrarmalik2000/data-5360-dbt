{{ config(
    materialized = 'table',
    schema = 'oliver_dw_source'
    )
}}

SELECT 
c.first_name as customer_firstname,
c.last_name as custome_lastname, 
fs.quantity, 
fs.total_amount as dollars_sold, 
d.date_id, 
s.store_name, 
p.product_name, 
e.first_name as employee_firstname,
e.last_name as employee_lastname

FROM {{ ref('fact_sales')}} fs 
LEFT JOIN {{ ref ('oliver_dim_customer')}} c 
    ON fs.customer_key = c.cust_key
LEFT JOIN {{ ref('oliver_dim_date' )}} d 
    ON d.date_key = fs.date_key
LEFT JOIN {{ ref ('oliver_dim_store')}} s
    ON s.store_key = fs.store_key
LEFT JOIN {{ ref('oliver_dim_product')}} p 
    ON p.product_key = fs.product_key
LEFT JOIN {{ ref('oliver_dim_employee')}} e
    ON e.employee_key = fs.employee_key
