                                                            List of databases
   Name    |  Owner   | Encoding | Locale Provider |      Collate       |       Ctype        | Locale | ICU Rules |   Access privileges   
-----------+----------+----------+-----------------+--------------------+--------------------+--------+-----------+-----------------------
 company   | postgres | UTF8     | libc            | English_India.1252 | English_India.1252 |        |           | 
 postgres  | postgres | UTF8     | libc            | English_India.1252 | English_India.1252 |        |           | 
 staff     | postgres | UTF8     | libc            | English_India.1252 | English_India.1252 |        |           | 
 template0 | postgres | UTF8     | libc            | English_India.1252 | English_India.1252 |        |           | =c/postgres          +
           |          |          |                 |                    |                    |        |           | postgres=CTc/postgres
 template1 | postgres | UTF8     | libc            | English_India.1252 | English_India.1252 |        |           | =c/postgres          +
           |          |          |                 |                    |                    |        |           | postgres=CTc/postgres
(5 rows)

           List of relations
 Schema |    Name    | Type  |  Owner   
--------+------------+-------+----------
 public | department | table | postgres
 public | employees  | table | postgres
 public | product    | table | postgres
(3 rows)

Q.1) grant select on employees to postgres;
GRANT
CREATE ROLE
CREATE ROLE
CREATE ROLE

Q.2)GRANT INSERT ON employees to Priyanshu, Abhinav, Aryan;
GRANT


Q.3) REVOKE UPDATE ON employees from Priyanshu;
REVOKE


Q.4) GRANT all privileges on product to Priyanshu;
GRANT


Q.5) REVOKE delete on product from public;
REVOKE


Q.6)GRANT SELECT, INSERT ON department to Priyanshu;
GRANT


Q.7) REVOKE all privileges on department from Priyanshu;
REVOKE


Q.8)CREATE SCHEMA SALES;
GRANT USAGE ON schema sales to Priyanshu;
GRANT


Q.9)REVOKE usage ON schema sales FROM Priyanshu, Abhinav, Aryan;
REVOKE


Q.10) grant connect on database company to Abhinav;
GRANT