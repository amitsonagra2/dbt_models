{% macro past_data(date_field, past_days = 3)%}
where {{date_field}} >= cast(date_add(current_timestamp, interval -{{past_days}} day) as datetime)
{%endmacro%}