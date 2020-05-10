SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM dept_manager;

-- Query 1
SELECT e.emp_no, e.first_name, e.last_name, e.sex, s.salary 
FROM employees AS e
INNER JOIN salaries AS s
ON e.emp_no = s.emp_no;

-- Query 2
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN DATE '1986-01-01' AND DATE '1986-12-31';

-- Query 3
SELECT dme.dept_no, d.dept_name, dme.emp_no, dme.first_name, dme.last_name
FROM 
(SELECT dm.dept_no, dm.emp_no, e.first_name, e.last_name
FROM dept_manager AS dm
INNER JOIN employees AS e
ON dm.emp_no = e.emp_no
) AS dme
LEFT JOIN departments AS d
ON dme.dept_no = d.dept_no;

-- Query 4
SELECT ede.emp_no, ede.first_name, ede.last_name, d.dept_name
FROM
(SELECT e.emp_no, e.first_name, e.last_name, de.dept_no
FROM employees AS e
INNER JOIN dept_emp AS de
ON e.emp_no = de.emp_no) AS ede
LEFT JOIN departments AS d
ON ede.dept_no = d.dept_no;

-- Query 5
SELECT first_name, last_name, sex
FROM employees
WHERE (first_name = 'Hercules') AND (last_name LIKE 'B%');

-- Query 6
SELECT ede.emp_no, ede.first_name, ede.last_name, d.dept_name
FROM
(SELECT e.emp_no, e.first_name, e.last_name, de.dept_no
FROM employees AS e
INNER JOIN dept_emp AS de
ON e.emp_no = de.emp_no) AS ede
LEFT JOIN departments AS d
ON ede.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

-- Query 7
SELECT ede.emp_no, ede.first_name, ede.last_name, d.dept_name
FROM
(SELECT e.emp_no, e.first_name, e.last_name, de.dept_no
FROM employees AS e
INNER JOIN dept_emp AS de
ON e.emp_no = de.emp_no) AS ede
LEFT JOIN departments AS d
ON ede.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development');

-- Query 8
SELECT last_name, COUNT(last_name) AS "Count(last_name)"
FROM employees
GROUP BY last_name
ORDER BY "Count(last_name)" DESC;






