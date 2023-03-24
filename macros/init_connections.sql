{% macro init_connections(kafka_user=env_var('KAFKA_USER'), kafka_pass=env_var('KAFKA_PASS'), csr_user=env_var('CSR_USER'), csr_pass=env_var('CSR_PASS'), kafka_broker=env_var('KAFKA_BROKER'), csr_url=env_var('CSR_URL')) %}

  {%- call statement('qck', fetch_result=False, auto_begin=False) -%}
    CREATE SCHEMA IF NOT EXISTS qck;
  {%- endcall -%}

  {%- call statement('kafka_user', fetch_result=False, auto_begin=False) -%}
    CREATE SECRET IF NOT EXISTS kafka_user AS '{{ kafka_user }}';
  {%- endcall -%}

  {%- call statement('kafka_password', fetch_result=False, auto_begin=False) -%}
    CREATE SECRET IF NOT EXISTS kafka_pass AS '{{ kafka_pass }}';
  {%- endcall -%}

  {%- call statement('csr_user', fetch_result=False, auto_begin=False) -%}
    CREATE SECRET IF NOT EXISTS csr_user AS '{{ csr_user }}';
  {%- endcall -%}

  {%- call statement('csr_password', fetch_result=False, auto_begin=False) -%}
    CREATE SECRET IF NOT EXISTS csr_password AS '{{ csr_password }}';
  {%- endcall -%}

  {%- call statement('dc_kafka_connection', fetch_result=False, auto_begin=False) -%}
    CREATE CONNECTION IF NOT EXISTS dc_kafka_connection TO KAFKA (
      BROKER '{{ kafka_broker }}',
      SASL MECHANISMS = 'PLAIN',
      SASL USERNAME = SECRET kafka_user,
      SASL PASSWORD = SECRET kafka_password
    );
  {%- endcall -%}

  {%- call statement('dc_csr_connection', fetch_result=False, auto_begin=False) -%}
    CREATE CONNECTION IF NOT EXISTS dc_csr_connection TO CONFLUENT SCHEMA REGISTRY (
      URL '{{ csr_url }}',
      USERNAME = SECRET csr_user,
      PASSWORD = SECRET csr_password
    );
  {%- endcall -%}

{% endmacro %}
