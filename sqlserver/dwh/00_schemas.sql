-- 00_schemas.sql
USE bi_demo;
GO
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'stg') EXEC('CREATE SCHEMA stg');
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'dwh') EXEC('CREATE SCHEMA dwh');
GO
