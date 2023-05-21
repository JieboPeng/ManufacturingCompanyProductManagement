-- Filename: CustomerOrder&ProductApplication-View
-- Authors: Jiebo Peng, Lilin Zeng, Si Wang
-- Description: The View section is to use dynamic and materialized views to make access easier

-- Question 1: Create dynamic view which name is product_V. In the view, contains product code, 
-- description and quantity on hand which has condition that price equal 5452 or 8729.
DROP VIEW IF EXISTS product_V;
CREATE VIEW product_V AS
SELECT code, description, qty_on_hand 
FROM product 
WHERE price = 5452 OR price = 8729;


-- Question 2: Create a materialized view which name is order_MV. 
-- This materialized view is to calculate the count of orders, 
-- group by customer id that count of orders is greater than 1 from order table
-- Unfortunately, MySQL does not directly support materialized views.
-- So we still create the dynamic view named order_V.
DROP VIEW IF EXISTS order_V;
CREATE VIEW order_V AS
SELECT COUNT(order_number), customer_id
FROM `order`
GROUP BY customer_id
HAVING COUNT(order_number) > 1;