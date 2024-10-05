-- SQL file demonstrating various SQL commands

-- 1. CREATE DATABASE
CREATE DATABASE company;

-- 2. USE DATABASE
USE company;

-- 3. CREATE TABLE
CREATE TABLE employees (
    id INT PRIMARY KEY AUTO_INCREMENT, -- Auto-incrementing ID for each employee
    first_name VARCHAR(50),            -- First name of the employee
    last_name VARCHAR(50),             -- Last name of the employee
    email VARCHAR(100) UNIQUE,         -- Email of the employee, must be unique
    hire_date DATE,                    -- Date the employee was hired
    salary DECIMAL(10, 2),             -- Salary of the employee, up to 10 digits with 2 decimal places
    department_id INT                  -- Department ID (foreign key)
);

-- 4. CREATE TABLE with FOREIGN KEY
CREATE TABLE departments (
    department_id INT PRIMARY KEY, -- Primary key for departments
    department_name VARCHAR(100)   -- Name of the department
);

-- Adding a foreign key to the employees table
ALTER TABLE employees
ADD CONSTRAINT fk_department
FOREIGN KEY (department_id)
REFERENCES departments(department_id);

-- 5. INSERT INTO TABLE
INSERT INTO departments (department_id, department_name)
VALUES (1, 'HR'), (2, 'Finance'), (3, 'IT');

-- Inserting employees with respective departments
INSERT INTO employees (first_name, last_name, email, hire_date, salary, department_id)
VALUES 
('John', 'Doe', 'john.doe@example.com', '2021-05-20', 55000.00, 1),
('Jane', 'Smith', 'jane.smith@example.com', '2022-01-15', 62000.00, 2);

-- 6. SELECT FROM TABLE
SELECT * FROM employees; -- Selects all records from the employees table

-- 7. SELECT with JOIN
SELECT e.first_name, e.last_name, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id; -- Fetches employee names with department names

-- 8. UPDATE TABLE
UPDATE employees
SET salary = 60000.00 -- Updating salary for employees
WHERE id = 1;         -- For employee with id = 1

-- 9. DELETE FROM TABLE
DELETE FROM employees
WHERE id = 2; -- Deletes the employee with id = 2

-- 10. ADD COLUMN
ALTER TABLE employees
ADD phone_number VARCHAR(15); -- Adds a phone number field to employees

-- 11. DROP COLUMN
ALTER TABLE employees
DROP COLUMN phone_number; -- Drops the phone number column from employees

-- 12. CREATE INDEX
CREATE INDEX idx_last_name
ON employees (last_name); -- Creates an index on last_name column

-- 13. DROP INDEX
DROP INDEX idx_last_name ON employees; -- Drops the index on last_name

-- 14. DELETE ALL RECORDS
DELETE FROM employees; -- Deletes all records from employees

-- 15. DROP TABLE
DROP TABLE employees; -- Drops the employees table

-- 16. DROP DATABASE
DROP DATABASE company; -- Drops the company database
