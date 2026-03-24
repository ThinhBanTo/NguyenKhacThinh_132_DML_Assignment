create table books(
    id serial primary key ,
    title varchar(50),
    author varchar(50),
    category char(4),
    publish_year int,
    price bigint,
    stock int
);

insert into books(title, author, category, publish_year, price, stock) values
('Lập trình C cơ bản','Nguyễn Văn Nam','CNTT',2018,95000,20),
('Học SQL qua ví dụ','Trần Thị Hạnh','CSDL',2020,125000,12),
('Lập trình C cơ bản','Nguyễn Văn Nam','CNTT',2018,95000,20),
('Phân tích dữ liệu với Python','Lê Quốc Bảo','CNTT',2022,180000,null),
('Quản trị cơ sở dữ liệu','Nguyễn Thị Minh','CSDL',2021,150000,5),
('Học máy cho người mới bắt đầu','Nguyễn Văn Nam','AI',2023,220000,8),
('Khoa học dữ liệu cơ bản','Nguyễn Văn Nam','AI',2023,220000,null);

--1
delete from books
where id not in(
    select min(id) from books
    group by title,author,publish_year
);
--2
update books
set price=price*1.1
where publish_year >=2021 and books.price<200000;
--3
update books
set stock=0
where stock isnull;
--4
--4.a:
select * from books
where category in ('CNTT','AI') and price between 100000 and 250000;
--4.b:
select * from books
order by price desc, title asc;
--5
select * from books
where title ilike '%học%';
--6
select distinct books.category from books
where publish_year>2020 and stock>0;
--7
select * from books
limit 2 offset 1;