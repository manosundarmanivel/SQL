CREATE TABLE Employees (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    manager_id INT NULL,
    department VARCHAR(100) NOT NULL,
    salary DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (manager_id) REFERENCES Employees(id)
);

INSERT INTO Employees (id, name, manager_id, department, salary) VALUES
(1, 'Alice Johnson', NULL, 'Management', 120000),
(2, 'Bob Smith', 1, 'Engineering', 90000),
(3, 'Charlie Brown', 1, 'Engineering', 85000),
(4, 'Diana Green', 2, 'Engineering', 75000),
(5, 'Ethan White', 2, 'Engineering', 70000),
(6, 'Fiona Blue', 3, 'HR', 72000),
(7, 'George Black', 3, 'HR', 68000),
(8, 'Helen Red', 4, 'HR', 65000);

WITH DepartmentSalary AS (
    SELECT department, AVG(salary) AS avg_salary
    FROM Employees
    GROUP BY department
)
SELECT e.name, e.department, e.salary, d.avg_salary
FROM Employees e
JOIN DepartmentSalary d ON e.department = d.department;


WITH RECURSIVE EmployeeHierarchy AS (
    SELECT id, name, manager_id, department, salary, 1 AS level
    FROM Employees
    WHERE manager_id IS NULL
    
    UNION ALL
    
    SELECT e.id, e.name, e.manager_id, e.department, e.salary, eh.level + 1
    FROM Employees e
    JOIN EmployeeHierarchy eh ON e.manager_id = eh.id
)
SELECT * FROM EmployeeHierarchy ORDER BY level, manager_id;