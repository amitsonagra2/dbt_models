with orders as (

    select
        
        id as order_id,
        user_id as customer_id,
        order_date,
        status,
        current_timestamp as loaded_at,
        {{ dbt_utils.surrogate_key(['id','order_date'])}} as primary_key

    from {{source('jaffle_shop','orders')}}

)
select * from orders {{past_data('order_date',2000)}}
