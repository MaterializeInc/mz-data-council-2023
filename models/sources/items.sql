{{ config(materialized='source', indexes=[{'columns': ['id']}]) }}

CREATE SOURCE {{ this }}
FROM KAFKA CONNECTION kafka_connection (
    TOPIC 'mysql.shop.items'
)
FORMAT AVRO
USING CONFLUENT SCHEMA REGISTRY CONNECTION csr_connection
ENVELOPE DEBEZIUM
WITH (SIZE = '3xsmall')
