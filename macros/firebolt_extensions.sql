{% macro firebolt__str_left(col, length) %}
    substring({{ col }}, 1, {{ length }})
{% endmacro %}

-- Override to postgres macros for dbt_artifacts compatibility

{% macro firebolt__get_models_dml_sql(models) -%}
  {{ dbt_artifacts.postgres__get_models_dml_sql(models) }}
{% endmacro %}

{% macro firebolt__get_tests_dml_sql(tests) -%}
    {{ dbt_artifacts.postgres__get_tests_dml_sql(tests) }}
{% endmacro %}

{% macro firebolt__get_exposures_dml_sql(exposures) -%}
    {{ dbt_artifacts.postgres__get_exposures_dml_sql(exposures) }}
{%- endmacro %}

{% macro firebolt__get_metrics_dml_sql(metrics) -%}
    {{ dbt_artifacts.postgres__get_metrics_dml_sql(metrics) }}
{%- endmacro %}

{% macro firebolt__get_test_executions_dml_sql(tests) -%}
    {{ dbt_artifacts.postgres__get_test_executions_dml_sql(tests) }}
{%- endmacro %}

{% macro firebolt__get_snapshots_dml_sql(snapshots) -%}
    {{ dbt_artifacts.postgres__get_snapshots_dml_sql(snapshots) }}
{%- endmacro %}

{% macro firebolt__get_snapshot_executions_dml_sql(snapshots) -%}
    {{ dbt_artifacts.postgres__get_snapshot_executions_dml_sql(snapshots) }}
{%- endmacro %}

{% macro firebolt__get_seeds_dml_sql(seeds) -%}
    {{ dbt_artifacts.postgres__get_seeds_dml_sql(seeds) }}
{%- endmacro %}

{% macro firebolt__get_seed_executions_dml_sql(seeds) -%}
    {{ dbt_artifacts.postgres__get_seed_executions_dml_sql(seeds) }}
{%- endmacro %}

{% macro firebolt__get_model_executions_dml_sql(models) -%}
    {{ dbt_artifacts.postgres__get_model_executions_dml_sql(models) }}
{%- endmacro %}

{% macro firebolt__get_invocations_dml_sql() -%}
    {{ dbt_artifacts.postgres__get_invocations_dml_sql() }}
{%- endmacro %}

{% macro firebolt__get_sources_dml_sql(sources) -%}
    {{ dbt_artifacts.postgres__get_sources_dml_sql(sources) }}
{%- endmacro %}

-- Firebolt-specific insert implementation

{% macro firebolt__insert_into_metadata_table(relation, fields, content) -%}

    {% set insert_into_table_query %}
    insert into {{ relation }} {{ fields }}
    values
    {{ content }}
    {% endset %}

    {% do run_query(insert_into_table_query) %}

{%- endmacro %}
