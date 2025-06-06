create table thirdyear(regno number(10) primary key, name varchar2(30) not null);
create table section22(regno number(10) primary key,name varchar(30) not null,foreign key(regno) references thirdyear(regno));

insert into thirdyear values(2241002148,'Krrish');
insert into thirdyear values(2241002121,'Sambhav');
insert into thirdyear values(2241002143,'Shubham');
insert into thirdyear values(2241002234,'Srijeet');
insert into thirdyear values(2241001221,'Sam');
insert into thirdyear values(2241006464,'Tom');
insert into thirdyear values(2241008628,'Dean');


-------------------------------------------------------------

-------------------------------------Assignment-2-------------------------------------

--a) Display the structure of all the tables from Assignment 1

DESC Instructor;
DESC Course;
DESC Prereq;
DESC Department;
DESC Teaches;

--b) Display the contents of all the tables from Assignment 1

SELECT * FROM Instructor;
SELECT * FROM Course;
SELECT * FROM Prereq;
SELECT * FROM Department;
SELECT * FROM Teaches;

--c) Display the name and department of each instructor

SELECT Name, Dept_name 
FROM Instructor;

--d) Display the name and salary of Comp. Sci. instructors

SELECT Name, Salary 
FROM Instructor 
WHERE Dept_name = 'Comp Sci';

--e) Display the records of instructors from Physics department with salary < 90000

SELECT * FROM Instructor 
WHERE Dept_name = 'Physics' AND Salary < 90000;

--f) Display names of instructors not from Comp. Sci. department

SELECT Name 
FROM Instructor 
WHERE Dept_name <> 'Comp Sci';

--g) Display the distinct department names from Instructor table

SELECT DISTINCT Dept_name 
FROM Instructor;

--h) Display all Course_id's taught in Spring 2009

SELECT Course_id 
FROM Teaches 
WHERE Semester = 'Spring' AND Year = 2009;

--i) Display course titles from Comp. Sci. department with credits not equal to 3

SELECT Title 
FROM Course 
WHERE Dept_name = 'Comp. Sci.' AND Credits <> 3;

--j) Display all columns of Course table sorted by department name (descending)

SELECT * FROM Course 
ORDER BY Dept_name DESC;

--k) Add a date_of_join column to Instructor table

ALTER TABLE Instructor 
ADD date_of_join DATE;

--l) Insert date values into existing rows (example only, adjust dates accordingly)

UPDATE Instructor 
SET date_of_join = TO_DATE('01-01-2010', 'DD-MM-YYYY') 
WHERE ID = 10101;
UPDATE Instructor 
SET date_of_join = TO_DATE('05-03-2009', 'DD-MM-YYYY') 
WHERE ID = 12121;
-- (Continue for other rows...)

--m) Change the column name dept_name to department in all tables

ALTER TABLE Instructor RENAME COLUMN Dept_name TO Department;
ALTER TABLE Course RENAME COLUMN Dept_name TO Department;
ALTER TABLE Department RENAME COLUMN Dept_name TO Department;

--n) Rename the table Prereq to Prerequired

RENAME Prereq TO Prerequired;

--o) Change column name Course_id to Sub_code

ALTER TABLE Course RENAME COLUMN Course_id TO Sub_code;
ALTER TABLE Teaches RENAME COLUMN Course_id TO Sub_code;
ALTER TABLE Prerequired RENAME COLUMN Course_id TO Sub_code;

--p) Change data type of Name to VARCHAR(50)

ALTER TABLE Instructor MODIFY Name VARCHAR2(50);

--q) Rename Instructor table to Faculty_Info

RENAME Instructor TO Faculty_Info;

--r) Change column size of Course_id in Course table from 10 to 8

-- (Note: Use original table name if not yet renamed; otherwise use Sub_code)
ALTER TABLE Course MODIFY Sub_code VARCHAR2(8);

--s) Delete all content from Prereq table

TRUNCATE TABLE Prerequired;

--t) Rename column Building to Builder in Department table

ALTER TABLE Department RENAME COLUMN Building TO Builder;

-------------------assignment completed--------------------------------






sqlplus id2241002148/id2241002148@//172.30.16.99/ora11g
