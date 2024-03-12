--- NUMBER OF EMPLOYEE HOURS WORKED PER STORE ---

--Store 1
SELECT ROUND(SUM(EXTRACT(EPOCH FROM (end_time - start_time)) / 3600))
AS total_hours_worked
FROM timesheet
WHERE store_id=1;

--Store 2
SELECT ROUND(SUM(EXTRACT(EPOCH FROM (end_time - start_time)) / 3600))
AS total_hours_worked
FROM timesheet
WHERE store_id=2;

--Store 3
SELECT ROUND(SUM(EXTRACT(EPOCH FROM (end_time - start_time)) / 3600))
AS total_hours_worked
FROM timesheet
WHERE store_id=3;

--- NUMBER OF PURCHASES PER STORE ---

--Store 1
SELECT COUNT(*) AS total_sales
FROM sales
WHERE store_id = 1;

--Store 2
SELECT COUNT(*) AS total_sales
FROM sales
WHERE store_id = 2;

--Store 3
SELECT COUNT(*) AS total_sales
FROM sales
WHERE store_id = 3;

--- PROFIT PER STORE ---

--Store 1
SELECT SUM(sales_price) AS total_profit
FROM sales
WHERE store_id = 1;

--Store 2
SELECT SUM(sales_price) AS total_profit
FROM sales
WHERE store_id = 2;

--Store 3
SELECT SUM(sales_price) AS total_profit
FROM sales
WHERE store_id = 3;