CREATE TABLE Employees (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    position VARCHAR(50) NOT NULL,
    salary DECIMAL(10,2) NOT NULL,
    department_id INT NOT NULL,
    hire_date DATE NOT NULL
);

INSERT INTO Employees (name, position, salary, department_id, hire_date) VALUES
('Alice Johnson', 'Software Engineer', 80000, 1, '2022-06-15'),
('Bob Smith', 'Project Manager', 95000, 1, '2021-03-22'),
('Charlie Brown', 'Data Analyst', 72000, 2, '2023-01-10'),
('Diana Green', 'HR Specialist', 60000, 3, '2020-07-30'),
('Ethan White', 'DevOps Engineer', 87000, 1, '2019-11-05'),
('Fiona Blue', 'Marketing Manager', 75000, 3, '2023-05-18'),
('George Black', 'Business Analyst', 68000, 2, '2022-08-25'),
('Helen Red', 'HR Manager', 73000, 3, '2021-12-10');


SELECT name, position, salary 
FROM Employees
WHERE salary > (SELECT AVG(salary) FROM Employees);


SELECT name, position, salary, department_id
FROM Employees e1
WHERE salary > (
    SELECT AVG(salary) 
    FROM Employees e2 
    WHERE e1.department_id = e2.department_id
);



SELECT name, position, salary, 
       (SELECT AVG(salary) FROM Employees) AS avg_salary
FROM Employees;


SELECT e.name, e.position, e.salary, d.avg_salary
FROM Employees e
JOIN (
    SELECT department_id, AVG(salary) AS avg_salary
    FROM Employees
    GROUP BY department_id
) d ON e.department_id = d.department_id;
