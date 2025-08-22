-- 10_dim_date.sql
USE bi_demo;
GO
IF OBJECT_ID('dwh.dim_date') IS NOT NULL DROP TABLE dwh.dim_date;
CREATE TABLE dwh.dim_date(
  date_key INT PRIMARY KEY,
  date_value DATE NOT NULL,
  year INT NOT NULL,
  month INT NOT NULL,
  day INT NOT NULL
);
-- Seed minimal dates (for demo)
INSERT INTO dwh.dim_date(date_key, date_value, year, month, day)
VALUES (20240103, '2024-01-03', 2024, 1, 3),
       (20240104, '2024-01-04', 2024, 1, 4),
       (20240210, '2024-02-10', 2024, 2, 10),
       (20240218, '2024-02-18', 2024, 2, 18),
       (20240302, '2024-03-02', 2024, 3, 2);
