
-- db_name : git_learning

-- Schema creation

create schema sde;

--Tables Structure

-- employees

CREATE TABLE sde.employees (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department_id INT,
    salary NUMERIC(10, 2),
    hire_date DATE DEFAULT CURRENT_DATE
);

INSERT INTO sde.employees (first_name, last_name, department_id, salary, hire_date) 
VALUES
('Amit', 'Sharma', 1, 70000.00, '2021-03-15'),
('Sneha', 'Patel', 2, 80000.00, '2020-05-20'),
('Ravi', 'Kumar', 1, 60000.00, '2021-11-02'),
('Priya', 'Verma', 3, 55000.00, '2019-07-25'),
('Siddharth', 'Joshi', 3, 95000.00, '2022-01-10'),
('Nisha', 'Singh', 2, 58000.00, '2022-08-11'),
('Rajesh', 'Mehta', 1, 67000.00, '2019-10-30'),
('Suman', 'Rao', 4, 62000.00, '2023-01-25');


-- departments

CREATE TABLE sde.departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(100)
);

INSERT INTO sde.departments (department_name) 
VALUES
('Information Technology'),
('Human Resources'),
('Finance'),
('Marketing');


-- projects

CREATE TABLE sde.projects (
    project_id SERIAL PRIMARY KEY,
    project_name VARCHAR(100),
    department_id INT,
    budget NUMERIC(15, 2)
);

INSERT INTO sde.projects (project_name, department_id, budget) 
VALUES
('CRM System Upgrade', 1, 500000.00),
('Employee Training Program', 2, 150000.00),
('Taxation Module Development', 3, 350000.00),
('Market Research Survey', 4, 200000.00),
('Data Migration to Cloud', 1, 450000.00),
('Payroll System Automation', 3, 300000.00);


-- employee_projects

CREATE TABLE sde.employee_projects (
    employee_id INT,
    project_id INT,
    hours_worked NUMERIC(5, 2),
    PRIMARY KEY (employee_id, project_id)
);

INSERT INTO sde.employee_projects (employee_id, project_id, hours_worked)
VALUES
(1, 1, 120.5),
(1, 5, 95.0),
(2, 2, 85.0),
(3, 1, 110.0),
(3, 5, 75.0),
(4, 3, 90.0),
(5, 6, 110.5),
(6, 2, 60.0),
(7, 5, 65.5),
(7, 1, 95.0),
(8, 4, 88.0);
