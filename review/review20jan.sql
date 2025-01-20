              List of relations
 Schema |       Name       | Type  |  Owner   
--------+------------------+-------+----------
 public | courses          | table | postgres
 public | coursestatistics | table | postgres
 public | enrollments      | table | postgres
 public | students         | table | postgres
(4 rows)

 studentid  | firstname | lastname | enrollmentdate |               email               
------------+-----------+----------+----------------+-----------------------------------
 2110992350 | Priyanshu | Singh    | 2021-07-01     | priyanshu2350.be21@chitara.edu.in
 2110991525 | Varun     | Thakur   | 2021-07-01     | varun1525.be21@chitara.edu.in
 2110990046 | Abhinav   | Lather   | 2021-07-01     | abhinav0046.be21@chitara.edu.in
 2110990344 | Ayush     | Nagar    | 2021-07-01     | ayush0344.be21@chitara.edu.in
(4 rows)

 enrollmentid | studentid  | courseid | grade 
--------------+------------+----------+-------
            1 | 2110992350 |      111 |  9.90
            2 | 2110991525 |      121 |  8.80
            3 | 2110990046 |      123 |  7.50
            4 | 2110990344 |      143 |  9.00
(4 rows)

 courseid |  coursename   | credits 
----------+---------------+---------
      111 | RUBY ON RAILS |       4
      121 | RUBY ON FIRE  |       2
      123 | RALIS ON RUBY |       3
      143 | PostgreSQL    |       4
(4 rows)

                                                    List of functions
 Schema |            Name            | Result data type |                   Argument data types                    | Type 
--------+----------------------------+------------------+----------------------------------------------------------+------
 public | enrollstudent              | void             | p_studentid integer, p_courseid integer, p_grade numeric | func
 public | updatestudentcountfunction | trigger          |                                                          | func
(2 rows)

 studentid | firstname | lastname 
-----------+-----------+----------
(0 rows)

                                              List of functions
 Schema |     Name      | Result data type |                   Argument data types                    | Type 
--------+---------------+------------------+----------------------------------------------------------+------
 public | enrollstudent | void             | p_studentid integer, p_courseid integer, p_grade numeric | func
(1 row)

CREATE FUNCTION
              List of relations
 Schema |       Name       | Type  |  Owner   
--------+------------------+-------+----------
 public | courses          | table | postgres
 public | coursestatistics | table | postgres
 public | enrollments      | table | postgres
 public | students         | table | postgres
(4 rows)

CREATE FUNCTION
                  Table "public.enrollments"
    Column    |     Type     | Collation | Nullable | Default 
--------------+--------------+-----------+----------+---------
 enrollmentid | integer      |           | not null | 
 studentid    | integer      |           | not null | 
 courseid     | integer      |           | not null | 
 grade        | numeric(3,2) |           |          | 
Indexes:
    "enrollments_pkey" PRIMARY KEY, btree (enrollmentid)
Foreign-key constraints:
    "enrollments_courseid_fkey" FOREIGN KEY (courseid) REFERENCES courses(courseid)
    "enrollments_studentid_fkey" FOREIGN KEY (studentid) REFERENCES students(studentid)
Triggers:
    updatestudentcount AFTER INSERT OR DELETE ON enrollments FOR EACH ROW EXECUTE FUNCTION updatestudentcountfunction()

CREATE SEQUENCE
ALTER TABLE
CREATE FUNCTION
 enrollmentid | studentid  | courseid | grade 
--------------+------------+----------+-------
            1 | 2110992350 |      111 |  9.90
            2 | 2110991525 |      121 |  8.80
            3 | 2110990046 |      123 |  7.50
            4 | 2110990344 |      143 |  9.00
(4 rows)

UPDATE 4
CREATE FUNCTION
