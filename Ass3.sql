-----------------------------------------------------1-------------------------------------------------
sqlplus id2241002148/id2241002148@//172.30.16.99/ora11g

-- ramkedem.com


-----1a----
select course_id,title,credits 
from course 
where dept_name in ('Physics','Music','Finance','Biology');

-----1b------
select * from Instructor 
where name like 'K%' and salary>65000;

-----1c------
select name, dept_name, salary+(salary*1.05)+(salary*0.2) as Gross_Salary, salary+(salary*1.05)+(salary*0.2)-(salary*0.3) as Net_Salary
from Instructor;

-----1d------
select * from Instructor 
where salary between 60000 and 80000;
--or
select * from Instructor 
where salary >= 60000 and salary <= 80000;

-----1e------
select * from Instructor 
where name like '_r%';

-----1f-------
select name from Instructor 
where dept_name='Comp Sci' 
order by salary desc;

-----1g-------
update Instructor 
set salary = salary * 1.15;

------1h------
update Instructor set salary = salary * 1.03 
where dept_name='Comp Sci' and salary < 70000;

------1i------
select name,salary*12 as Annual_Salary 
from Instructor; 

------1j------
update course
set title='Game Theory'
where title='Game Design';

-----1k-------
delete from Instructor 
where dept_name='History';

-----1l--------
delete from course 
where Course_id 
like 'BIO%';


-------------------------------2--------------------------------


----2a----
select avg(salary) 
from Instructor 
where dept_name='Physics';

----2b----
select dept_name,avg(salary) 
from Instructor 
group by dept_name;

----2c----
select id,name,dept_name 
from Instructor 
where salary = (select max(salary) 
from Instructor);

----2d----
select count(*) as Number_of_Instructors 
from Instructor 
where dept_name='Comp Sci'; 

----2e----
select sum(credits) 
from Course 
where dept_name='Comp. Sci.';

----2f----
select dept_name, count(*) as Num_of_instructors
from Instructor
where dept_name in ('Physics','Comp Sci')
group by dept_name;

----2g----
select dept_name, sum(credits) as total_credits 
from course 
where dept_name in ('Comp. Sci.','Biology') 

----2h----
select building, sum(budget) as total_budget
from Department
group by building;

----2i----
select dept_name, count(*) as Num_of_instructors
from Instructor
group by dept_name;

----2j----
select dept_name, count(*) as Num_of_instructors
from Instructor
group by dept_name
order by Num_of_instructors DESC;

----2k----
select semester,count(*) as Num_of_Courses --we can avoid writing semester
from teaches
group by semester;

----2l----
select count(id),dept_name --count(id) is not required
from Instructor
group by dept_name
having count(*) < 2;

----2m----
select dept_name, count(*) as Num_of_instructors
from Instructor
where dept_name != 'Finance' -- instead of != we can also write not in('Finance)
group by dept_name
having count(*) >= 2
order by Num_of_instructors desc;

----2n----
select dept_name
from Instructor
group by dept_name
having sum(salary) > 50000;

----2o----
select sum(budget) as total_budget
from Department
where building = 'Watson';

----2p----
select max(salary) as highest_salary
from Instructor
where dept_name = 'Comp Sci';


-------------------------------3--------------------------------


--INITCAP,UPPER,LOWER,SUBSTR,LENGTH

----3a----
select initcap('krrish') 
from dual;

----3b----
select substr('krrishbh',2,6) 
from dual;

----3c----
select length('Siksha O Anusandhan') as University_length_name
from dual;

----3d----
select initcap(NAME) as "Instructor_Name"
from Instructor;

----3e----


----3f----
----3g----
----3h----
----3i----
----3j----
----3k----
----3l----
----3m----
----3n----
----3o----



-------------------------------practice--------------------------------


select concat('hello','world')
from dual;

select 
