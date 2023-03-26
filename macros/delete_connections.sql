{% macro delete_connections() %}

  {%- call statement('dc_kafka_connection', fetch_result=False, auto_begin=False) -%}
    DROP CONNECTION IF EXISTS dc_kafka_connection CASCADE;
  {%- endcall -%}

  {%- call statement('dc_csr_connection', fetch_result=False, auto_begin=False) -%}
    DROP CONNECTION IF EXISTS dc_csr_connection CASCADE;
  {%- endcall -%}

  {%- call statement('kafka_user', fetch_result=False, auto_begin=False) -%}
    DROP SECRET IF EXISTS kafka_user;
  {%- endcall -%}

  {%- call statement('kafka_pass', fetch_result=False, auto_begin=False) -%}
    DROP SECRET IF EXISTS kafka_pass;
  {%- endcall -%}

  {%- call statement('csr_user', fetch_result=False, auto_begin=False) -%}
    DROP SECRET IF EXISTS csr_user;
  {%- endcall -%}

  {%- call statement('csr_pass', fetch_result=False, auto_begin=False) -%}
    DROP SECRET IF EXISTS csr_pass;
  {%- endcall -%}

  {%- call statement('qck', fetch_result=False, auto_begin=False) -%}
    DROP SCHEMA IF EXISTS qck;
  {%- endcall -%}

{% endmacro %}
