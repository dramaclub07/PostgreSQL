Q1  insert into staff(employee_id,first_name,last_name,salary)values(10,'Anas','preet',500);
    insert into staff(employee_id,first_name,last_name,salary)values(20,'luna','',50);
    update staff set salary = 6500 where employee_id = 20;
-> BEGIN
INSERT 0 1
INSERT 0 1
UPDATE 1

Q2 commit;
-> COMMIT

Q3 begin;
   delete from products where product_id = 1;
   insert into products(product_id,product_name,price)values(3,'Tuxedo',10000);
-> BEGIN
DELETE 1
INSERT 0 1

Q4 rollback;
-> ROLLBACK

Q5  begin;
    update products set price = 1400 where product_id = 1;
    insert into products(product_id,product_name,price)values(10,'Aalu',20);
    commit;
-> BEGIN
UPDATE 1
INSERT 0 1
COMMIT