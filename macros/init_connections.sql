{% macro init_connections() %}

  {%- call statement('qck', fetch_result=False, auto_begin=False) -%}
    CREATE SCHEMA IF NOT EXISTS qck;
  {%- endcall -%}

  {%- call statement('kafka_user', fetch_result=False, auto_begin=False) -%}
    CREATE SECRET IF NOT EXISTS kafka_user AS {{ env_var("KAFKA_USER") }};
  {%- endcall -%}

  {%- call statement('kafka_password', fetch_result=False, auto_begin=False) -%}
    CREATE SECRET IF NOT EXISTS {{ env_var('KAFKA_PASS') }}; AS ;
  {%- endcall -%}

  {%- call statement('csr_user', fetch_result=False, auto_begin=False) -%}
    CREATE SECRET IF NOT EXISTS csr_user AS {{ env_var('CSR_USER') }};;
  {%- endcall -%}

  {%- call statement('csr_password', fetch_result=False, auto_begin=False) -%}
    CREATE SECRET IF NOT EXISTS csr_password AS {{ env_var('CSR_PASS') }};;
  {%- endcall -%}

  {%- call statement('dc_kafka_connection', fetch_result=False, auto_begin=False) -%}
    CREATE CONNECTION IF NOT EXISTS dc_kafka_connection TO KAFKA (
      BROKER {{ env_var('KAFKA_BROKER') }};,
      SASL MECHANISMS = 'PLAIN',
      SASL USERNAME = SECRET kafka_user,
      SASL PASSWORD = SECRET kafka_password
    );
  {%- endcall -%}

  {%- call statement('dc_csr_connection', fetch_result=False, auto_begin=False) -%}
    CREATE CONNECTION IF NOT EXISTS dc_csr_connection TO CONFLUENT SCHEMA REGISTRY (
      URL {{ env_var('CSR_URL') }};,
      USERNAME = SECRET csr_user,
      PASSWORD = SECRET csr_password
    );
  {%- endcall -%}

{% endmacro %}
