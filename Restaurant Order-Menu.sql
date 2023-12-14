SELECT * FROM `portfolio-402507.restaurant_orders.menu` LIMIT 1000

#find no of items in the menu ans:32
SELECT COUNT(*) 
FROM `portfolio-402507.restaurant_orders.menu`

#most expensive dish ans:Shrimp Scampi 19.95
SELECT item_name, price
FROM `portfolio-402507.restaurant_orders.menu`
ORDER BY price DESC
LIMIT 1

#least expensive dish ans: Edamame 5.0
SELECT item_name, price
FROM `portfolio-402507.restaurant_orders.menu`
ORDER BY price ASC
LIMIT 1

#no of Italian dishes ans:9
SELECT COUNT(*)
FROM `portfolio-402507.restaurant_orders.menu`
WHERE category='Italian'

#Most expensive Italian dish : Shrimp Scampi 19.95
SELECT *
FROM `portfolio-402507.restaurant_orders.menu`
WHERE category ='Italian'
ORDER BY price DESC

#Least expensive Italian dish : Spaghetti 14.50
SELECT *
FROM `portfolio-402507.restaurant_orders.menu`
WHERE category ='Italian'
ORDER BY price ASC
LIMIT 1

#no. of dishes in each category
SELECT category, COUNT(menu_item_id) AS num_of_dishes
FROM `portfolio-402507.restaurant_orders.menu`
GROUP BY category

#Average dish price in each category
SELECT category, ROUND(AVG(price),2) AS avg_price
FROM `portfolio-402507.restaurant_orders.menu`
GROUP BY category






