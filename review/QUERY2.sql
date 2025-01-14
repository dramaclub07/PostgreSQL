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
question 1  Retrieve all books by a specific author.

QUERY-SELECT * FROM Books WHERE author = 'TICHKULE';

 book_id | title |  author  | publication_year | genre  
---------+-------+----------+------------------+--------
       5 | DHOL  | TICHKULE |             2020 | COMEDY
(1 row)

QUESTION 2  Find members who have borrowed a particular book.
QUERY -  SELECT members.name FROM members JOIN Borrowings ON members.membe
r_id = borrowings.member_id WHERE borrowing.book_id = 1;

   name    
-----------
 Priyanshu
(1 row)

 title 
-------
(0 rows)
QUESTION 3  Display books that are currently overdue.


SELECT books.title FROM books JOIN borrowings ON Books.book_id = borrowings.book_id WHERE borrowings.due_date > CURRENT_DATE AND borrowings.r
eturned_date IS NULL;

 title  
--------
 HER
 SOLACE
 I.T
 DHOL
(4 rows)


QUESTION 4;Calculate the total number of books borrowed by each member.
QUERY; ERROR



postgres=# SELECT members.name, COUNT(borrowings.borrowing_id) AS total_borrowed FROM members LEFT JOIN borrowings ON members.member_id = borrowing.members.id GROUP BY members.name;
ERROR:  invalid reference to FROM-clause entry for table "members"
LINE 1: ...mbers LEFT JOIN borrowings ON members.member_id = borrowing....
                                                             ^
DETAIL:  There is an entry for table "members", but it cannot be referenced from this part of the query.

tcl(Transaction Control Language):
)
question 5-Demonstrate the use of COMMIT and ROLLBACK in a scenario where a member borrows a book, but the transaction needs to be canceled due to an error.
Query-
 BEGIN;
postgres=*# INSERT INTO Borrowings (borrowing_id, book_id, member_id, borrow_date, due_date, returned_date) VALUES(6,2,3,'2025-01-14','2025-01-28', NULL
);
postgres=*# ROLLBACK;
postgres=# COMMIT;
WARNING:  there is no transaction in progress

BEGIN
INSERT 0 1
ROLLBACK

((((((((((JOINS)))))))))))

Write a query to display the member's name, book title, and borrow date for all borrowing activities. Use an appropriate join to relate the Borrowings, Members, and Books tables.
Additional Considerations:

QUERY - SELECT members.name, books.title, borrowings.borrow_date from borrowings JOIN  members ON borrowings.member_id = members.member_id JOIN Books ON Borrowings.book_id = Books.book_id;

   name    | title  | borrow_date 
-----------+--------+-------------
 Priyanshu | HER    | 2025-01-01
 amandthor | SOLACE | 2025-01-02
 Priyanshu | 7EVEN  | 2025-01-03
 RAJMAN    | I.T    | 2025-01-04
 AJMAN     | DHOL   | 2025-01-05
 RAJMAN    | SOLACE | 2025-01-14
(6 rows)

*******************************************************************************