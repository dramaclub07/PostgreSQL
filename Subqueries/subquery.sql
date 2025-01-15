Question 1

**********How can you use a subquery to find employees who earn more than the average salary?**********

SELECT emp_name, emp_salary 
FROM employees 
WHERE emp_salary > (SELECT AVG(emp_salary) FROM employees);

 emp_id | emp_name | emp_salary 
--------+----------+------------
      2 | Raman    |   34590.00
      3 | Kalam    |   43600.00
(2 rows)

Question 2;

**********What is the difference between EXISTS and IN subqueries?**********

SELECT emp_name 
FROM employees e
WHERE EXISTS (SELECT 1 FROM departments d WHERE e.dept_id = d.dept_id);

EXISTS: Tests for the presence of rows in a subquery. It stops execution as soon as a match is found.

 emp_name 
----------
 Adarsh
 Raman
 Kalam
 Ajay
 Jyoti
(5 rows)

IN: Compares a value against a list of values returned by the subquery. It is  better suited for smaller datasets.

 emp_name 
----------
 Adarsh
 Raman
 Kalam
 Ajay
 Jyoti
(5 rows)

Question 3

**********How can you use a correlated subquery to find customers who have placed the most orders?**********

SELECT cust_id, COUNT(*) AS order_count 
FROM orders o1
WHERE order_count = (
    SELECT MAX(order_count) 
    FROM (
        SELECT cust_id, COUNT(*) AS order_count 
        FROM orders 
        GROUP BY cust_id
    ) o2
);

Question 4

**********Can you use a subquery in the FROM clause? If so, how?**********
query=>Yes, subqueries in the FROM clause act as derived tables.

SELECT department_name, avg_salary 
FROM (
    SELECT dept_id, AVG(emp_salary) AS avg_salary 
    FROM employees 
    GROUP BY dept_id
) AS avg_salaries
JOIN department 
ON avg_salaries.dept_id = department.dept_id;

 cust_id | order_count 
---------+-------------
       1 |           3
(1 row)

Question 5

**********How can you use a subquery to find the department with the highest average salary?**********

SELECT dept_id 
FROM (
    SELECT dept_id, AVG(emp_salary) AS avg_salary 
    FROM employees 
    GROUP BY dept_id
) AS avg_salaries
WHERE avg_salary = (SELECT MAX(avg_salary) FROM (
    SELECT AVG(emp_salary) AS avg_salary 
    FROM employees 
    GROUP BY dept_id
) AS inner_avg);


 dept_name |     avg_salary     
-----------+--------------------
 HR        | 26900.000000000000
 Marketing | 34590.000000000000
 sales     | 43600.000000000000
 Finance   | 33000.000000000000
 Accounts  | 32000.000000000000
(5 rows)



Question 6;

**********What are some common performance issues with subqueries?**********

Correlated Subqueries: Run for each row of the outer query, leading to performance degradation.
Materialization: Subqueries in the FROM clause may create temporary tables, consuming resources.
Non-Indexed Columns: Subqueries that filter on non-indexed columns perform poorly.
Large Result Sets: Subqueries that return large datasets can slow down the query.

Question 7;

**********How can you optimize a subquery to improve performance?**********

ans=>>>>  i)Use Joins Instead of Subqueries: Joins are generally faster.


Questuion 8;
**********Can you use a subquery within another subquery?**********

yes

SELECT emp_name 
FROM employees 
WHERE emp_salary > (
    SELECT AVG(emp_salary) 
    FROM employees 
    WHERE dept_id IN (
        SELECT dept_id 
        FROM departments 
        WHERE location_id = 1
    )
);

 dept_id 
---------
     103
(1 row)


QUESTION 9;

********** How can you use a subquery to find duplicate records in a table?**********

SELECT order_name, COUNT(*) AS order_count 
FROM orders 
GROUP BY order_name 
HAVING COUNT(*) > 1;

 order_name | order_count 
------------+-------------
 Pan        |           2
 M416       |           2
(2 rows)

Question 10;

*********What are some real-world examples of how subqueries are used in business applications?*********

Employee Analysis: Identifying employees earning above the average salary.

Sales Analysis: Determining top customers by revenue or number of purchases.

Inventory Management: Finding products with below-average stock.

Financial Reporting: Calculating department-wise or branch-wise metrics.

Customer Segmentation: Classifying customers based on purchase history.

Fraud Detection: Detecting duplicate or suspicious transactions.