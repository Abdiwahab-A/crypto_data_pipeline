# 📈 Real-Time Crypto Data Pipeline
An automated end-to-end data engineering project that extracts crypto data, cleans it in PostgreSQL, and visualizes it in Power BI.

## 🛠️ Tech Stack
*   **Language:** Python (Requests, Pandas, SQLAlchemy)
*   **Database:** PostgreSQL (Aiven Cloud)
*   **Automation:** GitHub Actions (Cron schedule)
*   **Visualization:** Power BI

## ⚙️ How It Works
1.  **Extract:** Python hits the Coinpaprika API every hour.
2.  **Load:** Data is pushed to a staging table in PostgreSQL.
3.  **Transform:** An "Upsert" logic handles duplicates and ensures data integrity.
4.  **Visualize:** Power BI connects to the database to show real-time price trends.

## 📊 Dashboard Preview
![Dashboard Screenshot](dashboards/screenshot.png) 
*(Tip: Take a screenshot of your Power BI and put it here!)*

## 🚀 Setup Instructions
1. Clone this repo.
2. Run the SQL scripts in `sql_scripts/` to set up your database.
3. Add your `DB_URL` to GitHub Secrets.
