Q.1) Create a transaction to insert two new employees and update the salary of an existing employee.
#INSERT INTO employees(employee_id, first_name, last_name, salary) VALUES (101,'Vishal','Kanojia',89990),(102,'Aryan','Negi',87956);

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

COMMIT


