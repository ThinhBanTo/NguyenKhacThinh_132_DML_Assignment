create table employees(
    id serial primary key ,
    full_name varchar(50),
    department char(10),
    position varchar(20),
    salary bigint,
    bonus bigint,
    join_year int
);

insert into employees(full_name, department, position, salary, bonus, join_year) values
('Nguyễn Văn Huy','IT','Developer',18000000,1000000,2021),
('Trần Thị Mai','HR','Recruiter',12000000,null,2020),
('Lê Quốc Trung','IT','Tester',15000000,8000000,2023),
('Nguyễn Văn Huy','IT','Developer',18000000,1000000,2021),
('Phạm Ngọc Hân','Finance','Accountant',14000000,null,2019),
('Bùi Thị Lan','HR','HR Manager',20000000,3000000,2018),
('Đặng Hữu Tài','IT','Developer',17000000,null,2022);

--1: lấy min(id) các nguời đại diện --> xóa các người trùng
delete from employees
where id not in (
    select min(id) from employees
                   group by full_name,department,position
);
--2
update employees set salary=salary*1.1 where department='IT' and employees.salary<18000000;
update employees set bonus=500000 where bonus isnull;
--3
select * from employees
where department in ('IT', 'HR') and join_year>2020 and salary+bonus>15000000;
--4
select * from employees
where employees.full_name ilike 'Nguyễn%' or full_name ilike '%Hân';
--5
select distinct employees.department from employees
where bonus is not null;
--6
select * from employees
where join_year between 2019 and 2022;