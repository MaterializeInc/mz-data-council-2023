{{ config(materialized='source', indexes=[{'columns': ['id']}]) }}

CREATE SOURCE {{ this }}
FROM KAFKA CONNECTION dc_kafka_connection (
    TOPIC 'mysql.shop.items'
)
FORMAT AVRO
USING CONFLUENT SCHEMA REGISTRY CONNECTION dc_csr_connection
ENVELOPE DEBEZIUM
WITH (SIZE = '1')
