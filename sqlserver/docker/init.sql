-- sqlserver/docker/init.sql
-- Creates a demo database and login (development only)
IF DB_ID('bi_demo') IS NULL
    CREATE DATABASE bi_demo;
GO
