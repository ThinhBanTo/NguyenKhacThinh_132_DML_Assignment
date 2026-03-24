select * from products where price between 500000 and 5000000;

-- 3. tìm khách hàng chưa có số điện thoại
select * from customers where phone is null;

-- 4. top 5 sản phẩm có giá cao nhất
select * from products order by price desc limit 5;

-- 5. phân trang đơn hàng (trang 2, mỗi trang 3 bản ghi)
select * from orders order by order_date desc limit 3 offset 3;

-- 6. đếm số khách hàng theo thành phố (dùng distinct, lưu lại là total_customers thay vì count)
select city, count(distinct customer_id) as total_customers
from customers
group by city;

-- 7. tìm đơn hàng trong khoảng thời gian
select * from orders
where order_date between '2024-01-01' and '2024-02-29';

-- 8. Sản phẩm chưa được bán (Sử dụng NOT EXISTS)
--tạo bảng order_details bẻ quan hệ n-m (products-orders)
create table order_details (
  order_id int not null references orders,
    product_id int not null references products,
    primary key (order_id,product_id)
);
--insert du lieu cho no
insert into order_details (order_id, product_id) values
           (1, 1),
           (2, 4);
--not exist cho product voi order_details
select *
from products p
where not exists (
    select 1
    from order_details od
    where od.product_id = p.product_id
);