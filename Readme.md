# Sales Data Engineering Pipeline

**End-to-End ETL Pipeline | Python | PostgreSQL | SQL | Power BI**

## Project Overview

This project demonstrates an end-to-end data engineering workflow, from extracting raw sales data to transforming, storing, analyzing, and visualizing it.

The objective is to build a structured and reproducible ETL pipeline that converts raw CSV data into actionable business insights.

## Technologies Used

- **Python** — ETL development
- **Pandas** — Data cleaning and transformation
- **SQLAlchemy & Psycopg** — PostgreSQL connectivity
- **PostgreSQL** — Relational data warehouse
- **SQL** — Data analysis and aggregation
- **Power BI** — Interactive dashboard and reporting
- **VS Code** — Development environment

## ETL Architecture

CSV Dataset → Python Extraction → Data Cleaning & Transformation → PostgreSQL Data Warehouse → Power BI Dashboard

## ETL Process

### 1. Extract

The extraction script reads sales records from a CSV dataset.

### 2. Transform

The transformation script performs the following operations:

- Removes duplicate records
- Handles missing values
- Converts dates and numeric columns
- Calculates revenue for each transaction
- Exports the cleaned dataset

### 3. Load

The loading script transfers the transformed data into PostgreSQL for storage and analysis.

## Data Warehouse

The PostgreSQL database is organized using staging and warehouse schemas.

The project includes sales data and dimensional tables for dates, products, and cities, along with a sales fact table.

## Power BI Dashboard

![Sales Analytics Dashboard](screenshots/dashboard.png)

The dashboard provides:

- Total revenue
- Number of orders
- Total quantity sold
- Revenue analysis by product and city
- Sales trends over time
- Interactive filters by city and category

## Sample Results

| KPI | Value |
|---|---|
| Total Revenue | 35,630 |
| Total Orders | 10 |
| Units Sold | 24 |

*These figures are based on the sample dataset.*

## Project Structure

```text
Projet_ETL_Ventes/
├── Data/
│   ├── ventes.csv
│   └── ventes_nettoyees.csv
├── scripts/
│   ├── extract.py
│   ├── transform.py
│   └── load.py
├── sql/
├── dashboard/
├── screenshots/
├── requirements.txt
├── .gitignore
└── README.md
```

## How to Run

1. Install Python and PostgreSQL.
2. Install the required Python dependencies:

   `pip install -r requirements.txt`

3. Configure the PostgreSQL connection in the loading script.
4. Execute the scripts in order:

   `python Scripts/extract.py`

   `python Scripts/transform.py`

   `python Scripts/load.py`

5. Open the Power BI dashboard to explore the results.

## Future Improvements

- Automate ETL execution
- Add data quality validation
- Implement incremental data loading
- Expand the dataset and analytical models

## Project Purpose

This project was developed as a practical learning experience in data engineering, ETL development, relational data warehousing, and business intelligence.