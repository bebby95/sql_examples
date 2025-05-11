-- query to calculate average customer spend and customer lifetime values

WITH basket_avg AS(
SELECT
  AVG(price) as avg_basket
, SUM(price) AS lifetime_spent
FROM `excellent-nexus-456110-a0.Olist.olist_customer_orders_info`
WHERE date_date > '2018-07-31'
GROUP BY order_id
)



SELECT ROUND(AVG(avg_basket),2) AS aov_month
, ROUND(AVG(lifetime_spent),2) AS clv_global
FROM basket_avg
