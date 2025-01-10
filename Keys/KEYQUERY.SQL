Q1  create database Ecommerce;
CREATE DATABASE
                                                            List of databases
   Name    |  Owner   | Encoding | Locale Provider |      Collate       |       Ctype        | Locale | ICU Rules |   Access privileges   
-----------+----------+----------+-----------------+--------------------+--------------------+--------+-----------+-----------------------
 company   | postgres | UTF8     | libc            | English_India.1252 | English_India.1252 |        |           | =Tc/postgres         +
           |          |          |                 |                    |                    |        |           | postgres=CTc/postgres+
           |          |          |                 |                    |                    |        |           | aryan=c/postgres
 ecommerce | postgres | UTF8     | libc            | English_India.1252 | English_India.1252 |        |           | 
 postgres  | postgres | UTF8     | libc            | English_India.1252 | English_India.1252 |        |           | 
 template0 | postgres | UTF8     | libc            | English_India.1252 | English_India.1252 |        |           | =c/postgres          +
           |          |          |                 |                    |                    |        |           | postgres=CTc/postgres
 template1 | postgres | UTF8     | libc            | English_India.1252 | English_India.1252 |        |           | =c/postgres          +
           |          |          |                 |                    |                    |        |           | postgres=CTc/postgres
(5 rows)

create table customers(cust_id serial primary key, cust_name varchar);
CREATE TABLE
create table orders(order_id int primary key, order_name varchar, foreign key(cust_id) references customers(cust_id));
CREATE TABLE


                                     Table "public.customers"
  Column   |       Type        | Collation | Nullable |                  Default                   
-----------+-------------------+-----------+----------+--------------------------------------------
 cust_id   | integer           |           | not null | nextval('customers_cust_id_seq'::regclass)
 cust_name | character varying |           |          | 
Indexes:
    "customers_pkey" PRIMARY KEY, btree (cust_id)
Referenced by:
    TABLE "orders" CONSTRAINT "orders_cust_id_fkey" FOREIGN KEY (cust_id) REFERENCES customers(cust_id)



                      Table "public.orders"
   Column   |       Type        | Collation | Nullable | Default 
------------+-------------------+-----------+----------+---------
 order_id   | integer           |           | not null | 
 order_name | character varying |           |          | 
 cust_id    | integer           |           |          | 
Indexes:
    "orders_pkey" PRIMARY KEY, btree (order_id)
Foreign-key constraints:
    "orders_cust_id_fkey" FOREIGN KEY (cust_id) REFERENCES customers(cust_id)

Q2 create database library;
CREATE DATABASE

create table books(book_id serial primary key, book_name varchar);
CREATE TABLE
create table borrowers(id serial primary key, name varchar, book_id int, foreign key(book_id) references books(book_id));
CREATE TABLE

                                     Table "public.books"
  Column   |       Type        | Collation | Nullable |                Default                 
-----------+-------------------+-----------+----------+----------------------------------------
 book_id   | integer           |           | not null | nextval('books_book_id_seq'::regclass)
 book_name | character varying |           |          | 
Indexes:
    "books_pkey" PRIMARY KEY, btree (book_id)
Referenced by:
    TABLE "borrowers" CONSTRAINT "borrowers_book_id_fkey" FOREIGN KEY (book_id) REFERENCES books(book_id)


                                  Table "public.borrowers"
 Column  |       Type        | Collation | Nullable |                Default                
---------+-------------------+-----------+----------+---------------------------------------
 id      | integer           |           | not null | nextval('borrowers_id_seq'::regclass)
 name    | character varying |           |          | 
 book_id | integer           |           |          | 
Indexes:
    "borrowers_pkey" PRIMARY KEY, btree (id)
Foreign-key constraints:
    "borrowers_book_id_fkey" FOREIGN KEY (book_id) REFERENCES books(book_id)

Q3 create database university;
CREATE DATABASE

create table students(stu_id serial primary key, name varchar);
CREATE TABLE
create table courses(course_id serial primary key, course_name varchar,stu_id int, foreign key(stu_id) references students(stu_id));
CREATE TABLE

                                   Table "public.students"
 Column |       Type        | Collation | Nullable |                 Default                  
--------+-------------------+-----------+----------+------------------------------------------
 stu_id | integer           |           | not null | nextval('students_stu_id_seq'::regclass)
 name   | character varying |           |          | 
Indexes:
    "students_pkey" PRIMARY KEY, btree (stu_id)
Referenced by:
    TABLE "courses" CONSTRAINT "courses_stu_id_fkey" FOREIGN KEY (stu_id) REFERENCES students(stu_id)


                                       Table "public.courses"
   Column    |       Type        | Collation | Nullable |                  Default                   
-------------+-------------------+-----------+----------+--------------------------------------------
 course_id   | integer           |           | not null | nextval('courses_course_id_seq'::regclass)
 course_name | character varying |           |          | 
 stu_id      | integer           |           |          | 
Indexes:
    "courses_pkey" PRIMARY KEY, btree (course_id)
Foreign-key constraints:
    "courses_stu_id_fkey" FOREIGN KEY (stu_id) REFERENCES students(stu_id)
