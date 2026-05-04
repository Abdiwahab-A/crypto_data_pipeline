-- Highest Market Cap
SELECT name, market_cap FROM crypto.v_latest_crypto_metrics ORDER BY market_cap DESC LIMIT 1;

-- Highest 24h Volume
SELECT name, volume_24h FROM crypto.v_latest_crypto_metrics ORDER BY volume_24h DESC LIMIT 1;

-- Top 24h Gainer
SELECT symbol, percent_change_24h FROM crypto.v_latest_crypto_metrics ORDER BY percent_change_24h DESC LIMIT 1;

-- Total Records in Database
SELECT COUNT(*) as total_rows FROM crypto.crypto_data;
