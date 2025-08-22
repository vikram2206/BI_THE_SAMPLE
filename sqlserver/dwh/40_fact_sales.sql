-- 40_fact_sales.sql
USE bi_demo;
GO
IF OBJECT_ID('dwh.fact_sales') IS NOT NULL DROP TABLE dwh.fact_sales;
CREATE TABLE dwh.fact_sales(
  order_id INT NOT NULL,
  date_key INT NOT NULL,
  customer_key INT NOT NULL,
  product_key INT NOT NULL,
  qty INT NOT NULL,
  net_price DECIMAL(12,2) NOT NULL,
  discount DECIMAL(5,2) NOT NULL,
  return_flag BIT NOT NULL,
  CONSTRAINT pk_fact PRIMARY KEY(order_id),
  CONSTRAINT fk_date   FOREIGN KEY(date_key)    REFERENCES dwh.dim_date(date_key),
  CONSTRAINT fk_cust   FOREIGN KEY(customer_key) REFERENCES dwh.dim_customer(customer_key),
  CONSTRAINT fk_prod   FOREIGN KEY(product_key) REFERENCES dwh.dim_product(product_key)
);
