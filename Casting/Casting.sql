 Problem: A table stores birthdates as strings in the format 'YYYY-MM-DD'.
 You need to calculate the age of customers.
Solution: Cast the birthdate column to a date type and then use date functions to calculate the age.
 
 
 
 
 cust_id |  cust_name  | birthdate  |           age            
---------+-------------+------------+--------------------------
       1 | priyanshu   | 1990-05-15 | 34 years 8 mons 2 days
       2 | Aman        | 1995-05-15 | 29 years 8 mons 2 days
       3 | Aryan       | 1999-05-15 | 25 years 8 mons 2 days
       4 | Raghu       | 2009-05-15 | 15 years 8 mons 2 days
       5 | Honey       | 2005-05-15 | 19 years 8 mons 2 days
       6 | Ayush Nagar | 2005-03-10 | 19 years 10 mons 7 days
       7 | Abhinav     | 2004-01-19 | 20 years 11 mons 29 days
(7 rows)

 cust_id |  cust_name  | birthdate  | age_years 
---------+-------------+------------+-----------
       1 | priyanshu   | 1990-05-15 |        34
       2 | Aman        | 1995-05-15 |        29
       3 | Aryan       | 1999-05-15 |        25
       4 | Raghu       | 2009-05-15 |        15
       5 | Honey       | 2005-05-15 |        19
       6 | Ayush Nagar | 2005-03-10 |        19
       7 | Abhinav     | 2004-01-19 |        20
(7 rows)

Problem: A column stores a boolean value as 'Y' or 'N'. You need to perform logical operations on this column.
Solution: Cast the 'Y' and 'N' values to boolean (TRUE/FALSE) using CASE expressions or custom functions.

 RETURNS TRIGGER AS $$
valorantsubquery$# BEGIN
valorantsubquery$#     -- Logic: Set is_active to TRUE if birthdate is after 2000, else FALSE
valorantsubquery$#     IF NEW.birthdate > '2000-01-01' THEN
valorantsubquery$#         NEW.is_active = TRUE;
valorantsubquery$#     ELSE
valorantsubquery$#         NEW.is_active = FALSE;
valorantsubquery$#     END IF;
valorantsubquery$#
valorantsubquery$#     RETURN NEW;
valorantsubquery$# END;
valorantsubquery$# $$ LANGUAGE plpgsql;