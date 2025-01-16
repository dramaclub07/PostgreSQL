--QUESTION 1 -> How do you create a stored procedure in PostgreSQL?

CREATE PROCEDURE procedure_name --name here
(
    @paramter_name DATATYPE;
)
AS
BEGIN
    --SQL QUERY
    --LOGIC
END;

*DEFINE THE PROCEDURE
*SPECIFY Parameters
*SPECIFY LANGUAGE
*WRITE QUERY AND LOGIC
*EXECUTION


--Question 2 -> How do you pass parameters to a stored procedure?

parameters can be passed to a stored procedure by specifying them in the procedures definition
and then providing values when calling the procedure. Parameters can be IN, OUT, or INOUT, 
which define their behavior in the procedure.

--IN (Default):
Used to pass values into the procedure. These parameters are read-only and cannot be modified inside the procedure.
--OUT: 
Used to return values from the procedure. These parameters are set inside the procedure.
--INOUT: 
Combines both IN and OUT. The parameter accepts a value when the procedure is called, and it can be modified to return a new value.

CREATE PROCEDURE procedure_name (
    param_name param_type [IN | OUT | INOUT] [, ...]
)


--Question 3 -> How do you return a result set from a stored procedure?

stored procedure can return a result set by using the RETURN QUERY or RETURN QUERY EXECUTE statement within the procedures body.
Stored procedures return results using OUT parameters or by leveraging cursors.

Methods to Return a Result Set from a Stored Procedure
                                 When to Use Each Method
            Use Case	                                       Preferred Method

        Direct query results                    ->             	RETURN QUERY
        Navigating large datasets	            ->              Cursors
        Complex intermediate calculations	    ->              Temporary Tables
        Returning multiple result sets	        ->              Multiple RETURN QUERY calls


--i).                             Using OUT Parameters with RETURN QUERY

CREATE PROCEDURE GetEmployeesByDept(dept_id INT)
LANGUAGE plpgsql
AS 
BEGIN
    RETURN QUERY --returns here
    SELECT emp_id, emp_name, emp_salary
    FROM employees
    WHERE department_id = dept_id;
END;



--                                     ii).Using a CURSOR
Cursors are used when the result set needs to be navigated one row at a time or streamed back to the client.

CREATE PROCEDURE GetAllEmployees()
LANGUAGE plpgsql
AS 
DECLARE
    emp_cursor REFCURSOR;
BEGIN
    -- Open a cursor
    OPEN emp_cursor FOR
    SELECT emp_id, emp_name, emp_salary
    FROM employees;

    -- Return the cursor
    RETURN emp_cursor;
END;


--                                     iii) USING TEMPERORY TABLE
                (You can populate a temporary table within the procedure and query it afterward.)

CREATE PROCEDURE GenerateEmployeeReport(dept_id INT)
LANGUAGE plpgsql
AS 
BEGIN
    CREATE TEMP TABLE temp_employees AS -- temperory table
    SELECT emp_id, emp_name, emp_salary
    FROM employees
    WHERE department_id = dept_id;

    RETURN QUERY
    SELECT * FROM temp_employees;
END;


--                                      iv) Returning Multiple Result Sets

                            (To return multiple result sets, you can use multiple RETURN QUERY statements.)

CREATE PROCEDURE GetEmployeesAndDepartments()
LANGUAGE plpgsql
AS 
BEGIN
    -- Return employees
    RETURN QUERY
    SELECT emp_id, emp_name, emp_salary FROM employees;

    -- Return departments
    RETURN QUERY
    SELECT dept_id, dept_name FROM departments;
END;


--  QUESTION 4 ->  What are the benefits of using stored procedures?

#BENIFITS OF PROCEDURE
1) IMPROVED Performance
    ->Precomplied and optimsed SQL
    -> Reduces network traffic
2) MAINTAINABILTY ;
    -> centralised logics
    ->easy updates and debugging
3) Enhanced security
    ->Avoid Direct Acces To tables
    ->prevent (SQL Injection) when parameterized;
4)Scalability
    ->can handle complex problem efficiently;

--  QUESTION 5 ->What are the drawbacks of using stored procedures?

Limitations_
--Debugging: Debugging is more challenging compared to application code.
--Complex Logic: Overloading stored procedures with complex logic can make them hard to maintain.
--Portability: Stored procedures are database-specific and may require changes for different DBMS.


--Question 6 -> How do you debug a stored procedure?

1. Enable Debugging Features in the DBMS
   PostgreSQL: Use PL/pgSQL Debugger or logs for debugging
2. Add Logging and Print Statements
    Use statements like RAISE NOTICE, PRINT, or DBMS_OUTPUT.PUT_LINE 
    to display variable values or status messages during execution.

    CREATE OR REPLACE FUNCTION debug_example(p_value INT) RETURNS VOID AS $$
        BEGIN
        RAISE NOTICE 'Value passed: %', p_value;
    END;

3. Use Exception Handling
    Wrap the procedure in BEGIN ... EXCEPTION blocks to catch and log errors.
4  Use Temporary Tables for Debugging
    INSERT INTO debug_log_table(debug_message, debug_time)
    VALUES ('Step 1 completed', NOW());


--Key Debugging Tips
Use Descriptive Messages: Include context in debug messages to quickly identify issues.
Modularize Code: Break large procedures into smaller functions or procedures for easier debugging.
Test Iteratively: Debug one section at a time, ensuring correctness before moving on.
Use Version Control: Maintain a history of changes for easier rollback.


-- Question 7- How do we grant permission to stored procedure;
permissions for stored procedures (or functions) can be managed using the GRANT command.
Permissions are granted at two levels:

EXECUTE Permission: Allows users to execute the stored procedure.
Schema Access: The user must have sufficient privileges on the schema where the stored procedure resides.


GRANT EXECUTE ON FUNCTION procedure_name(parameter_types) TO user_or_role;


Example: Granting Permissions
1. Procedure Without Parameters

GRANT EXECUTE ON FUNCTION calculate_bonus() TO hr_manager;

2. Procedure With Parameters

GRANT EXECUTE ON FUNCTION update_employee_salary(emp_id INTEGER, new_salary NUMERIC) TO payroll_team;

3. Granting Permissions to Multiple Roles

GRANT EXECUTE ON FUNCTION get_employee_details(emp_id INTEGER) TO hr_team, finance_team;


Revoking Permissions
To revoke permissions, use the REVOKE command:

REVOKE EXECUTE ON FUNCTION procedure_name(parameter_types) FROM user_or_role;

Example:
REVOKE EXECUTE ON FUNCTION calculate_bonus() FROM hr_manager;



--Question 8 -> How can you use stored procedures to improve application performance?
1. Reduced Network Traffic
Stored procedures execute directly on the database server, minimizing the need to send multiple queries
back and forth between the application and the database.

Example: Instead of issuing multiple queries:

SELECT emp_id FROM employees WHERE department = 'Sales';
UPDATE employees SET bonus = 1000 WHERE department = 'Sales';


USE THIS

CREATE PROCEDURE update_bonus(dept_name VARCHAR, bonus_amount NUMERIC)
AS
BEGIN
    UPDATE employees
    SET bonus = bonus_amount
    WHERE department = dept_name;
END;

--Question 9-> What are some common use cases for stored procedures?
1. Data Validation

Stored procedures can ensure data integrity by applying business rules or constraints before inserting
or updating data in the database.

2. Batch Processing

Stored procedures are ideal for performing bulk operations like data migration, cleanup, or transformation.

3. Complex Business Logic

Encapsulate business rules that require multiple steps or conditional logic to execute.

Example: Calculate and update employee bonuses based on performance ratings.


CREATE PROCEDURE calculate_bonus(emp_id INT, performance_rating NUMERIC)
LANGUAGE PLPGSQL
AS 
DECLARE
    bonus NUMERIC;
BEGIN
    IF performance_rating >= 4.5 THEN
        bonus := 2000;
    ELSIF performance_rating >= 3.5 THEN
        bonus := 1000;
    ELSE
        bonus := 500;
    END IF;
    UPDATE employees SET bonus = bonus WHERE id = emp_id;
END;

5. Security and Permission Control
Use stored procedures to enforce data access rules, ensuring that users access or modify data only through controlled procedures.

Example: Allow users to view their own data but not access the raw employees table.

CREATE PROCEDURE view_my_data(user_id INT)
LANGUAGE SQL
AS 
BEGIN
    SELECT * FROM employees WHERE user_id = user_id;
END;

--Question 10-> How do you handle errors within a stored procedure?

error handling within stored procedures (or functions) is done using the EXCEPTION block. 
This allows you to capture and handle errors that occur during the execution of the function.

In PostgreSQL (PSQL), error handling within stored procedures (or functions) is done using the EXCEPTION block.
This allows you to capture and handle errors that occur during the execution of the function. 
Here is how you can implement error handling within a stored procedure in PostgreSQL:

Error Handling in PostgreSQL Stored Procedures
Basic Structure: You use the BEGIN...EXCEPTION...END block to handle errors in PostgreSQL. The EXCEPTION block catches runtime errors and allows you to define actions based on the error type.

Syntax: Here is  the basic syntax for error handling in PostgreSQL:


CREATE OR REPLACE FUNCTION function_name() 
RETURNS void 
AS
BEGIN
    -- Your main procedure logic here

EXCEPTION
    WHEN exception_condition THEN
        -- Handle the error (e.g., logging or raising a custom message)
        RAISE NOTICE 'An error occurred: %', SQLERRM;
    WHEN OTHERS THEN
        -- Catch-all for other exceptions
        RAISE NOTICE 'Unexpected error: %', SQLERRM;
END;

                                        Detailed Example:
                    Example: Handling Errors in a Salary Update Function

CREATE OR REPLACE FUNCTION update_employee_salary(employee_id INT, new_salary NUMERIC) 
RETURNS VOID AS $$
BEGIN
    -- Try to update the salary
    UPDATE employees
    SET salary = new_salary
    WHERE id = employee_id;

    -- Raise an exception if the salary is invalid
    IF new_salary < 0 THEN
        RAISE EXCEPTION 'Salary cannot be negative';
    END IF;
    
EXCEPTION
    WHEN foreign_key_violation THEN
        -- Handle foreign key violation error
        RAISE NOTICE 'Foreign key violation occurred: %', SQLERRM;
    WHEN CHECK_VIOLATION THEN
        -- Handle check constraint violation (e.g., salary < 0)
        RAISE NOTICE 'Salary cannot be negative for employee: %', employee_id;
    WHEN OTHERS THEN
        -- Catch-all for other errors
        RAISE NOTICE 'An unexpected error occurred: %', SQLERRM;
END;
$$ LANGUAGE plpgsql;
Explanation:
BEGIN Block:

This contains the main logic of your stored procedure. In the example, it attempts to update the salary for an employee.
EXCEPTION Block:

Catches errors that occur during the execution of the statements in the BEGIN block.
WHEN foreign_key_violation handles foreign key constraint violations.
WHEN CHECK_VIOLATION catches errors like violating a check constraint (e.g., a salary less than 0).
WHEN OTHERS is a generic error handler that catches any other unexpected errors.
RAISE EXCEPTION:

Allows you to throw a custom exception. You can pass a string message to be shown when the exception occurs.
RAISE NOTICE:

Used to log informational messages or errors that aren't critical, which can help with debugging or tracking down issues. This doesn’t stop the execution of the function, unlike RAISE EXCEPTION.
SQLERRM:

A system variable that returns the error message associated with the current exception.
Handling Specific Exceptions:
foreign_key_violation: Handles violations of foreign key constraints.
unique_violation: Handles unique constraint violations.
CHECK_VIOLATION: Handles errors related to check constraints (like salary < 0).
others: A catch-all for any other types of errors.