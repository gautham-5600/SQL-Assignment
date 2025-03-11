-- Retrieve the current system date.
-- select sysdate from sh.sales;

-- Retrieve the current timestamp including fractional seconds.
-- select systimestamp from sh.sales

-- Get the database time zone.
-- select dbtimezone from sh.sales

-- Get the session time zone.
-- select sessiontimezone from sh.sales

-- Find the next week’s date from SYSDATE.
-- select sysdate,sysdate+7 as nextweek from sh.sales

-- Subtract 17 days from SYSDATE.
-- select sysdate,sysdate-17 as previousweek from sh.sales

-- Retrieve the TIME_ID and calculate TIME_ID + 7 for all sales transactions.
-- select time_id, time_id+interval '7' day from sh.sales

-- Add 2 hours to the SYSTIMESTAMP.
-- select systimestamp,systimestamp+interval '2' hour from sh.sales

-- Add 2 minutes to the SYSTIMESTAMP.
-- select systimestamp,systimestamp+interval '2' minute from sh.sales

-- Add 2 seconds to the SYSTIMESTAMP.
-- select systimestamp,systimestamp+interval '2' second from sh.sales

-- Add 2 years to the SYSTIMESTAMP.
-- select systimestamp,systimestamp+interval '2' year from sh.sales

-- Add 2 months to the SYSTIMESTAMP.
-- select systimestamp,systimestamp+interval '2' month from sh.sales

-- Add 2 days and 4 hours to SYSTIMESTAMP.
-- select systimestamp,systimestamp+interval '2' DAY+interval '4' hour from sh.sales

-- Extract year, month, and day from the TIME_ID column.
-- select time_id ,extract(year from time_id) year,extract(month from time_id) as month, 
-- extract(day from time_id) as day from sh.sales

-- Find the last day of the month for each TIME_ID.
-- select time_id, last_day(time_id) from sh.sales

-- *********************************************************************************************

-- Retrieve all records from the sales.sh table.
-- select * from sh.sales

-- Get the total number of sales transactions recorded.
-- select count(*) from sh.sales

-- Retrieve unique product IDs from the sales.sh table.
-- select distinct prod_id from sh.sales

-- Get all sales details where the quantity sold is more than 5.
-- select * from sh.sales where quantity_sold > 5

-- Find the total revenue by multiplying price and quantity for all sales.
-- select sum(quantity_sold * amount_sold) from sh.sales

-- Find the average sale amount per transaction.
-- select avg(amount_sold * quantity_sold) from sh.sales

-- Retrieve the top 5 highest sales transactions by amount.
-- select * from sh.sales order by quantity_sold * amount_sold desc fetch first 5 rows only

-- Retrieve all sales made for a specific product ID (P1001).
-- select * from sh.sales where prod_id=1001

-- Count the number of transactions per product.
-- select prod_id, count(*) as transactions_count from sh.sales
-- group by prod_id
-- order by transactions_count desc

-- Find the total number of unique customers who made purchases.
-- select count(distinct cust_id) as unique_cust from sh.sales

-- *********************************************************************************************

-- Time Functions

-- Retrieve all sales transactions that occurred in the last 30 days.
-- select * from sh.sales where time_id >= sysdate -30

-- Extract the year from the sales date column.
-- select time_id, extract(year from time_id) from sh.sales

-- Extract the month from the sales date column.
-- select time_id, extract(month from time_id) from sh.sales

-- Find the total sales for each month.
-- select to_char(time_id, 'YYYY-MM')as sales_month,
-- sum(quantity_sold*amount_sold) as total_sales
-- from sh.sales group by to_char(time_id, 'YYYY-MM') order by sales_month

-- Retrieve sales records for transactions that occurred on weekends.
-- select * from sh.sales where to_char(time_id, 'D') in ('1', '7')

-- Find the first and last recorded sales transaction dates.


-- Retrieve sales transactions that happened on a specific date ('2024-03-01').
-- select * from sh.sales where trunc(time_id) = to_date('2024-03-01', 'YYYY-MM-DD')

-- Count the number of sales transactions that happened in the last 7 days.
-- select count(*) as sales_transactions from sh.sales where time_id >= sysdate - 7 

-- Retrieve sales that occurred during a specific time range (09:00 AM - 12:00 PM).
-- select * from sh.sales where to_char(time_id, 'HH24:MI:SS') between '09:00:00' and '12:00:00'

-- Get the difference in days between the first and the last transaction in the table.
-- select max(time_id) - min(time_id) as difference_days from sh.sales

-- *********************************************************************************************