-- Section 1: SQL Expressions using SQL Operators

-- 1a. Display the Course_ids, Titles and Credits of course that are offered in any of the departments namely: Physics, Music, Finance and Biology.
SELECT course_id, title, credits 
FROM course 
WHERE dept_name IN ('Physics', 'Music', 'Finance', 'Biology');

-- 1b. Display records of the instructors whose name starts with "K" and who get salary more than 65000.
SELECT * 
FROM Instructor 
WHERE name LIKE 'K%' AND salary > 65000;

-- 1c. Display name, department, gross salary and net salary of instructors with 105% DA, 20% HRA, 30% IT. (gross salary = salary + DA + HRA, net salary = gross salary - IT).
SELECT name, dept_name, 
       salary + (salary * 1.05) + (salary * 0.2) AS Gross_Salary, 
       salary + (salary * 1.05) + (salary * 0.2) - (salary * 0.3) AS Net_Salary
FROM Instructor;

-- 1d. Display records of the Instructors with salary range 60000 to 80000.
SELECT * 
FROM Instructor 
WHERE salary BETWEEN 60000 AND 80000;

-- 1e. Display the records of the instructors having the second letter in their name as 'r'.
SELECT * 
FROM Instructor 
WHERE name LIKE '_r%';

-- 1f. Display the names of the instructors of Comp.Sci. Department in the descending order of their salary.
SELECT name 
FROM Instructor 
WHERE dept_name = 'Comp Sci' 
ORDER BY salary DESC;

-- 1g. Update all records of Instructor table with a salary hike of 15%.
UPDATE Instructor 
SET salary = salary * 1.15;

-- 1h. Update the records with a salary hike of 3% for Comp.Sci. Dept instructors having salary less than 70000.
UPDATE Instructor 
SET salary = salary * 1.03 
WHERE dept_name = 'Comp Sci' AND salary < 70000;

-- 1i. Display the annual salary of each instructor.
SELECT name, salary * 12 AS Annual_Salary 
FROM Instructor;

-- 1j. Update the title of the course having title 'Game Design' to 'Game Theory'.
UPDATE course 
SET title = 'Game Theory' 
WHERE title = 'Game Design';

-- 1k. Delete the instructor records of History department.
DELETE FROM Instructor 
WHERE dept_name = 'History';

-- 1l. Delete the course records of the courses having course_id starting with 'BIO'.
DELETE FROM course 
WHERE course_id LIKE 'BIO%';

-- Section 2: SQL Expressions using Aggregate Functions

-- 2a. Display the Avg. salary of instructors of Physics department.
SELECT AVG(salary) 
FROM Instructor 
WHERE dept_name = 'Physics';

-- 2b. Display the Dept_name and Average salary paid to instructor of each department.
SELECT dept_name, AVG(salary) 
FROM Instructor 
GROUP BY dept_name;

-- 2c. Display the ID, Name & Department of the instructor drawing the highest salary.
SELECT id, name, dept_name 
FROM Instructor 
WHERE salary = (SELECT MAX(salary) FROM Instructor);

-- 2d. Display the number of instructors available in Comp. Sci. Department.
SELECT COUNT(*) AS Number_of_Instructors 
FROM Instructor 
WHERE dept_name = 'Comp Sci';

-- 2e. Display the total credits of all courses offered in Comp.Sci. Department.
SELECT SUM(credits) 
FROM Course 
WHERE dept_name = 'Comp. Sci.';

-- 2f. Display the number of instructors and total salary drawn by Physics and Comp.Sci. departments.
SELECT dept_name, COUNT(*) AS Num_of_instructors, SUM(salary) AS total_salary
FROM Instructor 
WHERE dept_name IN ('Physics', 'Comp Sci') 
GROUP BY dept_name;

-- 2g. Display the total credits of Comp.Sci. and Biology departments from course table.
SELECT dept_name, SUM(credits) AS total_credits 
FROM course 
WHERE dept_name IN ('Comp. Sci.', 'Biology') 
GROUP BY dept_name;

-- 2h. Display building wise total budget values.
SELECT building, SUM(budget) AS total_budget 
FROM Department 
GROUP BY building;

-- 2i. Display the number of instructors of each department.
SELECT dept_name, COUNT(*) AS Num_of_instructors 
FROM Instructor 
GROUP BY dept_name;

-- 2j. Display the number of instructors of each department sorted in high to low.
SELECT dept_name, COUNT(*) AS Num_of_instructors 
FROM Instructor 
GROUP BY dept_name 
ORDER BY Num_of_instructors DESC;

-- 2k. Display the number of courses offered semester wise.
SELECT semester, COUNT(*) AS Num_of_Courses 
FROM teaches 
GROUP BY semester;

-- 2l. Display the name of departments having number of instructors less than 2.
SELECT dept_name 
FROM Instructor 
GROUP BY dept_name 
HAVING COUNT(*) < 2;

-- 2m. List the number of instructors of each department having 2 or more than 2 instructors except Finance department, sorted in high to low order of their number.
SELECT dept_name, COUNT(*) AS Num_of_instructors 
FROM Instructor 
WHERE dept_name != 'Finance' 
GROUP BY dept_name 
HAVING COUNT(*) >= 2 
ORDER BY Num_of_instructors DESC;

-- 2n. Display the Dept_name that has paid total salary more than 50000.
SELECT dept_name 
FROM Instructor 
GROUP BY dept_name 
HAVING SUM(salary) > 50000;

-- 2o. Display the total budget for the building built by Watson.
SELECT SUM(budget) AS total_budget 
FROM Department 
WHERE building = 'Watson';

-- 2p. Display the highest salary of the instructor of Comp.Sci. Department.
SELECT MAX(salary) AS highest_salary 
FROM Instructor 
WHERE dept_name = 'Comp Sci';

-- Section 3: SQL Expressions using Scalar Functions

-- 3a. Display your name with first letter being capital, where the entered name is in lower case.
SELECT INITCAP('krrish') 
FROM dual;

-- 3b. Display 2nd-6th characters of your name.
SELECT SUBSTR('krrishbh', 2, 6) 
FROM dual;

-- 3c. Find length of your full university name.
SELECT LENGTH('Siksha O Anusandhan') AS University_length_name 
FROM dual;

-- 3d. Display all the Instructor names with its first letter in upper case.
SELECT INITCAP(name) AS Instructor_Name 
FROM Instructor;

-- 3e. List the department name of each instructor as a three letter code.
SELECT SUBSTR(dept_name, 1, 3) AS dept_code 
FROM Instructor;

-- 3f. Display the month of the joining of each instructor.
SELECT TO_CHAR(hire_date, 'MONTH') AS join_month 
FROM Instructor;

-- 3g. Display the date of joining of each instructor in dd/mm/yy format.
SELECT TO_CHAR(hire_date, 'DD/MM/YY') AS join_date 
FROM Instructor;

-- 3h. Display the experience of each instructor in terms of months.
SELECT name, ROUND(MONTHS_BETWEEN(SYSDATE, hire_date)) AS experience_months 
FROM Instructor;

-- 3i. Display the experience of each instructor in term of years and months.
SELECT name, 
       FLOOR(MONTHS_BETWEEN(SYSDATE, hire_date)/12) || ' years ' || 
       MOD(ROUND(MONTHS_BETWEEN(SYSDATE, hire_date)), 12) || ' months' AS experience 
FROM Instructor;

-- 3j. Display the day of joining of each instructor.
SELECT TO_CHAR(hire_date, 'DAY') AS join_day 
FROM Instructor;

-- 3k. Display the date corresponding to 15 days after today's date.
SELECT TO_CHAR(SYSDATE + 15, 'DD/MM/YYYY') AS future_date 
FROM dual;

-- 3l. Display the value 94204.27348 truncated up to 2 digits after decimal point.
SELECT TRUNC(94204.27348, 2) AS truncated_value 
FROM dual;

-- 3m. Display the value of the expression 5 + 8^9.
SELECT 5 + POWER(8, 9) AS result 
FROM dual;

-- 3n. Find out the square root of 6464312.
SELECT SQRT(6464312) AS square_root 
FROM dual;

-- 3o. Display the string "HELLO ITER" in lower case with a column heading lower case.
SELECT LOWER('HELLO ITER') AS "lower case" 
FROM dual;
