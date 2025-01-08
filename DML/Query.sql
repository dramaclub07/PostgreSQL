                                                            List of databases
   Name    |  Owner   | Encoding | Locale Provider |      Collate       |       Ctype        | Locale | ICU Rules |   Access privileges   
-----------+----------+----------+-----------------+--------------------+--------------------+--------+-----------+-----------------------
 company   | postgres | UTF8     | libc            | English_India.1252 | English_India.1252 |        |           | 
 postgres  | postgres | UTF8     | libc            | English_India.1252 | English_India.1252 |        |           | 
 staff     | postgres | UTF8     | libc            | English_India.1252 | English_India.1252 |        |           | 
 template0 | postgres | UTF8     | libc            | English_India.1252 | English_India.1252 |        |           | =c/postgres          +
           |          |          |                 |                    |                    |        |           | postgres=CTc/postgres
 template1 | postgres | UTF8     | libc            | English_India.1252 | English_India.1252 |        |           | =c/postgres          +
           |          |          |                 |                    |                    |        |           | postgres=CTc/postgres
(5 rows)

           List of relations
 Schema |    Name    | Type  |  Owner   
--------+------------+-------+----------
 public | department | table | postgres
 public | employees  | table | postgres
 public | product    | table | postgres
(3 rows)

                       Table "public.employees"
   Column    |         Type          | Collation | Nullable | Default 
-------------+-----------------------+-----------+----------+---------
 employee_id | integer               |           | not null | 
 first_name  | character varying(50) |           |          | 
 last_name   | character varying(50) |           |          | 
 salary      | numeric(10,2)         |           | not null | 
Indexes:
    "employees_pkey" PRIMARY KEY, btree (employee_id)

 employee_id | first_name | last_name |  salary  
-------------+------------+-----------+----------
           2 | Abhinav    | Lather    | 30000.00
           1 | Priyanshu  | Singh     | 50000.00
           3 | Ayush      | Nagar     | 20000.00
(3 rows)

 employee_id | first_name | last_name |  salary  
-------------+------------+-----------+----------
           2 | Abhinav    | Lather    | 30000.00
           1 | Priyanshu  | Singh     | 50000.00
           3 | Ayush      | Nagar     | 20000.00
(3 rows)

 first_name | last_name 
------------+-----------
 Abhinav    | Lather
 Priyanshu  | Singh
 Ayush      | Nagar
(3 rows)

UPDATE 1
 employee_id | first_name | last_name |  salary  
-------------+------------+-----------+----------
           2 | Abhinav    | Lather    | 30000.00
           3 | Ayush      | Nagar     | 20000.00
           1 | Priyanshu  | Singh     | 50000.00
(3 rows)

DELETE 1
 employee_id | first_name | last_name |  salary  
-------------+------------+-----------+----------
           2 | Abhinav    | Lather    | 30000.00
           1 | Priyanshu  | Singh     | 50000.00
(2 rows)

 employee_id | first_name | last_name |  salary  
-------------+------------+-----------+----------
           2 | Abhinav    | Lather    | 30000.00
           1 | Priyanshu  | Singh     | 50000.00
(2 rows)

           List of relations
 Schema |    Name    | Type  |  Owner   
--------+------------+-------+----------
 public | department | table | postgres
 public | employees  | table | postgres
 public | product    | table | postgres
(3 rows)

                        Table "public.product"
    Column    |         Type          | Collation | Nullable | Default 
--------------+-----------------------+-----------+----------+---------
 product_id   | integer               |           | not null | 
 product_name | character varying(20) |           |          | 
 price        | numeric(10,2)         |           |          | 
Indexes:
    "product_pkey" PRIMARY KEY, btree (product_id)

 product_id |     product_name     |  price  
------------+----------------------+---------
          1 | Protein              | 4750.00
          2 | Creatine Monohydrate | 1200.00
          3 | BCCA                 |  800.00
          4 | Mass Gainer          | 4000.00
          5 | Multi-Vitamins       |  600.00
(5 rows)

UPDATE 1
 product_id |     product_name     |  price  
------------+----------------------+---------
          2 | Creatine Monohydrate | 1200.00
          3 | BCCA                 |  800.00
          4 | Mass Gainer          | 4000.00
          5 | Multi-Vitamins       |  600.00
          1 | Protein              | 7000.00
(5 rows)

 product_id |     product_name     |  price  
------------+----------------------+---------
          2 | Creatine Monohydrate | 1200.00
          3 | BCCA                 |  800.00
          4 | Mass Gainer          | 4000.00
(3 rows)

DELETE 2
 product_id |     product_name     |  price  
------------+----------------------+---------
          2 | Creatine Monohydrate | 1200.00
          4 | Mass Gainer          | 4000.00
          1 | Protein              | 7000.00
(3 rows)

