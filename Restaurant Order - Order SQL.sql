SELECT * FROM `portfolio-402507.restaurant_orders.order_details` LIMIT 1000

#find the date range of the table ans: 1/1/23 to 31/3/23
SELECT MIN(order_date),MAX(order_date)
FROM `portfolio-402507.restaurant_orders.order_details`

#How many orders were made in this date range? ans:5370
SELECT COUNT(DISTINCT(order_id))
FROM `portfolio-402507.restaurant_orders.order_details`

#how many items were made within this date range? ans:12234
SELECT COUNT(item_id)
FROM `portfolio-402507.restaurant_orders.order_details`


#which orders had the most number of items? ans:330
SELECT order_id, count(item_id) as no_of_items
FROM `portfolio-402507.restaurant_orders.order_details`
group by order_id
order by no_of_items desc


#how many orders had more than 12 items?

SELECT COUNT(*) AS orders_more_than_12_items
FROM

(SELECT order_id, count(item_id) as no_of_items
FROM `portfolio-402507.restaurant_orders.order_details`
group by order_id
HAVING no_of_items > 12) AS num_orders


