-- 30_dim_product.sql
USE bi_demo;
GO
IF OBJECT_ID('dwh.dim_product') IS NOT NULL DROP TABLE dwh.dim_product;
CREATE TABLE dwh.dim_product(
  product_key INT IDENTITY(1,1) PRIMARY KEY,
  product_id INT NOT NULL UNIQUE,
  category NVARCHAR(50),
  brand NVARCHAR(50)
);
