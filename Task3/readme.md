

- **Count the total number of employees:**
  ```sql
  SELECT COUNT(*) AS TotalEmployees FROM Employees;
  ```
  ## Output
  ![Output](assets/output-1.png)

- **Calculate the average salary of all employees:**
  ```sql
  SELECT AVG(Salary) AS AverageSalary FROM Employees;
  ```
  ## Output
  ![Output](assets/output-2.png)

- **Total salary expense per department:**
  ```sql
  SELECT Department, SUM(Salary) AS TotalSalary FROM Employees GROUP BY Department;
  ```
  ## Output
  ![Output](assets/output-3.png)

- **Count the number of employees per department:**
  ```sql
  SELECT Department, COUNT(*) AS EmployeeCount FROM Employees GROUP BY Department;
  ```
  ## Output
  ![Output](assets/output-4.png)

- **Filter grouped results (departments with more than 1 employee):**
  ```sql
  SELECT Department, COUNT(*) AS EmployeeCount FROM Employees GROUP BY Department HAVING COUNT(*) > 1;
  ```
  ## Output
  ![Output](assets/output-5.png)



