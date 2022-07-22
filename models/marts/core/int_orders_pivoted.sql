with orders as
( select * from {{ref('stg_payments')}})


select 
order_id,

{%set payment_methods = ['bank_transfer','coupon','credit_card','gift_card']%}
{%-for i in payment_methods-%}
sum(case when payment_method = '{{i}}' then 1 else 0 end) as {{i}}_amount
{%- if not loop.last-%}
,
{%endif%}
{%-endfor-%}

 from orders
 where status = 'success'
 group by 1
 order by 1