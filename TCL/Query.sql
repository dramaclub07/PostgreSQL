Q.1) Create a transaction to insert two new employees and update the salary of an existing employee.
-> INSERT INTO employees(employee_id, first_name, last_name, salary) VALUES (101,'Vishal','Kanojia',89990),(102,'Aryan','Negi',87956);

BEGIN
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

INSERT 0 2
 employee_id | first_name | last_name |  salary  
-------------+------------+-----------+----------
           2 | Abhinav    | Lather    | 30000.00
           1 | Priyanshu  | Singh     | 50000.00
         101 | Vishal     | Kanojia   | 89990.00
         102 | Aryan      | Negi      | 87956.00
(4 rows)
update the salary of an existing employee.
UPDATE 1
 employee_id | first_name | last_name |  salary  
-------------+------------+-----------+----------
           2 | Abhinav    | Lather    | 30000.00
         101 | Vishal     | Kanojia   | 89990.00
         102 | Aryan      | Negi      | 87956.00
           1 | Priyanshu  | Singh     | 92000.00
(4 rows)

Q2 commit;
->COMMIT




Q3 begin;
   delete from products where product_id = 1;
   insert into products(product_id,product_name,price)values(3,'Tuxedo',10000);
-> BEGIN
DELETE 1
INSERT 0 1

Q4 rollback;
-> ROLLBACK

Q5  begin;
    update products set price = 1400 where product_id = 1;
    insert into products(product_id,product_name,price)values(10,'Aalu',20);
    commit;
-> BEGIN
UPDATE 1
INSERT 0 1
COMMIT
