select * from pizza_sales;
--Total Revenue
select sum(total_price) as Total_Revenue from pizza_sales;
--Average Sales
select sum(total_price)/count(distinct(order_id)) as Average_Sales from pizza_sales
--Total Pizza Sold
select sum(quantity) as Total_pizza_sold from pizza_sales;
--Total Orders
select count(Distinct(order_id)) as Total_orders from pizza_sales;
--Average pizza per order
select cast(cast(sum(quantity) as decimal(10,2))/cast(count(Distinct(order_id)) as decimal(10,2)) as decimal(4,2)) as Average_pizza_per_order from pizza_sales;
--orders each day
select DATENAME(dw,order_date) as order_day, count(Distinct order_id) as Total_order from pizza_sales group by DATENAME(dw,order_date);
--Orders each hour
select datepart(hour,order_time) as order_time, count(Distinct order_id) as Total_orders from pizza_sales group by datepart(Hour,order_time) order by 1;
--Percentage of Sales by Pizza Category
select pizza_category, Cast(sum(total_price)*100/(select sum(total_price) from pizza_sales) as decimal(10,2)) as Percentage_of_total_sales from pizza_sales group by pizza_category;
--Percentage of Sales by Pizza Size
select pizza_size, Cast(sum(total_price)*100/(select sum(total_price) from pizza_sales) as decimal(10,2)) as Percentage_of_total_sales from pizza_sales group by pizza_size;
--Total Pizza sold by pizza Category
select pizza_category, sum(quantity) as Number_of_pizza from pizza_sales group by pizza_category;
--Top 5 Best selling pizzas
select Top 5 pizza_name,sum(quantity) as total_quantity from pizza_sales group by pizza_name order by 2 desc;
--Bottom 5 Best selling pizzas
select Top 5 pizza_name,sum(quantity) as Total_quantity from pizza_sales group by pizza_name order by 2 asc;
 