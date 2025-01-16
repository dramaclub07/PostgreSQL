Q1: What is the difference between a function and a stored procedure?

--Theory: Stored Procedure:
-- Does not return a value directly (though it can return multiple output parameters).
-- Used for executing a sequence of SQL commands and logic, including side effects like modifying data (e.g., INSERT, UPDATE, DELETE).

--Function:
-- Returns a single value (or a set of values) directly via the RETURN statement.
-- Can be used in SQL queries (e.g., SELECT, WHERE, etc.).


Q2: How do you create a function in PostgreSQL?

Query: CREATE FUNCTION employee_salary(employee_id INT)
RETURNS INT AS $$
BEGIN
    RETURN (SELECT salary FROM employees WHERE employee_id = employee_id);
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION


Q3: How do you return a value from a function?

Query: CREATE FUNCTION get_employee_name(employee_id INT)
RETURNS TEXT AS $$
BEGIN
    RETURN (SELECT name FROM employees WHERE employee_id = employee_id);
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION


Q4: Can a function have side effects?

--Theory: No: Functions are typically designed to avoid side effects.

Query: CREATE FUNCTION update_employee_salary(employee_id INT, new_salary INT)
RETURNS VOID AS $$
BEGIN
    UPDATE employees SET salary = new_salary WHERE employee_id = employee_id;
END;
$$ LANGUAGE plpgsql VOLATILE;

CREATE FUNCTION


Q5: What are some common data types that can be returned by a function?

Query: CREATE FUNCTION get_employee_ids() 
RETURNS INT[] AS $$
BEGIN
    RETURN ARRAY(SELECT employee_id FROM employees);
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION


Q6: How can you use functions to improve code readability and maintainability?
--Theory: Encapsulation: Functions allow you to encapsulate repetitive logic, which makes your SQL code cleaner and easier to understand.
--        Reuse: Once defined, functions can be reused across multiple queries, reducing code duplication.
--        Modularity: Breaking complex logic into smaller, self-contained functions makes the overall system easier to maintain and debug.
--        Separation of Concerns: Functions allow for a clear separation between business logic and query execution.


Q7: How can you use functions to perform complex calculations?

Query: CREATE FUNCTION calculate_total_compensation(employee_id INT)
RETURNS NUMERIC AS $$
DECLARE
    base_salary NUMERIC;
    bonus NUMERIC;
BEGIN
    SELECT salary INTO base_salary FROM employees WHERE employee_id = employee_id;
    bonus := base_salary * 0.1; -- 10% bonus
    RETURN base_salary + bonus;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION


Q8: What are some performance considerations when using functions?

--Theory: Performance Overhead: Functions add a layer of abstraction, and in some cases, they can introduce slight overhead, especially for complex operations or when they are called repeatedly in large datasets.
--        Avoiding Expensive Queries: Functions that involve complex or nested queries should be optimized. Avoid using functions for operations that can be done directly in SQL queries, as functions might result in additional overhead.
--        Side Effects: Functions with side effects (e.g., VOLATILE functions that modify data) can affect performance, especially if used in SELECT queries with large data volumes.


Q9: How can you use functions to implement custom business logic?

query: CREATE FUNCTION check_discount(order_id INT)
RETURNS BOOLEAN AS $$
DECLARE
    total_amount NUMERIC;
BEGIN
    SELECT amount INTO total_amount FROM orders WHERE order_id = order_id;
    IF total_amount > 1000 THEN
        RETURN TRUE;  -- Discount applies
    ELSE
        RETURN FALSE; -- No discount
    END IF;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION


Q10: What are some examples of built-in functions in PostgreSQL?

--Theory: String Functions: CONCAT(), SUBSTRING(), LENGTH(), UPPER(), LOWER(), TRIM()
--        Aggregate Functions: COUNT(), SUM(), AVG(), MIN(), MAX()
--        Date/Time Functions: CURRENT_DATE, CURRENT_TIME