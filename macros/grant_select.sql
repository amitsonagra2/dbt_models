{% macro grant_select(schema=target.schema,role=target.role)%}

{% set query %}
grant usage on schema {{schema}} to role {{role}};
grant select on all tables in schema {{schema}} to role {{role}};
grant select on all views in schema {{schema}} to role {{role}};
{% endset%}

{{ log('GRANTING ACCESS TO TABLES AND VIEWS' ~schema~ 'to role' ~role, info=true )}}

{% do run_query(query) %}

{{log("granted access", info =true)}}

{% endmacro %}