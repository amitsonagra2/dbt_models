 with payments as (
    select id as payment_id,
    orderid as order_id,
    paymentmethod as payment_method,
    status,
    {{cents_to_dollars()}} as amount,
    created as created_at
    from {{source('stripe','payment')}}
    )

select * from payments