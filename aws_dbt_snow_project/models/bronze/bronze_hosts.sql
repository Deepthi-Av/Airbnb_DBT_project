{{ config(materialized = 'incremental')}}

{# {% set incremental_flag = 1 %}
{% set incremental_col = 'CREATED_AT' %} #}

select * from {{ source('staging','hosts') }}

{% if is_incremental() %}
    where CREATED_AT > (select coalesce( max(CREATED_AT), '1900-01-01'::timestamp_ntz) from {{ this }} )
{% endif %}
