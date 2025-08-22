# BI Demo: SQL Server DWH • Python ETL • Power BI • CI/CD

End-to-end mini data project that mirrors a typical consulting engagement:

- **ETL**: Python (pandas) loads CSV → staging tables (`stg.*`)
- **DWH**: Star schema in SQL Server (`dwh.dim_*`, `dwh.fact_sales`)
- **KPI Views**: Business-friendly reporting layer (`dwh.vw_sales_kpis`)
- **Infra**: Docker + Adminer (browser-based SQL GUI)
- **Reporting**: Power BI dashboard (optional)
- **CI/CD**: GitHub Actions automatically spin up SQL Server and run ETL on every push

<p align="center">
  <img src="docs/PowerBI.png" alt="KPI view" width="720"/>
</p>

---

## 🔧 Tech Stack

- **SQL Server 2022** (in Docker)
- **Python 3.11+**: pandas, SQLAlchemy, pyodbc, python-dotenv
- **Adminer**: lightweight SQL admin GUI (via browser)
- **Power BI Desktop** (optional dashboard visualization)
- **GitHub Actions**: CI/CD with ODBC 18 on Ubuntu

---

## ▶️ Quickstart (Windows)

### Prerequisites
- [Docker Desktop](https://www.docker.com/products/docker-desktop/) running  
- Python installed (`py -3.13 --version`)  
- ODBC Driver 18 for SQL Server installed  

### Setup

```powershell
# From repo root
docker compose -f infra\docker-compose.yml up -d

# (Optional) Create DB once via Adminer
# Open: http://localhost:8081
# System: MS SQL
# Server: dwh-sqlserver (or localhost:1433)
# User: sa
# Pwd: <your SA password>
# Run SQL: CREATE DATABASE bi_demo;

# Install Python dependencies
py -3.13 -m pip install -r etl\requirements.txt

# Run ETL: Load CSVs → staging tables (stg.*)
py -3.13 etl\etl_pipeline.py

```
#### ▶️ Quickstart (Windows)

