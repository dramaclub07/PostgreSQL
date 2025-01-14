           List of relations
 Schema |    Name    | Type  |  Owner   
--------+------------+-------+----------
 public | books      | table | postgres
 public | department | table | postgres
 public | members    | table | postgres
 public | sales      | table | postgres
(4 rows)

           List of relations
 Schema |    Name    | Type  |  Owner   
--------+------------+-------+----------
 public | books      | table | postgres
 public | department | table | postgres
 public | members    | table | postgres
 public | sales      | table | postgres
(4 rows)

CREATE TABLE
                           Table "public.books"
      Column      |         Type          | Collation | Nullable | Default 
------------------+-----------------------+-----------+----------+---------
 book_id          | integer               |           | not null | 
 title            | character varying(50) |           |          | 
 author           | character varying(50) |           |          | 
 publication_year | integer               |           |          | 
 genre            | character varying(50) |           |          | 
Indexes:
    "books_pkey" PRIMARY KEY, btree (book_id)
Referenced by:
    TABLE "borrowings" CONSTRAINT "borrowings_book_id_fkey" FOREIGN KEY (book_id) REFERENCES books(book_id)

INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
                          Table "public.members"
     Column     |          Type          | Collation | Nullable | Default 
----------------+------------------------+-----------+----------+---------
 member_id      | integer                |           | not null | 
 name           | character varying(255) |           | not null | 
 address        | character varying(255) |           |          | 
 contact_number | character varying(15)  |           |          | 
Indexes:
    "members_pkey" PRIMARY KEY, btree (member_id)
Referenced by:
    TABLE "borrowings" CONSTRAINT "borrowings_member_id_fkey" FOREIGN KEY (member_id) REFERENCES members(member_id)

INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
           List of relations
 Schema |    Name    | Type  |  Owner   
--------+------------+-------+----------
 public | books      | table | postgres
 public | borrowings | table | postgres
 public | department | table | postgres
 public | members    | table | postgres
 public | sales      | table | postgres
(5 rows)

                          Table "public.members"
     Column     |          Type          | Collation | Nullable | Default 
----------------+------------------------+-----------+----------+---------
 member_id      | integer                |           | not null | 
 name           | character varying(255) |           | not null | 
 address        | character varying(255) |           |          | 
 contact_number | character varying(15)  |           |          | 
Indexes:
    "members_pkey" PRIMARY KEY, btree (member_id)
Referenced by:
    TABLE "borrowings" CONSTRAINT "borrowings_member_id_fkey" FOREIGN KEY (member_id) REFERENCES members(member_id)

 member_id |   name    |  address  | contact_number 
-----------+-----------+-----------+----------------
         1 | Priyanshu | Mohali    | 7900477776
         2 | amandthor | Haryana   | 7900477778
         3 | RAJMAN    | Punjab    | 7900477779
         4 | AJMAN     | LAHOR     | 7900477770
         5 | POJMAN    | BANGALORE | 7900477775
(5 rows)

 book_id | title  |   author   | publication_year |  genre   
---------+--------+------------+------------------+----------
       1 | HER    | A.R REHMAN |             2025 | ROMCOM
       2 | SOLACE | P.R REHMAN |             2024 | ANIME
       3 | 7EVEN  | P.S REHMAN |             2025 | THRILLER
       4 | I.T    | HELEN      |             1920 | HAUNTED
       5 | DHOL   | TICHKULE   |             2020 | COMEDY
(5 rows)

INSERT 0 5
 book_id | title |  author  | publication_year | genre  
---------+-------+----------+------------------+--------
       5 | DHOL  | TICHKULE |             2020 | COMEDY
(1 row)

   name    
-----------
 Priyanshu
(1 row)

 title 
-------
(0 rows)

 title  
--------
 HER
 SOLACE
 I.T
 DHOL
(4 rows)

BEGIN
INSERT 0 1
ROLLBACK
COMMIT
INSERT 0 1
COMMIT
BEGIN
ROLLBACK
ROLLBACK
