
Problem: A table stores customer addresses. You need to create a trigger that updates the state_name column based on the state_code whenever the state_code is updated. The state_code to state_name mapping is stored in a separate lookup table.
Solution: Combine a trigger with a JOIN operation to retrieve the corresponding state_name from the lookup table and update the state_name column in the customer addresses table.

Query:  CREATE TABLE state_lookup (
          state_code VARCHAR(10) PRIMARY KEY,
          state_name VARCHAR(100) NOT NULL
        );

Output-> 

CREATE TABLE
                   Table "public.state_lookup"
   Column   |          Type          | Collation | Nullable | Default 
------------+------------------------+-----------+----------+---------
 state_code | character varying(10)  |           | not null | 
 state_name | character varying(100) |           | not null | 
Indexes:
    "state_lookup_pkey" PRIMARY KEY, btree (state_code)

INSERT INTO state_lookup (state_code, state_name) VALUES
    ('CA', 'California'),
    ('TX', 'Texas'),
    ('NY', 'New York'),
    ('FL', 'Florida'),
    ('IL', 'Illinois');

INSERT 0 5
  

 state_code | state_name 
------------+------------
 CA         | California
 TX         | Texas
 NY         | New York
 FL         | Florida
 IL         | Illinois
(5 rows)

CREATE TABLE customer_addresses (
    id SERIAL PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    state_code VARCHAR(10),
    state_name VARCHAR(100)
);


CREATE TABLE
                                       Table "public.customer_addresses"
    Column     |          Type          | Collation | Nullable |                    Default                     
---------------+------------------------+-----------+----------+------------------------------------------------
 id            | integer                |           | not null | nextval('customer_addresses_id_seq'::regclass)
 customer_name | character varying(100) |           | not null | 
 state_code    | character varying(10)  |           |          | 
 state_name    | character varying(100) |           |          | 
Indexes:
    "customer_addresses_pkey" PRIMARY KEY, btree (id)

CREATE FUNCTION

CREATE OR REPLACE FUNCTION update_state_name()
RETURNS TRIGGER AS $$
BEGIN
    NEW.state_name = (SELECT state_name
                      FROM state_lookup
                      WHERE state_code = NEW.state_code);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_state_name_trigger
BEFORE UPDATE OF state_code ON customer_addresses
FOR EACH ROW
EXECUTE FUNCTION update_state_name();

CREATE TRIGGER

INSERT INTO customer_addresses (customer_name, state_code, state_name) VALUES
    ('John Doe', 'CA', 'California'),
    ('Jane Smith', 'TX', 'Texas');

INSERT 0 2


 id | customer_name | state_code | state_name 
----+---------------+------------+------------
  1 | John Doe      | CA         | California
  2 | Jane Smith    | TX         | Texas
(2 rows)


UPDATE customer_addresses
SET state_code = 'NY'
WHERE customer_name = 'Jane Smith';

UPDATE 1
