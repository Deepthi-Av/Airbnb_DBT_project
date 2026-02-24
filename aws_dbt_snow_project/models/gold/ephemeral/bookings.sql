{{
  config(
    materialized = 'ephemeral'
  )
}}
WITH BOOKINGS AS 
(
select 
    BOOKING_ID,
    BOOKING_DATE,
    BOOKING_STATUS,
    CREATED_AT
from 
    {{ ref('obt') }}
)

SELECT * FROM bookings 