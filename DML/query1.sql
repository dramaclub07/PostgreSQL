QUES 1:-> Insert three new employees into the "employees" table.
Query: INSERT INTO employees (employee_id, first_name, last_name, salary) VALUES (1, 'Abhinav', 'Lather', 20000), (2, 'Priyanshu', 'Singh', 10000), (3, 'Ayush', 'Nagar', 30000);
Output:
                      Table "public.employees"
   Column    |         Type          | Collation | Nullable | Default 
-------------+-----------------------+-----------+----------+---------
 employee_id | integer               |           |          | 
 first_name  | character varying(20) |           |          | 
 last_name   | character varying(20) |           |          | 
 salary      | numeric               |           | not null | 

INSERT 0 1 

 employee_id | first_name | last_name | salary 
-------------+------------+-----------+--------
           1 | Priyanshu    | Singh    |  20000
(1 row)

INSERT 0 1
INSERT 0 1



QUES 2:-> Retrieve all employee records from the "employees" table.
Query: SELECT * FROM employees;
Output:
 employee_id | first_name | last_name | salary 
-------------+------------+-----------+--------
           1 | Priyanshu  | Singh     |  20000
           2 | Abhinav    | Lather    |  10000
           3 | Ayush      | Nagar     |  30000
(3 rows)



QUES 3:-> Retrieve only the first and last names of all employees.
Query: SELECT first_name, last_name FROM employees;
Output:
 first_name | last_name 
------------+-----------
 Abhinav    | Lather
 Priyanshu  | Singh
 Ayush      | Nagar
(3 rows)



QUES 4:-> Update the salary of an employee with a specific employee_id.
Query: UPDATE employees SET salary = 50000 WHERE employee_id = 1;
Output:
UPDATE 1
 employee_id | first_name | last_name | salary 
-------------+------------+-----------+--------
           2 | Priyanshu  | Singh     |  50000
           3 | Ayush      | Nagar     |  30000
           1 | Abhinav    | Lather    |  20000
(3 rows)



QUES 5:-> Delete the record of an employee with a specific employee_id.
Query: DELETE FROM employees WHERE employee_id = 3;
Output:
DELETE 1
 employee_id | first_name | last_name | salary 
-------------+------------+-----------+--------
           2 | Priyanshu  | Singh     |  50000
           1 | Abhinav    | Lather    |  20000
(2 rows)



QUES 6:->Retrieve all employees whose salary is greater than a certain amount.
Query: SELECT * FROM employees WHERE salary > 15000;
Output:
 employee_id | first_name | last_name | salary 
-------------+------------+-----------+--------
           1 | Priyanshu    | Singh    |  50000
(1 row)



QUES 7:-> Insert five new products into the "products" table.
Query: INSERT INTO products (product_id, product_name, price) VALUES (1, 'Protein', 5000), (2, 'Creatine', 1200), (3, 'BCCA', 800), (4, 'Mass Gainer', 4000), (5, 'Multi Vitamins', 500);
Output:
            List of relations
 Schema |    Name     | Type  |  Owner   
--------+-------------+-------+----------
 public | departments | table | postgres
 public | employees   | table | postgres
 public | products    | table | postgres
(3 rows)

                        Table "public.products"
    Column    |         Type          | Collation | Nullable | Default 
--------------+-----------------------+-----------+----------+---------
 product_id   | integer               |           |          | 
 product_name | character varying(30) |           |          | 
 price        | numeric               |           |          | 

INSERT 0 5
 product_id |  product_name  | price 
------------+----------------+-------
          1 | Protein        |  5000
          2 | Creatine       |  1200
          3 | BCCA           |   800
          4 | Mass Gainer    |  4000
          5 | Multi Vitamins |   600
(5 rows)



QUES 8:-> Update the price of a specific product.
Query: UPDATE products SET price = 7000 WHERE product_id = 1;
Output:
UPDATE 1
 product_id |  product_name  | price 
------------+----------------+-------
          2 | Creatine       |  1200
          3 | BCCA           |   800
          4 | Mass Gainer    |  4000
          5 | Multi Vitamins |   600
          1 | Protein        |  7000
(5 rows)



QUES 9:-> Retrieve all products with a price between a certain range.
Query: SELECT * FROM products WHERE price BETWEEN 700 AND 5000;
Output:
 product_id | product_name | price 
------------+--------------+-------
          2 | Creatine     |  1200
          3 | BCCA         |   800
          4 | Mass Gainer  |  4000
(3 rows)



QUES 10:-> Delete all products with a price below a certain threshold.
Query: DELETE FROM products WHERE price < 600;
Output:
DELETE 1
 product_id | product_name | price 
------------+--------------+-------
          2 | Creatine     |  1200
          3 | BCCA         |   800
          4 | Mass Gainer  |  4000
          1 | Protein      |  7000
(4 rows)
