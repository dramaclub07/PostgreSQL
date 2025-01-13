
1. Customer Order Analysis
Scenario: You have two tables: customers and orders.
Problem: Identify customers who have not placed any orders.
Solution: Use a LEFT JOIN to retrieve all customers and their corresponding orders. Filter for customers where the order_id is NULL.

Query: SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    o.order_id
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id;

 customer_id | customer_name 
-------------+---------------
           5 | CK Patel
           6 | Ayush Mishra
           4 | Varun Reddy
           7 | Alekh Verma
(4 rows)

2. Product Inventory Tracking
Scenario: You have tables: products, inventories, and warehouses.
Problem: Determine which products are not currently stocked in any warehouse.
Solution: Use a combination of LEFT JOIN and RIGHT JOIN to identify products that have no corresponding entries in the inventories table.


Query: 
SELECT 
     p.product_id,
     p.product_name
 FROM 
     products p
 LEFT JOIN 
     inventories i
 ON 
     p.product_id = i.product_id
 WHERE 
     i.inventory_id IS NULL
 
 UNION
 
 SELECT 
     p.product_id,
     p.product_name
 FROM 
     inventories i
 RIGHT JOIN 
     products p
 ON 
     p.product_id = i.product_id
 WHERE 
     i.inventory_id IS NULL
 product_id |  product_name   
------------+-----------------
          8 | Vitamin D3
          6 | BCAA
          7 | Zinc Supplement
(3 rows)

3. Employee Performance Analysis
Scenario: You have tables: employees, departments, and sales.
Problem: Find the top-performing department based on total sales.
Solution: Use INNER JOIN to combine employee, department, and sales data. Group the results by department and calculate the total sales for each department.


Query: SELECT 
     d.department_id,
     d.department_name,
     SUM(s.sale_amount) AS total_sales
 FROM departments d
 INNER JOIN employees e ON d.department_id = e.department_id
 INNER JOIN sales s ON e.employee_id = s.employee_id
 GROUP BY d.department_id, d.department_name
 ORDER BY total_sales DESC;

 department_id | department_name | total_sales 
---------------+-----------------+-------------
             1 | Sales           |     1600.00
(1 row)


4. Website User Activity
Scenario: You have tables: users, sessions, and page_views.
Problem: Identify users who have never logged in to the website.
Solution: Use a LEFT JOIN to connect users with their sessions. Filter for users with no corresponding sessions.
Query:SELECT 
     u.user_id,
     u.username,
     u.email
 FROM 
     users u
 LEFT JOIN 
     sessions s
 ON 
     u.user_id = s.user_id
 WHERE 
     s.session_id IS NULL;

Output:

 user_id | user_name |  
---------+----------+
       4 | Liana    | 
       3 | barlie  | 
(2 rows)





5. Social Media Engagement
Scenario: You have tables: users, posts, and likes.
Problem: Find the most popular post (the one with the most likes).
Solution: Use INNER JOIN to connect posts with their likes. Group the results by post and count the number of likes for each post.

 post_id | user_id | like_count 
---------+---------+------------
(0 rows)


6. E-commerce Order Fulfillment
Scenario: You have tables: orders, order_items, and products.
Problem: Determine which products are frequently ordered together.
Solution: Use INNER JOIN to connect orders with their items and products. Analyze the frequency of product pairs within the same order.

 product_id | product_id | pair_count 
------------+------------+------------
          3 |          4 |          1
          1 |          2 |          1
          2 |          5 |          1
(3 rows)

7. Financial Transaction Analysis
Scenario: You have tables: accounts, transactions, and customers.
Problem: Find customers with suspicious transaction activity (e.g., large or unusual amounts).
Solution: Use INNER JOIN to connect accounts, transactions, and customers. Analyze transaction data to identify patterns or anomalies.
Query: SELECT 
     c.customer_id,
     c.first_name,
     t.transaction_id,
     t.transaction_date,
     t.transaction_type,
     t.amount,
     a.account_type,
     a.balance
 FROM 
     customers c
 INNER JOIN 
     accounts a
 ON 
     c.customer_id = a.customer_id
 INNER JOIN 
     transactions t
 ON 
     a.account_id = t.account_id
 WHERE 
     t.amount > 200 -- Large transactions (threshold for anomaly)
     OR 
     t.transaction_date IN (
         SELECT 
             t1.transaction_date
         FROM 
             transactions t1
         INNER JOIN 
             transactions t2
         ON 
             t1.account_id = t2.account_id
         WHERE 
             t1.transaction_id <> t2.transaction_id
             AND ABS(EXTRACT(EPOCH FROM (t1.transaction_date - t2.transaction_date))) < 300 -- Transactions within 5 minutes
     )
     OR 
     c.customer_id IN (
         SELECT 
             c2.customer_id
         FROM 
             customers c2
         INNER JOIN 
             accounts a2
         ON 
             c2.customer_id = a2.customer_id
         INNER JOIN 
             transactions t3
         ON 
             a2.account_id = t3.account_id
         GROUP BY 
             c2.customer_id
         HAVING 
             COUNT(t3.transaction_id) > 10 -- Frequent transactions (threshold for anomaly)
     )
 ORDER BY 
     t.transaction_date DESC, t.amount DESC;
 transaction_id | account_id |  transaction_date   | amount  | transaction_type 
----------------+------------+---------------------+---------+------------------
              1 |          1 | 2025-01-01 00:00:00 | 1500.00 | Deposit
              2 |          2 | 2025-01-05 00:00:00 |  200.00 | Withdrawal
              3 |          3 | 2025-01-10 00:00:00 | 2500.00 | Deposit
              4 |          4 | 2025-01-15 00:00:00 | 1000.00 | Withdrawal
              5 |          5 | 2025-01-20 00:00:00 | 3000.00 | Deposit
(5 rows)

 

8. Healthcare Patient Monitoring
Scenario: You have tables: patients, appointments, and diagnoses.
Problem: Identify patients who have not been seen by a doctor in the past year.
Solution: Use a LEFT JOIN to connect patients with their appointments. Filter for patients with no appointments within the specified time frame.

Query: SELECT 
     p.patient_id,
     p.patient_name
 FROM 
     patients p
 LEFT JOIN 
     appointments a
 ON 
     p.patient_id = a.patient_id
 WHERE 
     a.appointment_date IS NULL
     OR a.appointment_date < CURRENT_DATE - INTERVAL '1 year';

 patient_id | patient_name 
------------+--------------
          1 | John Doe
          2 | Jane Smith
          3 | Sam Wilson
          4 | Chris Pratt
          5 | Anna Lee
(5 rows)

 patient_id | patient_name | appointment_date 
------------+--------------+------------------
          1 | John Doe     | 2025-01-15
          2 | Jane Smith   | 2025-01-16
          3 | Sam Wilson   | 2025-01-17
          4 | Chris Pratt  | 2025-01-18
          5 | Anna Lee     | 2025-01-19
(5 rows)


9. Educational Student Performance
Scenario: You have tables: students, courses, and grades.
Problem: Find students who are failing a particular course.
Solution: Use INNER JOIN to connect students, courses, and grades. Filter for students with grades below a certain threshold.

Query: SELECT 
     s.first_name,
     s.last_name,
     c.course_name,
     g.grade
 FROM students s
 INNER JOIN grades g ON s.student_id = g.student_id
 INNER JOIN courses c ON g.course_id = c.course_id
 WHERE g.grade < 40.00;

Output:
 first_name | last_name | course_name | grade 
------------+-----------+-------------+-------
 Ayush      | Nagar     | Science     | 35.00
 Varun      | Thakur    | Mathematics | 30.00
(2 rows)

Ques10 :-> Supply Chain Management
Scenario: You have tables: suppliers, products, and orders.
Problem: Determine which suppliers have not shipped any orders in the last quarter.
Solution: Use LEFT JOIN to identify suppliers with no corresponding orders within the specified time period.

Query: SELECT 
     s.supplier_id,
     s.supplier_name,
     s.contact_name
 FROM suppliersss s
 LEFT JOIN productsss p ON s.supplier_id = p.supplier_id
 LEFT JOIN ordersss o ON p.product_id = o.product_id
 WHERE o.order_date IS NULL 
    OR o.order_date < '2024-10-01'  
    OR o.order_date > '2024-12-31';
    
Output:
 supplier_id | supplier_name | contact_name 
-------------+---------------+--------------
           4 | Supplier D    | Ayush Nagar
           3 | Supplier C    | Varun Thakur
(2 rows)


