-- 1. tạo cấu trúc bảng
create table customers (
                           customer_id serial primary key,
                           full_name varchar(100) not null,
                           email varchar(100) unique not null,
                           phone varchar(20),
                           city varchar(50),
                           join_date date default current_date
);

create table products (
                          product_id serial primary key,
                          product_name varchar(100) not null,
                          category varchar(50),
                          price decimal(15, 2),
                          stock_quantity int
);

create table orders (
                        order_id serial primary key,
                        customer_id int references customers(customer_id),
                        order_date date,
                        total_amount decimal(15, 2),
                        status varchar(20) default 'pending'
);

-- 2. insert 10 khách hàng
insert into customers (full_name, email, phone, city, join_date) values
                                                                     ('nguyen van thinh', 'thinh.ptit@gmail.com', '0912345678', 'hanoi', '2023-01-10'),
                                                                     ('tran thi mai', 'mai.tran@gmail.com', '0987654321', 'hcm', '2023-02-15'),
                                                                     ('le quoc trung', 'trung.le@gmail.com', null, 'danang', '2023-03-20'),
                                                                     ('pham ngoc han', 'han.pham@gmail.com', '0905111222', 'hanoi', '2023-04-05'),
                                                                     ('hoang van duc', 'duc.hoang@gmail.com', null, 'can tho', '2023-05-12'),
                                                                     ('vu thi lan', 'lan.vu@gmail.com', '0933444555', 'hcm', '2023-06-18'),
                                                                     ('dang huu tai', 'tai.dang@gmail.com', '0977888999', 'hanoi', '2023-07-22'),
                                                                     ('bui thi thuy', 'thuy.bui@gmail.com', '0966555444', 'haiphong', '2023-08-30'),
                                                                     ('doan van hau', 'hau.doan@gmail.com', '0944333222', 'danang', '2023-09-14'),
                                                                     ('nguyen thi hoa', 'hoa.nguyen@gmail.com', '0922111000', 'hue', '2023-10-01');

-- 3. insert 15 sản phẩm (electronics, fashion, home)
insert into products (product_name, category, price, stock_quantity) values
                                                                         ('iphone 15 pro', 'electronics', 28000000, 10),
                                                                         ('samsung s24 ultra', 'electronics', 26000000, 5),
                                                                         ('macbook air m3', 'electronics', 32000000, 0), -- để test delete stock=0
                                                                         ('sony wh-1000xm5', 'electronics', 7000000, 15),
                                                                         ('logitech mx master 3', 'electronics', 2500000, 20),
                                                                         ('polo t-shirt', 'fashion', 450000, 50),
                                                                         ('levis 501 jeans', 'fashion', 1500000, 40),
                                                                         ('nike air jordan', 'fashion', 4500000, 12),
                                                                         ('adidas hoodie', 'fashion', 1200000, 0), -- để test delete stock=0
                                                                         ('gucci belt', 'fashion', 9000000, 5),
                                                                         ('gaming desk', 'home', 3500000, 8),
                                                                         ('ergonomic chair', 'home', 5500000, 6),
                                                                         ('smart bedside lamp', 'home', 850000, 30),
                                                                         ('blackout curtain', 'home', 600000, 100),
                                                                         ('memory foam pillow', 'home', 1200000, 25);

-- 4. insert 8 đơn hàng (với các trạng thái khác nhau)
insert into orders (customer_id, order_date, total_amount, status) values
                                                                       (1, '2024-01-15', 28000000, 'confirmed'),
                                                                       (2, '2024-01-20', 4500000, 'pending'),
                                                                       (4, '2024-02-05', 7000000, 'shipped'),
                                                                       (6, '2024-02-10', 900000, 'pending'),
                                                                       (1, '2024-02-25', 2500000, 'confirmed'),
                                                                       (7, '2024-03-05', 1500000, 'cancelled'),
                                                                       (9, '2024-03-12', 3500000, 'pending'),
                                                                       (3, '2024-03-18', 850000, 'shipped');
