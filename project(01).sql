--create database project
use project
select*from sales
select*from Additional
--combining additional table and data table and 
--creating new_table as sales
select * into sales from additional
union all
select*from data
----
select*from sales
select*from customers
-- combining sales table and customers table on common-column 'Customer_Code' using inner join and 
-- creating new_table as Merge_Data
select sales.Date,
sales.Sales_Rep,
sales.Customer_Code,
sales.Sales,
sales.Profit,
sales.Region,
customers.Customer,
customers.Association_Date
into Merge_Data from sales
inner join customers
on sales.Customer_Code=customers.Customer_Code
----
select*from Merge_Data
----
--finding highest_sales with respect to Sales_Rep and Region from Merge_Data 
-- creating new_tables as High_Sales 
select Sales_Rep,Region,max(Sales) as Highest_Sales
into High_Sales
from Merge_Data
group by Region,Sales_Rep
----
select*from High_Sales
----
--finding Sales_Rep,Region,Sales and profit from Merge_Data
-- storeing the values into Table3
select Sales_Rep,Region,Sales,profit
into Table3
from Merge_Data
----
select*from Table3
----
--finding max,min,average and sum of the sales and profit 
--by Sales_Rep,Region,Customer from Merge_Data
-- with any two Sales_Rep and storing the values in Table4.
select  Sales_Rep,Region,Customer,
min(Sales)as Min_Sales,max(Sales) as Max_sales,
avg(Sales)as Avg_Sales,sum(Sales)as Sum_Sales,
min(profit)as Min_Profit,max(profit)as max_Profit,
avg(profit) as Average_Profit,sum(profit)as Sum_Profit
into Table4 from Merge_Data
where Sales_Rep in('Mark','Abhay')
group by Sales_Rep,Region,Customer
----
select*from Table4

