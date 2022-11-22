select first_name, last_name, birth_date
from employees
where birth_date between '1952-01-01' and '1955-12-31';

select first_name, last_name, birth_date
from employees
where birth_date between '1951-01-01' and '1955-12-31'
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31')
order by birth_date asc;

select count(first_name)
from employees
where birth_date between '1951-01-01' and '1955-12-31'
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT * FROM retirement_info;