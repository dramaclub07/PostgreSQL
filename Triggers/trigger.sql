Question 1: Triggers
Problem: Ensure that the updated_at timestamp column is automatically updated whenever 
a row in the products table is modified.


CREATE FUNCTION
CREATE TRIGGER
UPDATE 1
                                                 Table "public.products"
       Column        |            Type             | Collation | Nullable |                   Default                    
---------------------+-----------------------------+-----------+----------+----------------------------------------------
 product_id          | integer                     |           | not null | nextval('products_product_id_seq'::regclass)
 product_name        | character varying(255)      |           |          | 
 product_description | text                        |           |          | 
 price               | numeric(10,2)               |           |          | 
 created_at          | timestamp without time zone |           |          | now()
 updated_at          | timestamp without time zone |           |          | 
Indexes:
    "products_pkey" PRIMARY KEY, btree (product_id)
    "idx_product_description" gin (to_tsvector('english'::regconfig, product_description))
Triggers:
    trigger_update_timestamp BEFORE UPDATE ON products FOR EACH ROW EXECUTE FUNCTION update_timestamp()



QUESTION 2-> Problem: Prevent users from deleting orders with associated shipments.

-- Step 1: Create the trigger function
CREATE OR REPLACE FUNCTION prevent_order_deletion_with_shipments()
RETURNS TRIGGER AS $$
BEGIN
  IF EXISTS (SELECT 1 FROM shipments WHERE order_id = OLD.order_id) THEN
    RAISE EXCEPTION 'Cannot delete order with associated shipments';
  END IF;
  RETURN OLD;
END;
$$ LANGUAGE plpgsql;

-- Step 2: Create the trigger for BEFORE DELETE
CREATE TRIGGER trigger_prevent_order_deletion
BEFORE DELETE ON orders
FOR EACH ROW
EXECUTE FUNCTION prevent_order_deletion_with_shipments();


CREATE TABLE
CREATE FUNCTION
CREATE TRIGGER
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
Referenced by:
    TABLE "shipments" CONSTRAINT "shipments_order_id_fkey" FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE
Triggers:
    trigger_prevent_order_deletion BEFORE DELETE ON orders FOR EACH ROW EXECUTE FUNCTION prevent_order_deletion_with_shipments()

                                    Table "public.shipments"
    Column     |  Type   | Collation | Nullable |                    Default                     
---------------+---------+-----------+----------+------------------------------------------------
 shipment_id   | integer |           | not null | nextval('shipments_shipment_id_seq'::regclass)
 order_id      | integer |           |          | 
 shipment_date | date    |           |          | 
Indexes:
    "shipments_pkey" PRIMARY KEY, btree (shipment_id)
Foreign-key constraints:
    "shipments_order_id_fkey" FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE

