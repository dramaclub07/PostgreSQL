CREATE A STORED PROCEDURE
--example--
create stored procedure procedure_name
(
        @parameter_name = datatype = default value,
        @paramter_name = datatype
)
AS 
Begin
    --sql statements
    --logic
END;


**************************************************************************

Example 1: Simple Stored Procedure
Problem:
Get all employees from the employees table in a specific department.

CREATE PROCEDURE GetEmployeesByDepartment
(
    @dept_id INT
)
AS 
Begin
    SELECT emp_id, emp_name, dept_id
    FROM employees
    WHERE dept_id = @dept_id;
END;


--EXECUTION--
EXEC GetEmployeesByDepartment @dept_id = 102;

**************************************************************************

Example 2: Stored Procedure with Output Parameters
Problem:
Calculate the total salary of employees in a specific department and return it.

CREATE PROCEDURE GetTotalSalary
(
    @dept_id INT
    @total_Salary DECIMAL(10,2)
)
AS
Begin
    SELECT @total_Salary = SUM(emp_salary)
    FROM employees
    WHERE dept_id = @dept_id;
END;

--EXECUTION;
DECLARE @emp_salary DECIMAL(10,2)
EXEC GetTotalSalary @dept_id = 102, @total_Salary = @emp_salary OUTPUT;
PRINT 'Total salary =' + CAST(@emp_salary AS VARCHAR)


**************************************************************************

Example 3: Procedure with Multiple Statements
Problem:
Insert a new employee and return their ID.

CREATE PROCEDURE AddEmployee
(
    @emp_name VARCHAR(50)
    @new_emp_id INT 
    @emp_salary DECIMAL(10,2)
    @dept_id INT;
)
AS
Begin
    INSERT INTO employees(emp_name,emp_salary,dept_id)
    VALUES(@emp_name,@emp_salary,@dept_id)
    SET @new_emp_id = SCOPE_IDENTITY(); 
END;


--EXECUTION

DECLARE @emp_id
EXEC AddEmployee @emp_name = 'NAYA BACHA', @emp_salary = 45000.00, @dept_id = 107, @new_emp_id = @emp_id OUTPUT;
PRINT 'New Employee Added = ' + CAST(@emp_id AS VARCHAR)


*************************************************************************************************************]
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



                                        #best_practice;

                                 Dynamic SQL in Stored Procedures

--Generate SQL queries dynamically based on parameters.

CREATE PROCEDURE GetEmployeeDynamically
(
    @column_name NVARCHAR
    @VALUE NVARCHAR
)
AS
Begin
    DECLARE @query = NVARCHAR(MAX);
    SET @query = 'SELECT * FROM employees WHERE' + @column_name + '= @value'
    EXEC sp_executesql @query, N'@value NVARCHAR(50)', @value;
END;

--2. Transactions
--Ensure atomicity by wrapping logic in a transaction.

CREATE PROCEDURE TransferSalary
(
    @from_emp_id INT,
    @to_emp_id INT,
    @amount DECIMAL(10,2)
)
AS
Begin
    BEGIN Transaction;
    BEGIN TRY 
        UPDATE employees SET emp_salary = emp_salary - @amount WHERE emp_id = @from_emp_id;
        UPDATE employees SET emp_salary = emp_salary + @amount WHERE emp_id = @to_emp_id;
    END TRY
    BEGIN CATCH
        ROLLBACK transaction;
        THROW;
    END CATCH;
END;



************************** Limitations of Stored Procedures ***************************************


--Debugging: Debugging is more challenging compared to application code.
--Complex Logic: Overloading stored procedures with complex logic can make them hard to maintain.
--Portability: Stored procedures are database-specific and may require changes for different DBMS.
