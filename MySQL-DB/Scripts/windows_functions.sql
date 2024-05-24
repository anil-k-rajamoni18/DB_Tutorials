SHOW DATABASES;
use jandb;

-- it will display tables
show tables;

select e.*,
max(salary) over(partition by dept_name) as max_salary 
from employee e;


