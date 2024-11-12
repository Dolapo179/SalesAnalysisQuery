
select * from [supermarket_sales ]

--- Total Sales
select Product_line,  cast(sum(Sales) as decimal(10, 2)) as Total_Sales 
from [supermarket_sales ]
Group by Product_line
order by Total_Sales desc;

--- Total Quantity
select product_line, sum(Quantity) as Quantity_Sold 
from [supermarket_sales ]
Group by Product_line
order by Quantity_Sold desc;


--Customer segmentation by Sales
select Customer_type, cast(sum(Sales) as decimal(10,2)) as Customer_Type_by_Total_Sales
from [supermarket_sales ]
group by Customer_type
order by Customer_Type_by_Total_Sales desc;

select Gender, cast(sum(Sales) as decimal(10,2)) as Gender_by_Total_Sales
from [supermarket_sales ]
group by Gender
order by Gender_by_Total_Sales desc;

---payment_type_by_sales
select Payment_Type, CAST(sum(Sales) as decimal(10,2)) as Payment_type_by_Total_Sales 
from [supermarket_sales ]
group by Payment_Type
order by Payment_type_by_Total_Sales

--- sales and quantity by location
select City, sum(quantity) as Total_Quantity_Sold_by_City, cast(sum(Sales) as decimal(10, 2)) as Total_Sales_by_City
from [supermarket_sales ]
group by City
order by Total_Quantity_Sold_by_City desc;

--Daily Trend for Total Orders
select DATENAME(DW, Date) as Order_Day, sum(quantity)as Total_Quantity,  cast(sum(Sales)as decimal(10, 2)) as Total_Sales
from [supermarket_sales ]
group by DATENAME(DW, Date)
order by Total_Quantity desc;

--Monthly Trend for Orders
select DATENAME(MONTH, Date) as Order_Day, cast(sum(Sales)as decimal(10, 2)) as Total_Sales, sum(quantity)as Total_Quantity 
from [supermarket_sales ]
group by DATENAME(MONTH, Date)
order by Total_Sales desc;

--% of sales by product line
select Product_line, 
cast(sum(Sales) as decimal(10, 2)) as Total_Sales,
cast((sum(Sales) / (select sum(Sales) from [supermarket_sales ]) * 100) as decimal(10,2)) as percentage_of_sales
from [supermarket_sales ]
group by product_line
order by percentage_of_sales;

--% of sales by payment_type
select payment_type,
cast(sum(Sales) as decimal(10, 2)) as Total_Sales,
cast((sum(Sales) / (select sum(Sales) from [supermarket_sales ] ) * 100) as decimal(10,2)) as percentage_of_sales 
from [supermarket_sales ]
group by Payment_Type
order by Total_Sales;

--top 3 product line
select Top 3 Product_line, cast(sum(sales) as decimal(10,2)) as Total_sales 
from [supermarket_sales ]
group by Product_line
order by Total_sales desc;
--Bottom 3
select Top 3 Product_line, cast(sum(sales) as decimal(10,2)) as Total_sales 
from [supermarket_sales ]
group by Product_line
order by Total_sales;

--top 3
select Top 3 Product_line, cast(sum(Quantity) as decimal(10,2)) as Total_sold 
from [supermarket_sales ]
group by Product_line
order by Total_sold desc;
--bottom 3
select Top 3 Product_line, cast(sum(Quantity) as decimal(10,2)) as Total_sold 
from [supermarket_sales ]
group by Product_line
order by Total_sold;

