                                                             List of databases
    Name    |  Owner   | Encoding | Locale Provider |      Collate       |       Ctype        | Locale | ICU Rules |   Access privileges   
------------+----------+----------+-----------------+--------------------+--------------------+--------+-----------+-----------------------
 aggregate  | postgres | UTF8     | libc            | English_India.1252 | English_India.1252 |        |           | 
 company    | postgres | UTF8     | libc            | English_India.1252 | English_India.1252 |        |           | =Tc/postgres         +
            |          |          |                 |                    |                    |        |           | postgres=CTc/postgres+
            |          |          |                 |                    |                    |        |           | abhinav=c/postgres
 e_commerce | postgres | UTF8     | libc            | English_India.1252 | English_India.1252 |        |           | 
 library    | postgres | UTF8     | libc            | English_India.1252 | English_India.1252 |        |           | 
 postgres   | postgres | UTF8     | libc            | English_India.1252 | English_India.1252 |        |           | 
 staff      | postgres | UTF8     | libc            | English_India.1252 | English_India.1252 |        |           | 
 template0  | postgres | UTF8     | libc            | English_India.1252 | English_India.1252 |        |           | =c/postgres          +
            |          |          |                 |                    |                    |        |           | postgres=CTc/postgres
 template1  | postgres | UTF8     | libc            | English_India.1252 | English_India.1252 |        |           | =c/postgres          +
            |          |          |                 |                    |                    |        |           | postgres=CTc/postgres
 university | postgres | UTF8     | libc            | English_India.1252 | English_India.1252 |        |           | 
(9 rows)

CREATE TABLE
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

INSERT 0 5
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

         List of relations
 Schema | Name  | Type  |  Owner   
--------+-------+-------+----------
 public | sales | table | postgres
(1 row)

 sale_id | product_id | salesperson_id | category_id | sales_amount | revenue 
---------+------------+----------------+-------------+--------------+---------
       1 |        101 |              1 |           1 |       500.00 | 1000.00
       2 |        102 |              1 |           2 |       300.00 |  600.00
       3 |        103 |              2 |           1 |       700.00 | 1400.00
       4 |        104 |              3 |           2 |       400.00 |  800.00
       5 |        105 |              2 |           3 |       900.00 | 1800.00
(5 rows)

CREATE TABLE
           List of relations
 Schema |    Name    | Type  |  Owner   
--------+------------+-------+----------
 public | department | table | postgres
 public | sales      | table | postgres
(2 rows)

                                                             List of databases
    Name    |  Owner   | Encoding | Locale Provider |      Collate       |       Ctype        | Locale | ICU Rules |   Access privileges   
------------+----------+----------+-----------------+--------------------+--------------------+--------+-----------+-----------------------
 aggregate  | postgres | UTF8     | libc            | English_India.1252 | English_India.1252 |        |           | 
 company    | postgres | UTF8     | libc            | English_India.1252 | English_India.1252 |        |           | =Tc/postgres         +
            |          |          |                 |                    |                    |        |           | postgres=CTc/postgres+
            |          |          |                 |                    |                    |        |           | abhinav=c/postgres
 e_commerce | postgres | UTF8     | libc            | English_India.1252 | English_India.1252 |        |           | 
 library    | postgres | UTF8     | libc            | English_India.1252 | English_India.1252 |        |           | 
 postgres   | postgres | UTF8     | libc            | English_India.1252 | English_India.1252 |        |           | 
 staff      | postgres | UTF8     | libc            | English_India.1252 | English_India.1252 |        |           | 
 template0  | postgres | UTF8     | libc            | English_India.1252 | English_India.1252 |        |           | =c/postgres          +
            |          |          |                 |                    |                    |        |           | postgres=CTc/postgres
 template1  | postgres | UTF8     | libc            | English_India.1252 | English_India.1252 |        |           | =c/postgres          +
            |          |          |                 |                    |                    |        |           | postgres=CTc/postgres
 university | postgres | UTF8     | libc            | English_India.1252 | English_India.1252 |        |           | 
(9 rows)

           List of relations
 Schema |    Name    | Type  |  Owner   
--------+------------+-------+----------
 public | department | table | postgres
 public | employees  | table | postgres
 public | product    | table | postgres
(3 rows)

           List of relations
 Schema |    Name    | Type  |  Owner   
--------+------------+-------+----------
 public | department | table | postgres
(1 row)

                        Table "public.department"
     Column      |         Type          | Collation | Nullable | Default 
-----------------+-----------------------+-----------+----------+---------
 department_id   | integer               |           | not null | 
 department_name | character varying(50) |           |          | 
Indexes:
    "department_pkey" PRIMARY KEY, btree (department_id)

 employee_id |     avg_salary     
-------------+--------------------
           2 | 30000.000000000000
           1 | 92000.000000000000
         101 | 89990.000000000000
         102 | 87956.000000000000
(4 rows)

                                                             List of databases
    Name    |  Owner   | Encoding | Locale Provider |      Collate       |       Ctype        | Locale | ICU Rules |   Access privileges   
------------+----------+----------+-----------------+--------------------+--------------------+--------+-----------+-----------------------
 aggregate  | postgres | UTF8     | libc            | English_India.1252 | English_India.1252 |        |           | 
 company    | postgres | UTF8     | libc            | English_India.1252 | English_India.1252 |        |           | =Tc/postgres         +
            |          |          |                 |                    |                    |        |           | postgres=CTc/postgres+
            |          |          |                 |                    |                    |        |           | abhinav=c/postgres
 e_commerce | postgres | UTF8     | libc            | English_India.1252 | English_India.1252 |        |           | 
 library    | postgres | UTF8     | libc            | English_India.1252 | English_India.1252 |        |           | 
 postgres   | postgres | UTF8     | libc            | English_India.1252 | English_India.1252 |        |           | 
 staff      | postgres | UTF8     | libc            | English_India.1252 | English_India.1252 |        |           | 
 template0  | postgres | UTF8     | libc            | English_India.1252 | English_India.1252 |        |           | =c/postgres          +
            |          |          |                 |                    |                    |        |           | postgres=CTc/postgres
 template1  | postgres | UTF8     | libc            | English_India.1252 | English_India.1252 |        |           | =c/postgres          +
            |          |          |                 |                    |                    |        |           | postgres=CTc/postgres
 university | postgres | UTF8     | libc            | English_India.1252 | English_India.1252 |        |           | 
(9 rows)

           List of relations
 Schema |    Name    | Type  |  Owner   
--------+------------+-------+----------
 public | department | table | postgres
 public | employees  | table | postgres
 public | product    | table | postgres
(3 rows)

           List of relations
 Schema |    Name    | Type  |  Owner   
--------+------------+-------+----------
 public | department | table | postgres
 public | employees  | table | postgres
 public | product    | table | postgres
(3 rows)

           List of relations
 Schema |    Name    | Type  |  Owner   
--------+------------+-------+----------
 public | department | table | postgres
 public | sales      | table | postgres
(2 rows)

CREATE TABLE
           List of relations
 Schema |    Name    | Type  |  Owner   
--------+------------+-------+----------
 public | department | table | postgres
 public | employees  | table | postgres
 public | product    | table | postgres
 public | sales      | table | postgres
(4 rows)

