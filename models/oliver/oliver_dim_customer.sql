{{ config(
    materialized = 'table',
    schema = 'oliver_dw_source'
    )
}}

SELECT
customer_id as cust_key,
customer_id, 
first_name,
last_name,
email,
phone_number,
state
FROM {{ source('oliver_landing', 'customer') }}