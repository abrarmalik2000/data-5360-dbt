{{ config(
    materialized = 'table',
    schema = 'oliver_dw_source'
    )
}}

SELECT
    employee_id,
    PARSE_JSON(certification_json):certification_name::VARCHAR          AS certification_name,
    PARSE_JSON(certification_json):certification_cost::NUMBER(10,2)     AS certification_cost,
    PARSE_JSON(certification_json):certification_awarded_date::DATE     AS certification_awarded_date
FROM {{ source('oliver_landing', 'employee_certifications') }}