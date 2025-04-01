
  SELECT COUNT(*) AS TotalEmployees FROM Employees;

  SELECT AVG(Salary) AS AverageSalary FROM Employees;

  SELECT Department, SUM(Salary) AS TotalSalary FROM Employees GROUP BY Department;

  SELECT Department, COUNT(*) AS EmployeeCount FROM Employees GROUP BY Department;

  SELECT Department, COUNT(*) AS EmployeeCount FROM Employees GROUP BY Department HAVING COUNT(*) > 1;


