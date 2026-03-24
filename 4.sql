create table products(
    id serial primary key ,
    name varchar(50),
    category varchar(50),
    price bigint,
    stock int,
    manufacturer varchar(50)
);

insert into products(name, category, price, stock, manufacturer) values
('Laptop Dell XPS 13','Laptop',25000000,12,'Dell'),
('Chuột Logitech', 'Phụ kiện',150000,50,'Logitech'),
('Bàn phiím Razer','Phụ kiện',220000,0,'Razer'),
('Macbook Air M2','Laptop',32000000,7,'Apple'),
('Iphone 14 Pro Max','Điện thoại',35000000,15,'Apple'),
('Laptop Dell XPS 13','Laptop',25000000,12,'Dell'),
('Tai nghe AirPods 3','Phụ kiện',4500000,NULL,'Apple');

--1
insert into products(name, category, price, stock, manufacturer) values ('Chuột không dây Logitech M170','Phụ kiện',300000,20,'Logitech');
--2
update products
set price=price*1.1
where manufacturer='Apple';
--3
delete
from products
where stock=0;
--4
select *
from products
where price between 1000000 and 30000000;
--5
select *
from products
where stock is null;
--6
select distinct products.manufacturer
from products;
--7
select *
from products
order by price desc, name asc;
--8
select *
from products
where name ilike '%laptop%';
--9
select *
from products
order by price desc
limit 2;
