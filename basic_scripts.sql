-- Basic Queries

-- Get Average Salary by Department and round it with 2 digits

SELECT d.department_name, round(AVG(e.salary),2) AS avg_salary
FROM sde.employees e
JOIN sde.departments d ON e.department_id = d.department_id
GROUP BY d.department_name;


--  Get Employees with the Highest Salary in Each Department

SELECT e.first_name, e.last_name, e.salary, d.department_name
FROM sde.employees e
JOIN sde.departments d ON e.department_id = d.department_id
WHERE e.salary = (
    SELECT MAX(e2.salary)
    FROM sde.employees e2
    WHERE e2.department_id = e.department_id
);


-- Get Employee Details Along with Their Project Hours and Department

SELECT e.employee_id, e.first_name, e.last_name, d.department_name, 
       SUM(ep.hours_worked) AS total_hours
FROM sde.employees e
JOIN sde.employee_projects ep ON e.employee_id = ep.employee_id
JOIN sde.departments d ON e.department_id = d.department_id
GROUP BY e.employee_id, e.first_name, e.last_name, d.department_name;


-- Find Employees Working on More than One Project

SELECT e.employee_id, e.first_name, e.last_name, COUNT(ep.project_id) AS project_count
FROM sde.employees e
JOIN sde.employee_projects ep ON e.employee_id = ep.employee_id
GROUP BY e.employee_id, e.first_name, e.last_name
HAVING COUNT(ep.project_id) > 1;


-- Retrieve Top 3 Highest Paid Employees in Each Department

WITH ranked_employees AS (
    SELECT e.employee_id, e.first_name, e.last_name, e.salary, d.department_name,
           RANK() OVER (PARTITION BY e.department_id ORDER BY e.salary DESC) AS salary_rank
    FROM sde.employees e
    JOIN sde.departments d ON e.department_id = d.department_id
)
SELECT employee_id, first_name, last_name, salary, department_name
FROM ranked_employees
WHERE salary_rank <= 3;


-- Retrive top 3 highest salary paid employees along with there departments

select e.first_name,e.last_name,d.department_name,e.salary
from sde.employees e
join sde.departments d
on e.department_id = d.department_id
group by e.salary,d.department_name,e.first_name,e.last_name
order by e.salary DESC
limit 3;



