show databases;

use advancesqldb;

show tables;

select * from employees;
select * from department;



-- SubQuery : A SQL query places inside another query, in simple words query inside another query
/*
1.Scalary Subquery
	- always return one row & one column 
*/

/*
QUESTION: Find the employees who's salary is more than avg salary earned by all employees

	1. find the avg salary of employees;
    2. filter the employees based on the above result
*/

select avg(salary) from employees;

SELECT *
FROM   employees
WHERE  salary >= 60900;  -- hard coding [is not correct]

-- using sub-query
SELECT *
FROM   employees -- outer/mainquery 
WHERE  salary >= (SELECT avg(salary)
                  FROM   employees); -- inner/sub query




-- using JOIN CLAUSE 
SELECT *
FROM   employees e1
       JOIN (SELECT avg(salary) AS sal
             FROM   employees) e2
         ON e1.salary > e2.sal;  

SELECT e1.*
FROM   employees e1
       JOIN (SELECT avg(salary) AS sal
             FROM   employees) e2
         ON e1.salary > e2.sal;  

-- ############################################################################################ --------------

/*
2. MultipleRow SubQuery
- subquery which returns multiple column and multiple rows
- subquery which returns only 1 column and multiple rows

*/

-- QUESTION:  Find the employees who earns the highest salary in each department?
-- multiple column and multiple rows

select * from employees;

SELECT dept_name,
       max(salary)
FROM   employees
GROUP  BY dept_name; 

SELECT *
FROM   employees
WHERE  ( dept_name, salary ) IN (SELECT dept_name,
                                        max(salary)
                                 FROM   employees
                                 GROUP  BY dept_name);  
            
-- single column & multiple rows
-- QUESTION: Find Department which doesn't have any employees

SELECT DISTINCT dept_name FROM employees;
SELECT DISTINCT dept_name FROM department;

SELECT *
FROM   department
WHERE  dept_name NOT IN (SELECT DISTINCT dept_name
                         FROM   employees);  

-- ############################################################################################ --------------

/*
3. Correlated subquery
- A sub-query which is related to the outer query
- processing will be different
- processing of sub-query will relate values return from outer query

*/


-- QUESTION:  Find the employees in each department who earns more than the average salary in that department?
SELECT Avg(salary)
FROM   employees
WHERE  dept_name = "IT";

SELECT *
FROM   employees
WHERE  salary > (SELECT avg(salary)
                 FROM   employees
                -- where dept_name = "specific_dept_name"
                );  

                
SELECT *
FROM   employees e1
WHERE  salary > (SELECT avg(salary)
                 FROM   employees e2
                 WHERE  ie2.dept_name = e1.dept_name);  

-- using JOIN 
select dept_name, avg(salary) as avgsal from employees group by dept_name;

SELECT e1.*,
       e2.avgsal
FROM   employees e1
       JOIN (SELECT dept_name,
                    avg(salary) AS avgsal
             FROM   employees
             GROUP  BY dept_name) e2
         ON e1.dept_name = e2.dept_name
            AND e1.salary > e2.avgsal; 

-- example-2 : FIND department which doesn't have any employees;
SELECT *
FROM   department d
WHERE  NOT EXISTS (SELECT 1
                   FROM   employees e
                   WHERE  e.dept_name = d.dep_name);  
-- NOT EXIST 
-- : true when no records returns from subquery
-- : false when records returns from subquery

select 1 from employees e where e.dept_name = 'IT';
select 1 from employees e where e.dept_name = 'Marketing';


###########################################################
-- Subquery inside a subquery [nested sub query]

select * from sales;


-- QUESTION: Find the stores who's  sales where better than the average sales across all stores 

-- 1.find the total sales  for each store
SELECT store_name,
       sum(price * quantity) total_sales
FROM   sales
GROUP  BY store_name;  

-- 2. find the avg sales for all stores 
SELECT avg(total_sales)
FROM   (SELECT store_name,
               sum(price * quantity) total_sales
        FROM   sales
        GROUP  BY store_name) x; -- temp table 

-- 3. compare 1 & 2 

SELECT *
FROM   (SELECT store_name,
               sum(price * quantity) total_sales
        FROM   sales
        GROUP  BY store_name) sales -- table 1
       JOIN (SELECT avg(total_sales) AS sales
             FROM   (SELECT store_name,
                            sum(price * quantity) total_sales
                     FROM   sales
                     GROUP  BY store_name) x) avg_sales -- table 2
         ON sales.total_sales > avg_sales.sales;  

-- when we use same subquery multiple times, use WITH caluse

WITH sales
     AS (SELECT store_name,
                sum(price * quantity) total_sales
         FROM   sales
         GROUP  BY store_name)
SELECT *
FROM  sales
       JOIN (SELECT avg(total_sales) AS sales
             FROM   sales x) avg_sales
         ON sales.total_sales > avg_sales.sales;  
   

##########################################################
-- Different SQL clauses Where sub query is allowed 

-- SELECT 
-- FROM 
-- WHERE 
-- HAVING 

-- Using subquery in SELECT clause 
/* Fecth all employee details and add remarks to those employees who earns more than the average pay.*/

SELECT *
FROM   employees
WHERE  salary > (SELECT avg(salary)
                 FROM   employees);  
        
SELECT *,
       ( CASE
           WHEN salary > (SELECT avg(salary)
                          FROM   employees) THEN 'Higher than avg'
           ELSE NULL
         end ) AS remarks
FROM   employees; 

-- using JOIN 

SELECT *,
       ( CASE
           WHEN salary > avg_sal.sal THEN 'Higher than avg'
           ELSE NULL
         end ) AS remarks
FROM   employees
       CROSS JOIN (SELECT avg(salary) AS sal
                   FROM   employees) avg_sal; 
                          

/* Fetch all employee and add new column avg_sal */
SELECT *, (SELECT avg(salary) FROM employees) as avg_sal
FROM employees;

/*Fetch all employees and assign salary grade value 
	40000< 24
    60000> 25
    70000> 26
    80000> 27
    90000> 28
    100000 > 29
*/


-- HAVING 
/*QUESTION: Find the employees who have sold more units than average units sold by all stores */

-- total units 
SELECT store_name,
		sum(quantity)
 FROM sales
 GROUP BY store_name;
 
 -- average units 
 SELECT avg(quantity) 
 FROM sales;

-- combine two queries
SELECT store_name,
       sum(quantity) AS total_sales
FROM   sales
GROUP  BY store_name
HAVING total_sales > (SELECT avg(quantity)
                      FROM   sales);  
 

################################################

## Different SQL statements Where sub query is allowed

-- INSERT
-- DELETE 
-- UPDATE 

-- INSERT
/*QUESTION: Insert data into employee history table, make sure not insert duplicate records */

select * from employee_history;

-- combine both tables 
SELECT * 
FROM employees e 
	JOIN department d
	ON d.deptName = e.deptName;
   

-- without where condtion, it will create duplicate records
INSERT INTO employee_history
SELECT e.empid,
       e.empname,
       e.deptname,
       e.salary,
       d.location
FROM   employees e
       JOIN department d
         ON d.deptname = e.deptname;  

-- with where condtion
INSERT INTO employee_history
SELECT e.empid,
       e.empname,
       e.deptname,
       e.salary,
       d.location
FROM   employees e
       JOIN department d
         ON d.deptname = e.deptname
WHERE  NOT EXISTS (SELECT 1
                   FROM   employee_history eh
                   WHERE  eh.empid = e.empid);  

-- UPDATE 
/* QUESTION: Give 10% increment to all employees in Banglore location
 Based on the maximum salary earned by an employee in each department.
 Consider only employees in employee history table
 */
 
 select * from department;
 
 SELECT * 
 FROM employees e
		JOIN department d
			ON d.deptName = e.deptName AND d.location = 'Bangalore';
 
 -- all employees from bangalore location
SELECT * FROM employee_history
WHERE location = 'Bangalore';
 
 -- max salary
UPDATE employees e
SET    salary = (SELECT max(salary) + max(salary) * 0.1 AS inc
                 FROM   employee_history eh
                 WHERE eh.deptName = e.deptName)

where e.deptName IN (SELECT deptName FROM department
					WHERE location = 'Bangalore')

AND e.empId IN (SELECT empId from  employee_history);             
 
 
 select * from employee_history;
 

-- DELETE 
/*QUESTION: Delete all departments who do not have any employees */

SELECT deptname
FROM department
where deptname NOT IN (
                          SELECT DISTINCT deptname FROM employees
                      );

SELECT *
FROM department d
WHERE NOT EXISTS
(
    SELECT 1 FROM employees e where e.deptName = d.deptName
); 
 
 
DELETE FROM department
WHERE deptName IN(SELECT deptName
                  FROM department d
                  WHERE NOT EXISTS (SELECT 1 FROM employees e where e.deptName=d.deptName));
 


CREATE TABLE title_basics(
	tconst VARCHAR(128),
	titleType VARCHAR(128),
	primaryTitle VARCHAR(128),
	originalTitle VARCHAR(128),
	isAdult VARCHAR(10),
	startYear YEAR,
	endYear YEAR,
	runtimeMinutes INT,
	genres VARCHAR(255)
);

show tables;

