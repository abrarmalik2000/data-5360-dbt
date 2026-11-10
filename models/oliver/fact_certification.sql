{{ config(
    materialized = 'table',
    schema = 'oliver_dw_source'
    )
}}

SELECT

d.date_key AS date_key,
e.employee_key AS employee_key,
ec.certification_name,
ec.certification_cost
FROM {{ ref ('stg_employee_certifications') }} ec
INNER JOIN {{ ref ('oliver_dim_date')}} d ON ec.certification_awarded_date = d.date_key
INNER JOIN {{ ref ('oliver_dim_employee')}} e ON ec.employee_id = e.employee_id
