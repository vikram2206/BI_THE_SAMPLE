-- 99_views_reporting.sql
USE bi_demo;
GO
IF OBJECT_ID('dwh.vw_sales_kpis') IS NOT NULL DROP VIEW dwh.vw_sales_kpis;
GO
CREATE VIEW dwh.vw_sales_kpis AS
SELECT
  d.year,
  d.month,
  SUM(f.qty * f.net_price * (1.0 - f.discount)) AS revenue,
  SUM(CASE WHEN f.return_flag = 1 THEN (f.qty * f.net_price) ELSE 0 END) AS returns_value,
  AVG(f.net_price) AS avg_price
FROM dwh.fact_sales f
JOIN dwh.dim_date d ON d.date_key = f.date_key
GROUP BY d.year, d.month;
GO

-- Note: For SSAS/OLAP (multidimensional) you would define cubes/measure groups.
-- This repo documents concepts; see docs/ for discussion.
