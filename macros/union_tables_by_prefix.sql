{% macro union_tables(database, schema, prefix)%}

    {%set tables =dbt_utils.get_relations_by_prefix(database=database, schema=schema, prefix=prefix) %}

    {% for i in tables%}

    {%if not loop.first %}
    union all

    {% endif %}

    select * from {{i.database}}.{{i.schema}}.{{i.name}}


    {% endfor %}


{% endmacro%}