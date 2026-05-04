import os

import pandas as pd
import requests
from dotenv import load_dotenv
from sqlalchemy import create_engine, text


def run_pipeline():
    # 1. Extraction
    url = "https://api.coinpaprika.com/v1/tickers"
    res = requests.get(url)
    data = res.json()
    df = pd.json_normalize(data)

    # 2. Cleaning
    df.columns = df.columns.str.replace("quotes.USD.", "", regex=False)
    df["first_data_at"] = pd.to_datetime(df["first_data_at"])
    df["last_updated"] = pd.to_datetime(df["last_updated"])
    if "ath_date" in df.columns:
        df["ath_date"] = pd.to_datetime(df["ath_date"])

    # 3. Connection (Using GitHub Secrets)
    load_dotenv()
    db_url = os.environ.get("DB_URL")
    if not db_url:
        print("Error: DB_URL environment variable not found.")
        return

    engine = create_engine(db_url)

    # 4. Upsert Logic
    # Using 'replace' for staging ensures correct types (Timestamp) are created
    df.to_sql(
        "crypto_staging", con=engine, schema="crypto", if_exists="replace", index=False
    )

    upsert_sql = text("""
    INSERT INTO crypto.crypto_data 
    SELECT * FROM crypto.crypto_staging
    ON CONFLICT (id, last_updated) DO NOTHING;
    """)

    with engine.begin() as conn:
        conn.execute(upsert_sql)
        conn.execute(text("DROP TABLE IF EXISTS crypto.crypto_staging;"))

    print("Pipeline run successfully.")


if __name__ == "__main__":
    run_pipeline()
