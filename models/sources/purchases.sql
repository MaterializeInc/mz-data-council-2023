{{ config(materialized='source') }}

CREATE SOURCE {{ this }}
FROM KAFKA CONNECTION kafka_connection (
    TOPIC 'mysql.shop.purchases'
)
FORMAT AVRO
USING CONFLUENT SCHEMA REGISTRY CONNECTION csr_connection
ENVELOPE DEBEZIUM
WITH (SIZE = '3xsmall')
