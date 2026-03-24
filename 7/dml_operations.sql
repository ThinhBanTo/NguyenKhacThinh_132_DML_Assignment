--1:insert
INSERT INTO customers (full_name, email, phone, city, join_date) VALUES
                                                                     ('Nguyen Van A', 'a.nguyen@gmail.com', '0912345678', 'Hanoi', '2023-01-10'),
                                                                     ('Tran Thi B', 'b.tran@gmail.com', '0987654321', 'HCM', '2023-02-15'),
                                                                     ('Le Van C', 'c.le@gmail.com', NULL, 'Danang', '2023-03-20'),
                                                                     ('Pham Thi D', 'd.pham@gmail.com', '0905111222', 'Hanoi', '2023-04-05'),
                                                                     ('Hoang Van E', 'e.hoang@gmail.com', NULL, 'Can Tho', '2023-05-12'),
                                                                     ('Vu Thi F', 'f.vu@gmail.com', '0933444555', 'HCM', '2023-06-18'),
                                                                     ('Dang Van G', 'g.dang@gmail.com', '0977888999', 'Hanoi', '2023-07-22'),
                                                                     ('Bui Thi H', 'h.bui@gmail.com', '0966555444', 'Haiphong', '2023-08-30'),
                                                                     ('Doan Van I', 'i.doan@gmail.com', '0944333222', 'Danang', '2023-09-14'),
                                                                     ('Phan Ngoc Han', 'han.phan@gmail.com', '0922111000', 'Hue', '2023-10-01');


INSERT INTO products (product_name, category, price, stock_quantity) VALUES
                                                                         ('iPhone 15', 'Electronics', 25000000, 10),
                                                                         ('Samsung S23', 'Electronics', 20000000, 5),
                                                                         ('Macbook M3', 'Electronics', 35000000, 0), -- Hết hàng để test DELETE
                                                                         ('Sony Headphone', 'Electronics', 5000000, 15),
                                                                         ('Dell XPS', 'Electronics', 30000000, 3),
                                                                         ('T-Shirt', 'Fashion', 300000, 50),
                                                                         ('Jeans', 'Fashion', 600000, 40),
                                                                         ('Sneakers', 'Fashion', 1200000, 20),
                                                                         ('Jacket', 'Fashion', 800000, 0), -- Hết hàng để test DELETE
                                                                         ('Dress', 'Fashion', 500000, 25),
                                                                         ('Dining Table', 'Home', 4500000, 5),
                                                                         ('Sofa', 'Home', 12000000, 2),
                                                                         ('Desk Lamp', 'Home', 350000, 30),
                                                                         ('Curtain', 'Home', 250000, 100),
                                                                         ('Bed Frame', 'Home', 7000000, 4);


INSERT INTO orders (customer_id, order_date, total_amount, status) VALUES
                                                                       (1, '2024-01-05', 25000000, 'CONFIRMED'),
                                                                       (2, '2024-01-10', 1200000, 'PENDING'),
                                                                       (4, '2024-02-12', 300000, 'SHIPPED'),
                                                                       (6, '2024-02-15', 20000000, 'PENDING'),
                                                                       (1, '2024-03-01', 5000000, 'CONFIRMED'),
                                                                       (7, '2024-03-05', 600000, 'CANCELLED'),
                                                                       (9, '2024-03-10', 350000, 'PENDING'),
                                                                       (10, '2024-03-15', 500000, 'SHIPPED');

--2:update
update products
set price=price*1.1
where category='Electronics';

update customers
set phone='0123456789'
where email='c.le@gmail.com';

update orders
set status='CONFIRMEND'
where status='PENDING';
--3: delete
delete
from products
where stock_quantity=0;

delete
from customers
where customer_id not in(
    select distinct customer_id
    from orders
);



