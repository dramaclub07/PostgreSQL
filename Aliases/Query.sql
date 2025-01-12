Ques :-> Create an alias for the full name of a customer by concatenating their first and last names.

Query: SELECT * FROM customersss;
Output:
 customer_id | first_name | last_name 
-------------+------------+-----------
           1 | John       | Smith
           2 | Jane       | Doe
           3 | Alice      | Brown
(3 rows)

Main Query: SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM customersss;
Output:
  full_name  
-------------
 John Smith
 Jane Doe
 Alice Brown
(3 rows)
