use pizza;
select * from pizza_sales;

select sum(total_price) as total_revenue from pizza_sales;

select sum(total_price) / count(distinct order_id) as Average_Order_Value from pizza_sales;

select sum(quantity) as Total_Pizzas_Sold from pizza_sales;

select count(distinct order_id) as Total_Orders_Placed from pizza_sales;

select cast(sum(quantity) / count(distinct order_id) as decimal (10,2)) as Average_Pizzas_per_Order from pizza_sales;


ALTER TABLE pizza_sales
ADD COLUMN new_order_date DATE;

-- Update the new column with the converted values
UPDATE pizza_sales
SET new_order_date = STR_TO_DATE(order_date, '%d-%m-%Y');

-- Drop the old text column
ALTER TABLE pizza_sales
DROP COLUMN order_date;

-- Rename the new column to the original name
ALTER TABLE pizza_sales
CHANGE COLUMN new_order_date order_date DATE;


SELECT DATE_FORMAT(order_date, '%W') as Order_day, COUNT(DISTINCT order_id) as Total_Orders
FROM Pizza_sales
GROUP BY Order_day;

SELECT date_format(order_date,'%M') as Order_Month, COUNT(DISTINCT order_id) as Total_Orders
FROM Pizza_sales
GROUP BY Order_Month
order by Total_Orders DESC;

Select pizza_category, cast(sum(total_price)  as decimal(10,2))as Total_sales , cast( sum(total_price) * 100 / (select sum(total_price) from pizza_sales) as decimal(10,2))  As Percentage_Sales 
from pizza_sales
group by pizza_category;


Select pizza_size, cast(sum(total_price)  as decimal(10,2))as Total_sales , cast( sum(total_price) * 100 / (select sum(total_price) from pizza_sales) as decimal(10,2))  As Percentage_Sales 
from pizza_sales
group by pizza_size;


Select pizza_category, sum(quantity) as Total_pizza 
from pizza_sales
group by pizza_category;


Select pizza_name, sum(total_price) as Total_revenue from pizza_sales
group by pizza_name
order by Total_revenue desc
limit 5;

Select pizza_name, sum(quantity) as Total_pizza from pizza_sales
group by pizza_name
order by Total_pizza desc
limit 5;


Select pizza_name, sum(quantity) as Total_pizza from pizza_sales
group by pizza_name
order by Total_pizza desc
limit 5;

Select pizza_name, sum(distinct order_id) as Total_orders from pizza_sales
group by pizza_name
order by Total_orders desc
limit 5;


Select pizza_name, sum(total_price) as Total_revenue from pizza_sales
group by pizza_name
order by Total_revenue asc
limit 5;

Select pizza_name, sum(quantity) as Total_pizza from pizza_sales
group by pizza_name
order by Total_pizza asc
limit 5;

Select pizza_name, sum(distinct order_id) as Total_orders from pizza_sales
group by pizza_name
order by Total_orders asc
limit 5;