# airflow/dags/dwh_daily_load.py
from datetime import datetime
from airflow import DAG
from airflow.operators.bash import BashOperator

with DAG(
    dag_id="dwh_daily_load",
    start_date=datetime(2024, 1, 1),
    schedule="@daily",
    catchup=False,
    default_args={"owner": "vikram"},
    description="Run ETL and apply SQL DWH scripts",
):
    etl = BashOperator(
        task_id="run_etl",
        bash_command="cd /opt/etl && python etl_pipeline.py"
    )
    # In real use, add tasks to run SQL files against SQL Server
