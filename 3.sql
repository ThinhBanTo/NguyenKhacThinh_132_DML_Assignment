create table students(
    id serial primary key ,
    full_name varchar(20),
    gender char(10) check(gender in ('Nam','Nữ')),
    birth_year int,
    major varchar(50),
    gpa numeric(2,1)
);

insert into students(full_name, gender, birth_year, major, gpa) values
('Nguyễn Văn A','Nam',2002,'CNTT',3.6),
('Trần Thị Bích Ngọc','Nữ',2001,'Kinh tế',3.2),
('Lê Quốc Cường','Nam',2003,'CNTT',2.7),
('Phạm Minh Anh','Nữ',2000,'Luật',3.9),
('Nguyễn Văn A','Nam',2002,'CNTT',3.6),
('Lưu Đức Tài','Nam',2004,'Cơ khí',NULL),
('Võ Thị Thu Hằng','Nữ',2001,'CNTT',3.0);

--1
insert into students(full_name, gender, birth_year, major, gpa) values ('Phan Hoàng Nam','Nam',2003,'CNTT',3.8);
--2
update students
set gpa=3.4
where students.full_name='Lê Quốc Cường';
--3
delete
from students
where gpa is null;
--4
select *
from students
where gpa>=3.0
limit 3;
--5
select distinct students.major
from students;
--6
select *
from students
order by gpa desc,full_name asc;
--7
select *
from students
where full_name ilike 'Nguyễn%';
--8
select *
from students
where birth_year between 2001 and 2003;