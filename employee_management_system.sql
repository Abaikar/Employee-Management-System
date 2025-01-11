create database employee_management;
use employee_management;
CREATE TABLE department (
    departmentid INT NOT NULL PRIMARY KEY,
    departmentname VARCHAR(30)
);
insert into department 
(departmentid, departmentname )
values
(1, 'IT'),
(2, 'HR'),
(3, 'Marketing');

CREATE TABLE employee (
    EmployeeID INT NOT NULL PRIMARY KEY,
    Name VARCHAR(40),
    departmentid INT,
    salary DECIMAL(10 , 2 ),
    joinyear YEAR,
    FOREIGN KEY (departmentid)
        REFERENCES department (departmentid)
);
insert into employee
(EmployeeID, Name, departmentid, salary, joinyear )
Values
(1 ,'John Doe',1 , 50000, 2012),
(2 ,'Jane Smith',2 , 55000, 2023),
(3 ,'Bob Johnson',3 , 45000, 2022),
(4 ,'Alice Williams',2 , 55000, 2021),
(5 ,'Charlie Brown',1 , 65000, 2017),
(6 ,'Emma Davis',1 , 48000, 2015),
(7 ,'Liam Roberts',3 , 47000, 2016),
(8 ,'Ava Wilson',1 , 70000, 2023),
(9 ,'Noah Taylor',2 , 52000, 2022),
(10 ,'Olivia Harris',2 , 53000, 2021);

select * from employee;
select * from department;

-- 1. List all employees with their department names:
SELECT 
    Name, departmentname
FROM
    department
        JOIN
    employee ON employee.departmentid = department.departmentid;
    
             --    ******* --
-- 2. Show the total number of employees in each department:

SELECT 
    departmentname,
    COUNT(department.departmentid) AS Numberofemployee
FROM
    department
        JOIN
    employee ON employee.departmentid = department.departmentid
GROUP BY department.departmentname;

-- 3. Find the employees with a salary above 60,000:
SELECT 
    Name, salary
FROM
    employee
WHERE
    salary > 60000;
    
-- 4. Display the employees who joined after 2020
SELECT 
    Name, joinyear
FROM
    employee
WHERE
    joinyear > 2020;
    
-- 5. Show the average salary per department:

SELECT 
    departmentname, AVG(employee.salary) AS averagesalary
FROM
    department
        JOIN
    employee ON employee.departmentid = department.departmentid
GROUP BY departmentname;

-- 6. Find the employee with the highest salary

SELECT 
    Name, salary
FROM
    employee
ORDER BY salary DESC
LIMIT 1;

-- 7 Find employees from the IT department who joined after 2020:

select name
from employee
where departmentid = 1;

-- 8. List departments along with the total salary expense:
SELECT 
    departmentname, SUM(employee.salary) AS totalsalary
FROM
    department
        JOIN
    employee ON employee.departmentid = department.departmentid
GROUP BY departmentname;

-- 9. Get employees sorted by salary in descending order 
SELECT 
    Name, salary
FROM
    employee
ORDER BY salary DESC;
  
  ----------- THANK YOU  ------------

