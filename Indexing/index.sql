Q1->1. Indexing
Problem: A table storing customer orders is experiencing slow query performance, 
particularly when filtering by customer name or order date.


-- Create index on customer_name to speed up filtering by customer name
CREATE INDEX idx_customer_name ON orders(customer_name);

-- Create index on order_date to speed up filtering by order date
CREATE INDEX idx_order_date ON orders(order_date);


CREATE INDEX

                    Table "public.customer"
  Column   |       Type        | Collation | Nullable | Default 
-----------+-------------------+-----------+----------+---------
 cust_id   | integer           |           | not null | 
 cust_name | character varying |           |          | 
Indexes:
    "customer_pkey" PRIMARY KEY, btree (cust_id)
    "idx_cust_name" btree (cust_name)
Referenced by:
    TABLE "orders" CONSTRAINT "orders_cust_id_fkey" FOREIGN KEY (cust_id) REFERENCES customer(cust_id)

CREATE INDEX

                           Table "public.orders"
   Column    |            Type             | Collation | Nullable | Default 
-------------+-----------------------------+-----------+----------+---------
 order_id    | integer                     |           | not null | 
 order_name  | character varying           |           |          | 
 cust_id     | integer                     |           |          | 
 create_date | timestamp without time zone |           |          | 
 insert_date | timestamp without time zone |           |          | 
Indexes:
    "orders_pkey" PRIMARY KEY, btree (order_id)
    "idx_order_date" btree (create_date)
Foreign-key constraints:
    "orders_cust_id_fkey" FOREIGN KEY (cust_id) REFERENCES customer(cust_id)

--QUESTION 2- Problem: A table storing product information with frequent searches on product descriptions
--is causing slow response times.

CREATE TABLE
CREATE INDEX
 product_id | product_name | product_description | price | created_at | updated_at 
------------+--------------+---------------------+-------+------------+------------
(0 rows)

INSERT 0 8
 product_id | product_name  |                                      product_description                                       |  price  |         created_at         | updated_at 
------------+---------------+------------------------------------------------------------------------------------------------+---------+----------------------------+------------
          1 | AK-47         | A widely used assault rifle known for its reliability and durability.                          | 1200.00 | 2025-01-16 15:36:55.257796 | 
          2 | M16 Rifle     | An iconic military rifle known for its accuracy and range.                                     | 1500.00 | 2025-01-16 15:36:55.257796 | 
          3 | Glock 17      | A popular semi-automatic handgun with a 17-round magazine capacity.                            |  600.00 | 2025-01-16 15:36:55.257796 | 
          4 | Desert Eagle  | A powerful handgun known for its large caliber and distinctive design.                         | 1300.00 | 2025-01-16 15:36:55.257796 | 
          5 | Remington 870 | A pump-action shotgun commonly used for hunting and tactical purposes.                         |  700.00 | 2025-01-16 15:36:55.257796 | 
          6 | Barrett M82   | A heavy-duty sniper rifle capable of long-range shooting, often used in military applications. | 3500.00 | 2025-01-16 15:36:55.257796 | 
          7 | FN SCAR       | A modular assault rifle designed for military use, known for its versatility.                  | 2200.00 | 2025-01-16 15:36:55.257796 | 
          8 | Beretta 92    | A semi-automatic pistol widely used by law enforcement and military personnel.                 |  800.00 | 2025-01-16 15:36:55.257796 | 
(8 rows)


