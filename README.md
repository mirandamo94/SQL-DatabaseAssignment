# SQL Assignment


1.  First, download the script file company.sql from the course web site and run it in SQLDeveloper to construct the example database illustrated in Chapter 5 of Elmasri & Navathe (pp.160-165).  Inspect the schemas and tables in SQLDeveloper to make sure you understand the structure of the database.  (Note that some changes have been made to the database state -- it differs somewhat from the state that is illustrated in Figure 5.6 on p.162.)

2.  In a separate .sql file (do not modify company.sql), write a script that contains the following ten SQL queries (in this order):

1. Display the average salary of all male employees.

2. List just the first name of all employees who have a daughter with the same first name as them.

3. List the names of all employees who are directly supervised by Fred Wong.

4. For each project, display the project name and number and the total hours per week (by all employees) spent on that project.  (List the projects in ascending order by project number.)

5. List the SSNs of all employees who do not work on any project.  (In other words, look at the list of projects given in the PROJECT table, and display the SSNs of all employees who work on none of them.)

6. For each department, display the department number and the average salary of all employees working in that department.  Order the output from the highest average salary to the lowest.

7. List the names of all employees in department 2 who work more than 10 hours per week on the ProductA project.

8. For each department with at most three employees, display the department name and the number of employees in that department.

9. List the last names and salaries of all employees who work in the same department as the employee who has the lowest salary overall.

10. Retrieve the names of all employees whose supervisor's supervisor has SSN '121231555'.

Add a comment before each query in your script file to label the queries 1 through 9 (e.g., the comment '-- 1.' on a line before the first query, the comment '-- 2.' on a line before the second query, et cetera).

Run the script file containing your queries to verify that your results are correct.  
