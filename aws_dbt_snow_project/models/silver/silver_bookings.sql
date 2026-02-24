{{ 
    config(
        materialized='incremental',
        unique_key='booking_id'
    )
}}

select 
    booking_id,
    listing_id,
    booking_date,
    {{ multiply('NIGHTS_BOOKED', 'BOOKING_AMOUNT',2) }} as TOTAL_AMOUNT,
    CLEANING_FEE, 
    SERVICE_FEE,  
    Booking_status, 
    Created_at
from 
 {{ ref('bronze_bookings') }} 

  



    