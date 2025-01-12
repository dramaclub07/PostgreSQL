
Q1 :-> Retrieve the names of all customers from the city of 'New York'.

Query: SELECT * FROM customer;
Output:
 customer_id |    name     |    city     
-------------+-------------+-------------
           1 | John Smith  | New York
           2 | Jane Doe    | Los Angeles
           3 | Alice Brown | New York
           4 | Bob Johnson | Chicago
           5 | Emma Davis  | New York
(5 rows)

Main query: SELECT name FROM customer WHERE city = 'New York';
Output:
    name     
-------------
 John Smith
 Alice Brown
 Emma Davis



Q2 :-> Find all orders placed after a specific date.

Query: SELECT * FROM orders;
Output:
 order_id | customer_id | order_date | total_amount 
----------+-------------+------------+--------------
        6 |           1 | 2025-01-01 |       100.00
        7 |           2 | 2025-01-02 |       200.00
        8 |           1 | 2025-01-03 |       150.00
        9 |           3 | 2025-01-04 |        50.00
       10 |           2 | 2025-01-05 |       300.00
(5 rows)

Main query: SELECT * FROM orders WHERE order_date > '2025-01-03';
Output:
 order_id | customer_id | order_date | total_amount 
----------+-------------+------------+--------------
        9 |           3 | 2025-01-04 |        50.00
       10 |           2 | 2025-01-05 |       300.00
(2 rows)



Q3:-> List all products with a price between $50 and $100.

Query: SELECT * FROM products;
Output:
 product_id | product_name | price  
------------+--------------+--------
          1 | T-Shirt      |  25.00
          2 | Jeans        |  80.00
          3 | Jacket       | 100.00
          4 | Hat          |  50.00
          5 | Shoes        | 150.00
(5 rows)

Main query: SELECT product_name, price FROM products WHERE price BETWEEN 50 AND 100;
Output:
 product_name | price  
--------------+--------
 Jeans        |  80.00
 Jacket       | 100.00
 Hat          |  50.00
(3 rows)



Q4 :-> Join the customers and orders tables to display customer information for each order.

Main query:
SELECT 
    orders.order_id,
    customer.name AS customer_name,
    customer.city,
    orders.order_date,
    orders.total_amount
  FROM orders
  INNER JOIN customer
  ON orders.customer_id = customer.customer_id;

Output:
 order_id | customer_name |    city     | order_date | total_amount 
----------+---------------+-------------+------------+--------------
        6 | John Smith    | New York    | 2025-01-01 |       100.00
        7 | Jane Doe      | Los Angeles | 2025-01-02 |       200.00
        8 | John Smith    | New York    | 2025-01-03 |       150.00
        9 | Alice Brown   | New York    | 2025-01-04 |        50.00
       10 | Jane Doe      | Los Angeles | 2025-01-05 |       300.00
(5 rows)



Q5 :-> Group orders by customer and calculate the total amount spent by each customer.
Main query:
SELECT 
    customer.name AS customer_name,
    SUM(orders.total_amount) AS total_spent
  FROM orders
  INNER JOIN customer
  ON orders.customer_id = customer.customer_id
  GROUP BY customer.name
  ORDER BY total_spent DESC;

Output:
 customer_name | total_spent 
---------------+-------------
 Jane Doe      |      500.00
 John Smith    |      250.00
 Alice Brown   |       50.00
(3 rows)



Q6 :-> Sort the results of a query by a specific column in ascending or descending order.

Main query: SELECT order_id, customer_id, order_date, total_amount FROM orders ORDER BY order_date ASC;
Output:
 order_id | customer_id | order_date | total_amount 
----------+-------------+------------+--------------
        6 |           1 | 2025-01-01 |       100.00
        7 |           2 | 2025-01-02 |       200.00
        8 |           1 | 2025-01-03 |       150.00
        9 |           3 | 2025-01-04 |        50.00
       10 |           2 | 2025-01-05 |       300.00
(5 rows)



Q7 :-> Limit the number of rows returned by a query to a specific value.

Main query: SELECT order_id, customer_id, order_date, total_amount FROM orders LIMIT 3;
Output:
 order_id | customer_id | order_date | total_amount 
----------+-------------+------------+--------------
        6 |           1 | 2025-01-01 |       100.00
        7 |           2 | 2025-01-02 |       200.00
        8 |           1 | 2025-01-03 |       150.00
(3 rows)
