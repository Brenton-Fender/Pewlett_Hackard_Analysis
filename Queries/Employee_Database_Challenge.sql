-- Use Dictinct with Orderby to remove duplicate rows
--deliverable 1 
--RETIREMENT TITLES
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	t.title,
	t.from_date,
	t.to_date INTO retirement_titles
FROM employees AS e
INNER JOIN titles AS t on(e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

--UNIQUE TITLES
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title

INTO unique_titles
FROM retirement_titles
WHERE (to_date = '9999-01-01')
ORDER BY emp_no, to_date DESC;

--RETIRING TABLES
SELECT count(title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count(title) DESC;

--deliverable 2
--MENTORSHIP ELIGIBILITY
SELECT DISTINCT ON (emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title INTO mentorship_eligibility
FROM employees AS e
INNER JOIN dept_emp AS de ON (e.emp_no = de.emp_no)
INNER JOIN titles AS t on(e.emp_no = t.emp_no)
WHERE (de.to_date = '9999-01-01'
							AND e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp_no

--mentor by department
select dept_name, count(dept_name)
from mentorship_eligibility
join dept_emp on
mentorship_eligibility.emp_no = dept_emp.emp_no
join departments on 
dept_emp.dept_no = departments.dept_no
where dept_emp.to_date = '9999-01-01'
group by dept_name;

--mentor by title
select title, count(title)
from mentorship_eligibility
join dept_emp on
mentorship_eligibility.emp_no = dept_emp.emp_no
join departments on 
dept_emp.dept_no = departments.dept_no
where dept_emp.to_date = '9999-01-01'
group by title 


