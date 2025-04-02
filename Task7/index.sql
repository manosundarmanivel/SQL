CREATE TABLE Employees (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    department_id INT NOT NULL,
    salary DECIMAL(10,2) NOT NULL,
    hire_date DATE NOT NULL
);

INSERT INTO Employees (name, department_id, salary, hire_date) VALUES
('Alice Johnson', 1, 80000, '2020-06-15'),
('Bob Smith', 1, 95000, '2018-03-22'),
('Charlie Brown', 2, 72000, '2021-01-10'),
('Diana Green', 2, 60000, '2019-07-30'),
('Ethan White', 1, 87000, '2017-11-05'),
('Fiona Blue', 3, 75000, '2023-05-18'),
('George Black', 3, 68000, '2022-08-25'),
('Helen Red', 3, 73000, '2021-12-10');

SELECT id, name, department_id, salary,
       ROW_NUMBER() OVER(PARTITION BY department_id ORDER BY salary DESC) AS row_num
FROM Employees;

SELECT id, name, department_id, salary,
       RANK() OVER(PARTITION BY department_id ORDER BY salary DESC) AS rank_num
FROM Employees;

SELECT id, name, department_id, salary,
       DENSE_RANK() OVER(PARTITION BY department_id ORDER BY salary DESC) AS dense_rank_num
FROM Employees;

SELECT id, name, salary,
       LEAD(salary) OVER(ORDER BY salary DESC) AS next_highest_salary
FROM Employees;

SELECT id, name, salary,
       LAG(salary) OVER(ORDER BY salary DESC) AS previous_salary
FROM Employees;