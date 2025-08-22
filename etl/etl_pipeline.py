# etl_pipeline.py (simplified demo, robust ODBC connect)
import os
import urllib.parse
import pandas as pd
from sqlalchemy import create_engine
from dotenv import load_dotenv

load_dotenv()

SQLSERVER_HOST = os.getenv("SQLSERVER_HOST", "localhost")
SQLSERVER_PORT = os.getenv("SQLSERVER_PORT", "1433")
SQLSERVER_DB   = os.getenv("SQLSERVER_DB", "bi_demo")
SQLSERVER_UID  = os.getenv("SQLSERVER_UID", "sa")
SQLSERVER_PWD  = os.getenv("SQLSERVER_PWD", "YourStrong!Passw0rd")
DRIVER_NAME    = os.getenv("ODBC_DRIVER", "ODBC Driver 18 for SQL Server").strip()

DATA_DIR = os.getenv("DATA_DIR", "../data")

def load_csv(name: str) -> pd.DataFrame:
    path = os.path.join(DATA_DIR, "raw", name)
    return pd.read_csv(path)

def build_engine():
    """
    Build a SQLAlchemy engine using a full ODBC connection string.
    This avoids issues with spaces in driver names and adds TLS flags.
    """
    odbc_parts = [
        f"DRIVER={{{DRIVER_NAME}}}",
        f"SERVER={SQLSERVER_HOST},{SQLSERVER_PORT}",
        f"DATABASE={SQLSERVER_DB}",
        f"UID={SQLSERVER_UID}",
        f"PWD={SQLSERVER_PWD}",
        "Encrypt=yes",
        "TrustServerCertificate=yes",
    ]
    odbc_str = ";".join(odbc_parts) + ";"
    connect_url = "mssql+pyodbc:///?odbc_connect=" + urllib.parse.quote_plus(odbc_str)
    return create_engine(connect_url, fast_executemany=True)

def main():
    engine = build_engine()

    orders    = load_csv("orders.csv")
    customers = load_csv("customers.csv")
    products  = load_csv("products.csv")

    # Simple staging tables (add dtype mapping if needed)
    with engine.begin() as con:
        orders.to_sql("orders_stg",    con, schema="stg", if_exists="replace", index=False)
        customers.to_sql("customers_stg", con, schema="stg", if_exists="replace", index=False)
        products.to_sql("products_stg",  con, schema="stg", if_exists="replace", index=False)

    print("Loaded staging tables. Next step: run SQL scripts to build DWH.")

if __name__ == "__main__":
    main()
