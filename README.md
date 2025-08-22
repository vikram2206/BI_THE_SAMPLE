# de-bi-portfolio-bissantz

End-to-end **Data Engineering / BI** portfolio tailored to Bissantz & Company (Junior Data Engineer / BI Consultant).  
Shows **Data Warehouse (Star Schema on SQL Server)**, **ETL/ELT (Python)**, **Orchestrierung (Airflow)**, **S3-kompatibler Speicher (MinIO)**,
**Reporting (Power BI)**, Containerisierung (**Docker Compose**) und **CI/CD**.

## TL;DR (German)
- Data Warehouse (Star Schema) auf **SQL Server**; Geschäftslogik in **SQL/T-SQL**
- ETL/ELT in **Python**; Orchestrierung via **Airflow**
- S3-kompatibler Storage via **MinIO**
- Reporting: **Power BI** (PBIX) + DeltaMaster **Einblick** (Dokumentation)
- **Makefile** Befehle: `make up` → Infrastruktur, `make load` → ETL, `make sql` → DWH, `make test` → Checks

## Quickstart
```bash
# 1) Configure environment
cp .env.example .env

# 2) Start infra (SQL Server, MinIO, Adminer; Airflow optional)
make up

# 3) Seed example data and run ETL
make seed
make load

# 4) Build the star schema
make sql

# 5) Run sanity checks
make test
```

## Mapping zur Stellenanzeige (Auszug)
| JD-Anforderung | Repo-Nachweis |
| --- | --- |
| Data Warehouse, Geschäftslogik in SQL | `sqlserver/dwh/*.sql`, `sqlserver/docker/init.sql` |
| Relationale & multidimensionale DBs (SQL Server/SSAS/OLAP) | `docs/04_biz_metrics_de.md`, `sqlserver/dwh/99_views_reporting.sql` (Hinweis), `docs/99_delta_master_readme.md` |
| Reporting / Berichtsgestaltung | `reporting/powerbi/Sales_KPIs.pbix` (Platzhalter + README) |
| Workshops, Support, Teilprojektleitung | `docs/02_workshop_notes_de.md`, `docs/03_support_runbook_de.md` |
| On-Prem / Cloud / Hybrid | `infra/docker-compose.yml` (SQL Server, MinIO, Airflow), `etl/` |
| CI/CD | `ci/github-actions.yml` (Skeleton) |

## Notes
- DeltaMaster ist proprietär; `reporting/deltamaster/README.md` beschreibt die Layouts/KPIs (ohne Screenshots aus dem Tool).
- Dieser Starter ist **minimal** und auf Demonstration ausgelegt. Fülle Inhalte (KPIs, Measures, Diagramme) mit eigenen Details.
