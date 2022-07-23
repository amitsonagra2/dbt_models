{% macro template_example() %}

    {% set query%}
    select true as bool
    {% endset %}

    {% if execute %}

        {% set result = run_query(query).columns[0].values()[0] %}
        {{ log('sql results - ' ~ result, info = true) }}

        select 
        {{results}} as real_results 
        from a_table


    {% endif%}

{% endmacro %}