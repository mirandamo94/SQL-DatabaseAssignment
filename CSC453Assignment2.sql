/*Miranda Mo
CSC 453 701
Assignment 2
September 26, 2017*/

--1). Average salary of all male employees
SELECT AVG(Salary) 
    FROM EMPLOYEE 
    WHERE Gender='M';
    
--2). List of first name of employees with daughters 
--that have the same first name
SELECT Fname 
    FROM EMPLOYEE 
    WHERE EXISTS(SELECT * 
        From DEPENDENT 
        WHERE DependentName=Fname 
        AND Sex='F');
    
--3). Names of employees directly supervisded by Fred Wong
SELECT Fname, Lname 
    FROM EMPLOYEE
    WHERE Superssn IN 
    (SELECT Ssn 
        FROM EMPLOYEE 
        WHERE Fname='Fred' 
        AND Lname='Wong');
    
--4). List project in ascending order and display total hours, 
--name and total hours per week

SELECT Pnumber AS ProjectNumber, Pname AS ProjectName, SUM(Hours) AS TotalHours
    FROM PROJECT, WORKSON
    WHERE PNUMBER=Pno
    GROUP BY Pnumber, Pname
    ORDER BY Pnumber;

--5).List SSNs of all employees who do not have any projects
SELECT Ssn
    FROM EMPLOYEE 
    WHERE Ssn Not IN(
        SELECT WORKSON.Essn
            FROM WORKSON);
            
--6). Display department number, average salary, 
--order from sal highest to lowest
SELECT Dno AS DepartmentNo,AVG(Salary)
    FROM EMPLOYEE
    GROUP BY Dno
    ORDER BY AVG(Salary) DESC;

--7).List names in D2 that work more than 10 hours on ProductA project
SELECT Fname,Lname
    FROM EMPLOYEE
    JOIN WORKSON 
        ON EMPLOYEE.Ssn=WORKSON.Essn
    JOIN PROJECT 
        ON PROJECT.Pnumber=WORKSON.Pno
    WHERE PROJECT.Pname='ProductA' 
    AND WORKSON.Hours>=10 
    AND EMPLOYEE.Dno=2;
    
--8).For each department with at most 3 employees, 
--display dname and #of employees
SELECT Dname, COUNT(*) AS NumOfEmps
    FROM DEPARTMENT, EMPLOYEE 
    WHERE Dnumber= Dno AND Dno IN( SELECT Dno
                                    FROM EMPLOYEE
                                    GROUP BY Dno 
                                    HAVING COUNT(*)<=3)
    GROUP BY Dname;
 
--9). Last names and salaries of all employees who work in the same department
--as the employee who has the lowest salary
SELECT Lname, Salary
    FROM EMPLOYEE
    WHERE Dno =
        (SELECT Dno 
            FROM EMPLOYEE 
            WHERE Salary=
                (SELECT MIN(Salary) 
                    FROM EMPLOYEE));
                    
--10).Names of all employees whose supervisor's supervisor has SSN '121231555'
SELECT Fname,Lname
    FROM EMPLOYEE
    WHERE Superssn IN
        (SELECT Ssn 
            FROM EMPLOYEE 
            WHERE Superssn='121231555');