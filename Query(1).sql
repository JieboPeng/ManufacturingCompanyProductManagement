-- Filename: CustomerOrder&ProductApplication-Query
-- Authors: Jiebo Peng, Lilin Zeng, Si Wang
-- Description: The Query section is to create queries and execute queries. It demonstrate topics such as show all records,
-- show one column, show one column which has one or more conditions, join tables, perform aggregates and add other conditions, ect.

-- Question 1: A simple query that pulls all columns and rows from a table
-- Query 1: Select all customer informations from customer table
SELECT * FROM customer;

-- Question 2: A query that displays a subset of columns
-- Query 2: Select name and credit limit from customer table
SELECT name, credit_limit FROM customer;

-- Question 3: A query that displays a subset of columns with a single clause (predicate) WHERE statement
-- Query 3: Select order number and order date from order table that the quantity is 15
SELECT order_number, date FROM `order` WHERE qty= 15;

-- Question 4: A query that displays a subset of columns with a multi-clause (predicate) WHERE statement using AND/OR
-- Query 4: Select product code, description and quantity on hand from product table that price is 5452 or 8729
SELECT code, description, qty_on_hand FROM product WHERE price = 5452 OR price = 8729;

-- Question 5: A query that performs a single table join. In other words, you are joining 2 tables.
-- Query 5: Select customer id, name and order number which ordered quantity is greater than 18
SELECT customer.id, customer.name, `order`.order_number, `order`.qty
FROM customer JOIN `order` on customer.id = `order`.customer_id
WHERE `order`.qty > 18;

-- Question 6: A query that performs a multi-table join. In other words, you are joining 3 or more tables.
-- Query 6: Select product code, decription, part number that the inventory of the part is less than 10 and ordered by inventory
SELECT product.code AS profuct_code, product.description AS product_description, part.part_numb, part.inventory AS part_inventory
FROM product JOIN product_has_part ON product.code = product_has_part.product_code
             JOIN part ON product_has_part.part_part_numb = part.part_numb
WHERE part.inventory < 10
ORDER BY part.inventory;
             
-- Question 7: A query that performs an aggregate (count, min, max, sum, avg, etc.).
-- Query 7: Select the minimum price in product table
SELECT MIN(price) FROM product;


-- Question 8: A query that performs an aggregate (count, min, max, sum, avg, etc.) with a GROUP BY.
-- Query 8: Calculate the total quantity, grouped by date from the order table and ordered by date.
SELECT SUM(qty), date FROM `order`
GROUP BY date
ORDER BY date;

-- Question 9: A query that performs an aggregate (count, min, max, sum, avg, etc.). with a GROUP BY and a HAVING clause
-- Query 9: Calculate the count of orders, group by customer id that count of orders is greater than 1 from order table
-- (In brief, display the customers who placed more than 1 order)
SELECT COUNT(order_number), customer_id
FROM `order`
GROUP BY customer_id
HAVING COUNT(order_number) > 1;

-- Question 10: A query that performs a subquery either as part of the WHERE clause or as a derived/virtual table.
-- Query 10: Select customer name and credit limit that placed order on 2022-11-10 
SELECT name As customer_name, credit_limit 
FROM customer 
WHERE id = (SELECT customer_id FROM `order` WHERE date = '2022-11-10');

-- Question 11: A query that performs an aggregate with a join and a group by.
-- Query 11: Select the total quantity that every customer has ordered
SELECT customer.id, customer.name, SUM(`order`.qty) AS total_qty
FROM customer JOIN `order` ON customer.id = `order`.customer_id
GROUP BY customer.id;



