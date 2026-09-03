{% test check_foreign_key(model, column_name, dim_table_name, dim_id) %}

select * from {{model}}
where {{ column_name }} not in ( select {{dim_id}} from {{dim_table_name}} )

{% endtest %}
