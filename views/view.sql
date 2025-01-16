Q1: Create a view to display employees with a salary greater than 50,000.

create view employee_salaries as
select emp_name, dept_id, salary
from employees
where salary > 50000;

-- View details:
-- View "public.employee_salaries"
-- Columns: emp_name (character varying), dept_id (integer), salary (integer)
-- View definition:
-- SELECT emp_name, dept_id, salary
-- FROM employees
-- WHERE salary > 50000;


Question2: Benefits of using views:
-- Simplifies complex queries by encapsulating them into a reusable object.
-- Enhances data security by restricting direct access to underlying tables.
-- Provides abstraction, shielding users from schema changes.

Q3: Update data through a view:
update employee_salaries
set salary = salary + 5000
where emp_id = 101;
-- Output: UPDATE 0

Q4: Limitations of using views:
-- Views cannot always be updated, especially if they include joins, aggregations, or complex logic.
-- Performance may be slower for views with complex queries as they execute each time they're queried.
-- Changes in underlying tables may require updating dependent views.

Q5: Using views to improve data security:
-- Restrict access to sensitive columns by exposing only necessary data through the view.
-- Use views to enforce row-level security by filtering data based on user roles or conditions.

 Q6: Simplify complex queries using views:
create view high_earning_employees as
select emp_name, salary
from employees
where salary > (select avg(salary) from employees);

 Q7: Drop a view in PostgreSQL:
drop view employee_salaries;
-- Output: DROP VIEW

Q8: Can a view be based on another view?
create view top_earners as
select *
from employee_salaries
where salary > 100000;

-- View details:
-- View "public.top_earners"
-- Columns: emp_name (character varying), dept_id (integer), salary (integer)
-- View definition:
-- SELECT emp_name, dept_id, salary
-- FROM employee_salaries
-- WHERE salary > 100000;

Q9: Common use cases for views:
-- Simplifying reporting by encapsulating complex SQL logic.
-- Providing row or column-level access control for security.
-- Creating a stable interface for applications when the database schema evolves.
-- Aggregating data for dashboards or analytics.

 Q10: Data virtualization with views:
-- Data virtualization allows users to access and manipulate data from multiple sources as if it resides in a single database, without physically moving or copying it.
-- Views in PostgreSQL can be used as a lightweight way to achieve data virtualization by abstracting the complexity of underlying data sources.

create view unified_employee_data as
select e.emp_name, e.emp_id, d.dept_name
from employees e
join departments d on e.dept_id = d.dept_id;

-- View details:
-- View "public.unified_employee_data"
-- Columns: emp_name (character varying), emp_id (integer), dept_name (character varying)
-- View definition:
-- SELECT e.emp_name, e.emp_id, d.dept_name
-- FROM employees e
-- JOIN departments d ON e.dept_id = d.dept_id;
