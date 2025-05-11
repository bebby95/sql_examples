-- write a query using window functions to categorise how many category 1 products are in previous orders

WITH category_calc AS(
SELECT orders_id
, products_id
, qty
, category_1
, COUNT(DISTINCT category_1) OVER(PARTITION BY orders_id) AS nb_cat_1
, turnover
, SUM(turnover) OVER(PARTITION BY orders_id) AS orders_turnover
FROM `excellent-nexus-456110-a0.course17.gwz_sales_17`
)




SELECT *
  , CASE
      WHEN nb_cat_1 = 1 THEN 'mono_category'
      WHEN nb_cat_1 > 1 THEN 'multi_category'
      ELSE NULL
    END AS orders_cat_type
FROM category_calc