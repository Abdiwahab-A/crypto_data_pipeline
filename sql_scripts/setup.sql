-- creating schema
CREATE SCHEMA IF NOT EXISTS crypto;
SET SEARCH_PATH TO crypto;

--  creating main table 
CREATE TABLE IF NOT EXISTS crypto.crypto_data ( 
    id VARCHAR(100),
    name VARCHAR(100),
    symbol VARCHAR(100),
    rank INT, 
    total_supply BIGINT,
    max_supply BIGINT,
    beta_value FLOAT, 
    first_data_at TIMESTAMP,
    last_updated TIMESTAMP, 
    price NUMERIC, 
    volume_24h NUMERIC, 
    volume_24h_change_24h FLOAT, 
    market_cap NUMERIC,
    market_cap_change_24h FLOAT,
    percent_change_15m FLOAT,
    percent_change_30m FLOAT,
    percent_change_1h FLOAT,
    percent_change_6h FLOAT,
    percent_change_12h FLOAT, 
    percent_change_24h FLOAT,
    percent_change_7d FLOAT, 
    percent_change_30d FLOAT, 
    percent_change_1y FLOAT,
    ath_price FLOAT, 
    ath_date TIMESTAMP, 
    percent_from_price_ath FLOAT
);

-- alter the table to add constraint to match the python upsert logic
ALTER TABLE crypto.crypto_data 
ADD CONSTRAINT unique_id_timestamp UNIQUE (id, last_updated);
