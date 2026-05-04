CREATE OR REPLACE VIEW crypto.v_latest_crypto_metrics AS
SELECT DISTINCT ON (id) 
    id, 
    name, 
    symbol, 
    price, 
    market_cap, 
    volume_24h, 
    percent_change_24h,
    last_updated
FROM crypto.crypto_data
ORDER BY id, last_updated DESC;
