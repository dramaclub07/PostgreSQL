Q1: Ensure that the price column in the products table is always greater than zero.
Query: ALTER TABLE product ADD CONSTRAINT check_price_positive CHECK(price>0);
ALTER TABLE
                        Table "public.product"
    Column    |         Type          | Collation | Nullable | Default 
--------------+-----------------------+-----------+----------+---------
 product_id   | integer               |           |          | 
 product_name | character varying(20) |           |          | 
 price        | numeric               |           |          | 
Check constraints:
    "check_price_positive" CHECK (price > 0::numeric)



Q2: Prevent duplicate entries in the email column of the customers table.
Query: ALTER TABLE customers ADD CONSTRAINT unique_email UNIQUE (email);
ALTER TABLE
                                           Table "public.customers"
   Column    |          Type          | Collation | Nullable |                    Default                     
-------------+------------------------+-----------+----------+------------------------------------------------
 customer_id | integer                |           | not null | nextval('customers_customer_id_seq'::regclass)
 name        | character varying(20)  |           |          | 
 email       | character varying(100) |           |          | 
Indexes:
    "customers_pkey" PRIMARY KEY, btree (customer_id)
    "customers_email_key" UNIQUE CONSTRAINT, btree (email)
    "unique_email" UNIQUE CONSTRAINT, btree (email)
Referenced by:
    TABLE "orders" CONSTRAINT "orders_customer_id_fkey" FOREIGN KEY (customer_id) REFERENCES customers(customer_id)

             |           |          | 



Q3: Make sure that the age column in the employees table is always between 18 and 65.
Query: ALTER TABLE employee ADD CONSTRAINT age_range CHECK (age BETWEEN 18 AND 65);
ALTER TABLE
                       Table "public.employee"
   Column    |         Type          | Collation | Nullable | Default 
-------------+-----------------------+-----------+----------+---------
 employee_id | integer               |           |          | 
 first_name  | character varying(20) |           |          | 
 last_name   | character varying(20) |           |          | 
 salary      | numeric               |           |          | 
 age         | integer               |           |          | 
Check constraints:
    "age_range" CHECK (age >= 18 AND age <= 65)



Q4: Enforce a constraint to prevent deleting a customer if they have any associated orders.
Query: ALTER TABLE orders ADD CONSTRAINT fk_customer_id FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE RESTRICT;
ALTER TABLE
                                     Table "public.orders"
    Column    |     Type      | Collation | Nullable |                 Default                  
--------------+---------------+-----------+----------+------------------------------------------
 order_id     | integer       |           | not null | nextval('orders_order_id_seq'::regclass)
 customer_id  | integer       |           |          | 
 order_date   | date          |           |          | 
 total_amount | numeric(10,2) |           |          | 
Indexes:
    "orders_pkey" PRIMARY KEY, btree (order_id)
Foreign-key constraints:
    "fk_customer_id" FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE RESTRICT
    "orders_customer_id_fkey" FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
