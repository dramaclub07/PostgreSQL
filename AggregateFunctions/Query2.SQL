           List of relations
 Schema |    Name    | Type  |  Owner   
--------+------------+-------+----------
 public | department | table | postgres
 public | employees  | table | postgres
 public | product    | table | postgres
 public | sales      | table | postgres
(4 rows)

                       Table "public.employees"
   Column    |         Type          | Collation | Nullable | Default 
-------------+-----------------------+-----------+----------+---------
 employee_id | integer               |           | not null | 
 first_name  | character varying(50) |           |          | 
 last_name   | character varying(50) |           |          | 
 salary      | numeric(10,2)         |           | not null | 
Indexes:
    "employees_pkey" PRIMARY KEY, btree (employee_id)

                        Table "public.department"
     Column      |         Type          | Collation | Nullable | Default 
-----------------+-----------------------+-----------+----------+---------
 department_id   | integer               |           | not null | 
 department_name | character varying(50) |           |          | 
Indexes:
    "department_pkey" PRIMARY KEY, btree (department_id)

 department_id | department_name 
---------------+-----------------
(0 rows)

DROP TABLE
           List of relations
 Schema |   Name    | Type  |  Owner   
--------+-----------+-------+----------
 public | employees | table | postgres
 public | product   | table | postgres
 public | sales     | table | postgres
(3 rows)

CREATE TABLE
           List of relations
 Schema |    Name    | Type  |  Owner   
--------+------------+-------+----------
 public | department | table | postgres
 public | employees  | table | postgres
 public | product    | table | postgres
 public | sales      | table | postgres
(4 rows)

                        Table "public.product"
    Column    |         Type          | Collation | Nullable | Default 
--------------+-----------------------+-----------+----------+---------
 product_id   | integer               |           | not null | 
 product_name | character varying(20) |           |          | 
 price        | numeric(10,2)         |           |          | 
Indexes:
    "product_pkey" PRIMARY KEY, btree (product_id)

 employee_id | first_name | last_name |  salary  
-------------+------------+-----------+----------
           2 | Abhinav    | Lather    | 30000.00
         101 | Vishal     | Kanojia   | 89990.00
         102 | Aryan      | Negi      | 87956.00
           1 | Priyanshu  | Singh     | 92000.00
(4 rows)

 employee_id |   average_salary   
-------------+--------------------
           2 | 30000.000000000000
           1 | 92000.000000000000
         101 | 89990.000000000000
         102 | 87956.000000000000
(4 rows)

 product_id |     product_name     |  price  
------------+----------------------+---------
          2 | Creatine Monohydrate | 1200.00
          4 | Mass Gainer          | 4000.00
          1 | Protein              | 7000.00
(3 rows)

                      Table "public.sales"
     Column     |     Type      | Collation | Nullable | Default 
----------------+---------------+-----------+----------+---------
 sale_id        | integer       |           | not null | 
 product_id     | integer       |           |          | 
 salesperson_id | integer       |           |          | 
 category_id    | integer       |           |          | 
 sales_amount   | numeric(10,2) |           |          | 
 revenue        | numeric(10,2) |           |          | 
Indexes:
    "sales_pkey" PRIMARY KEY, btree (sale_id)

 sale_id | product_id | salesperson_id | category_id | sales_amount | revenue 
---------+------------+----------------+-------------+--------------+---------
(0 rows)

INSERT 0 5
 sale_id | product_id | salesperson_id | category_id | sales_amount | revenue 
---------+------------+----------------+-------------+--------------+---------
       1 |        101 |              1 |           1 |       500.00 | 1000.00
       2 |        102 |              1 |           2 |       300.00 |  600.00
       3 |        103 |              2 |           1 |       700.00 | 1400.00
       4 |        104 |              3 |           2 |       400.00 |  800.00
       5 |        105 |              2 |           3 |       900.00 | 1800.00
(5 rows)

 category_id | total_sales 
-------------+-------------
           3 |      900.00
           2 |      700.00
           1 |     1200.00
(3 rows)

 product_id |     product_name     |  price  
------------+----------------------+---------
          2 | Creatine Monohydrate | 1200.00
          4 | Mass Gainer          | 4000.00
          1 | Protein              | 7000.00
(3 rows)

 max_price | min_price 
-----------+-----------
   7000.00 |   1200.00
(1 row)

CREATE TABLE
INSERT 0 5
 customer_id | count_order 
-------------+-------------
           3 |           1
           2 |           2
           1 |           2
(3 rows)

 sale_id | product_id | salesperson_id | category_id | sales_amount | revenue 
---------+------------+----------------+-------------+--------------+---------
       1 |        101 |              1 |           1 |       500.00 | 1000.00
       2 |        102 |              1 |           2 |       300.00 |  600.00
       3 |        103 |              2 |           1 |       700.00 | 1400.00
       4 |        104 |              3 |           2 |       400.00 |  800.00
       5 |        105 |              2 |           3 |       900.00 | 1800.00
(5 rows)

 salesperson_id | total_revenue 
----------------+---------------
              3 |        800.00
              2 |       3200.00
              1 |       1600.00
(3 rows)

