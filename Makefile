SHELL:=/bin/bash

up:
	docker compose -f infra/docker-compose.yml up -d

down:
	docker compose -f infra/docker-compose.yml down -v

seed:
	@echo "Seeding raw data to MinIO (placeholder)..."

load:
	cd etl && python etl_pipeline.py

sql:
	@echo "Apply SQL scripts (connect to SQL Server and run sqlserver/dwh/*.sql)"

test:
	@echo "Run basic tests (placeholder in tests/)"
