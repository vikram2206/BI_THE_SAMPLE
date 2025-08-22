-- 20_dim_customer.sql
USE bi_demo;
GO
IF OBJECT_ID('dwh.dim_customer') IS NOT NULL DROP TABLE dwh.dim_customer;
CREATE TABLE dwh.dim_customer(
  customer_key INT IDENTITY(1,1) PRIMARY KEY,
  customer_id INT NOT NULL UNIQUE,
  region NVARCHAR(50),
  segment NVARCHAR(50)
);
