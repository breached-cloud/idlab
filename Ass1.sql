sqlplus id2241002148/id2241002148@//172.30.16.99/ora11g
-------------------------------------Assignment-1-------------------------------------
create table Instructor ( id number(5), Name varchar2(30), Dept_name varchar2(20), Salary number(6));
create table Course ( Course_id varchar2(10), Title varchar2(30), Dept_name varchar2(20), Credits number(2));
create table Prereq ( Course_id varchar2(10), Prereq_id varchar2(10));
create table Department ( dept_name varchar2(10), building varchar2(10), budget number(10));
create table Teaches (ID number(5), Course_id varchar2(10), Sec_id number(2), Semester varchar2(10), year number(4));


insert all 
    into Instructor values(10101, 'Srinivasan' , 'Comp Sci', 65000)
    into Instructor values(12121, 'Wu' , 'Finance', 90000)
    into Instructor values(15151, 'Mozart' , 'Music', 40000)
    into Instructor values(22222, 'Einstein' , 'Physics', 95000)
    into Instructor values(32343, 'El Said' , 'History', 60000)
    into Instructor values(33456, 'Gold' , 'Physics', 87000)
    into Instructor values(45565, 'Katz' , 'Comp Sci', 75000)
    into Instructor values(58583, 'Califieri' , 'History', 62000)
    into Instructor values(76543, 'Singh' , 'Finance', 80000)
    into Instructor values(76766, 'Crick' , 'Biology', 72000)
    into Instructor values(83821, 'Brandt' , 'Comp Sci', 92000)
    into Instructor values(98345, 'Kim' , 'Elec Eng', 80000)
select * from dual;



INSERT ALL
    INTO Course VALUES ('BIO-101', 'Intro. to Biology', 'Biology', 4)
    INTO Course VALUES ('BIO-301', 'Genetics', 'Biology', 4)
    INTO Course VALUES ('BIO-399', 'Computational Biology', 'Biology', 3)
    INTO Course VALUES ('CS-101', 'Intro. to Computer Science', 'Comp. Sci.', 4)
    INTO Course VALUES ('CS-190', 'Game Design', 'Comp. Sci.', 4)
    INTO Course VALUES ('CS-315', 'Robotics', 'Comp. Sci.', 3)
    INTO Course VALUES ('CS-319', 'Image Processing', 'Comp. Sci.', 3)
    INTO Course VALUES ('CS-347', 'Database System Concepts', 'Comp. Sci.', 3)
    INTO Course VALUES ('EE-181', 'Intro. to Digital Systems', 'Elec. Eng.', 3)
    INTO Course VALUES ('FIN-201', 'Investment Banking', 'Finance', 3)
    INTO Course VALUES ('HIS-351', 'World History', 'History', 3)
    INTO Course VALUES ('MU-199', 'Music Video Production', 'Music', 3)
    INTO Course VALUES ('PHY-101', 'Physical Principles', 'Physics', 4)
SELECT * FROM DUAL;


INSERT ALL
    INTO Prereq VALUES ('BIO-301', 'BIO-101')
    INTO Prereq VALUES ('BIO-399', 'BIO-101')
    INTO Prereq VALUES ('CS-190', 'CS-101')
    INTO Prereq VALUES ('CS-315', 'CS-101')
    INTO Prereq VALUES ('CS-319', 'CS-101')
    INTO Prereq VALUES ('CS-347', 'CS-101')
    INTO Prereq VALUES ('EE-181', 'PHY-101')
SELECT * FROM DUAL;


INSERT ALL
    INTO Department VALUES ('Biology', 'Watson', 90000)
    INTO Department VALUES ('Comp. Sci.', 'Taylor', 100000)
    INTO Department VALUES ('Elec. Eng.', 'Taylor', 85000)
    INTO Department VALUES ('Finance', 'Painter', 120000)
    INTO Department VALUES ('History', 'Painter', 50000)
    INTO Department VALUES ('Music', 'Packard', 80000)
    INTO Department VALUES ('Physics', 'Watson', 70000)
SELECT * FROM DUAL;



insert all 
  into teaches values (10101, 'CS-101', 1, 'Fall', 2009)
  into teaches values (10101, 'CS-315', 1, 'Spring', 2010)
  into teaches values (10101, 'CS-347', 1, 'Fall', 2009)
  into teaches values (12121, 'FIN-201', 1, 'Spring', 2010)
  into teaches values (15151, 'MU-199', 1, 'Spring', 2010)
  into teaches values (22222, 'PHY-101', 1, 'Fall', 2009)
  into teaches values (32343, 'HIS-351', 1, 'Spring', 2010)
  into teaches values (45565, 'CS-101', 1, 'Spring', 2010)
  into teaches values (45565, 'CS-319', 1, 'Spring', 2010)
  into teaches values (76766, 'BIO-101', 1, 'Summer', 2009)
  into teaches values (76766, 'BIO-301', 1, 'Summer', 2010)
  into teaches values (83821, 'CS-190', 1, 'Spring', 2009)
  into teaches values (83821, 'CS-190', 2, 'Spring', 2009)
  into teaches values (83821, 'CS-319', 2, 'Spring', 2010)
  into teaches values (98345, 'EE-181', 1, 'Spring', 2009)
select * from dual;

-------------------assignment completed--------------------------------

---------------------------prac------------------------

select sum(salary), dept_name 
from Instructor
group by dept_name
having sum(salary)>85000


select * from Instructor order by salary

select sum(salary), dept_name from Instructor group by dept_name;

create, desc, insert, select, alter, truncate, rename, drop
dml-insert, update, delete, select

distinct , avg, sum, max, min, count --aggregate function 

--query for second highest
xdsBXNM


 sqlplus id2241002148/id2241002148@//172.30.16.99/ora11g
