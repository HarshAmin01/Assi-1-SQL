-- Creating a users table
create table users(
	user_id int primary key,
	username varchar(50) not null,
	email varchar(100) not null unique,
	password varchar(16) not null
);

-- showing a user table
select * from users

-- Creating a products table
create table products(
	product_id int primary key,
	product_name varchar(100) not null,
	description text,
	price decimal(10,2) not null
);

-- Showing the products table
select * from products

-- Creating a orders table
create table orders(
	order_id int primary key,
	user_id int references users(user_id) on delete cascade,
	product_id int references products(product_id) on delete cascade,
	quantity int not null default 1
);

-- showing orders table
select * from orders

-- inserting data into users 

insert into users (username, email, password)
values ('harsh', 'harsh12@gmail.com', 'psd123'),
 	   ('Jai', 'jai12@gmail.com', 'psd123'),
		('joy', 'joy12@gmail.com', 'psd123'),
		('smith', 'smith12@gmail.com', 'psd123')

-- dropping products table to change the column details whcih contains the primary key
drop table products cascade

-- creating the products table with autopgenerated ids for product id
create table products(
	product_id int generated always as identity primary key,
	product_name varchar(100) not null,
	description text,
	price decimal(10,2) not null,
	stock int not null default 0
);

select * from products

-- inserting data into products
insert into products(product_name, description, price, stock)
values ('T-shirt', 'very comfortable', 20.00, 20),
		('Jeans', 'affordable', 60.00, 10),
		('shoes', 'very elegant', 20.00, 20),
		('shirt', 'dashing', 30.00, 20)

-- dropping orders table to change the column details whcih contains the primary key
drop table orders cascade

-- creating the orders table with autopgenerated ids for oders id
create table orders(
	order_id int generated always as identity primary key,
	user_id int references users(user_id) on delete cascade,
	product_id int references products(product_id) on delete cascade,
	quantity int not null default 1
);

select * from orders

-- inserting values to orders table
insert into orders (user_id, product_id, quantity)
values ( 1,1, 4),
		(2,1,3),
		(3,2, 2),
		(4,3, 1),
		(3,1, 2)

-- showing username and emails from users table
select username, email from users

-- checking products stock is more than 10 items
select * from products
where stock >=10

-- inserting more products to products table
insert into products(product_name, description, price, stock)
values ('wallet', 'nice', 5.00, 5),
		('watch', 'smart', 30.00, 2),
		('phone case', 'strong', 15.00, 5)

-- checking products that are cheaper than 20$
select * from products
where price <= 20


select product_name, price, stock from products
where price <= 20

select * from orders

-- checking orders with product id 1
select * from orders
where product_id = 1

-- checking orders with more than 2 items
select * from orders
where quantity > 2

-- getting the details of users and their orders
select u.user_id, u.username, o.order_id, o.quantity 
from users u
join orders o on u.user_id = o.user_id

-- Getting the total number of orders placed by each users
select u.user_id, u.username, count(o.order_id) as total_orders
from users u
left join orders o on u.user_id = o.user_id
group by u.user_id, u.username

-- getting total revenue generated from orders
select sum(p.price * o.quantity) As total_revenue
from orders o
join products p on p.product_id = o.product_id

-- getting total revenue generated from each product
select p.product_id, p.product_name, sum(p.price * o.quantity) As total_revenue
from orders o
join products p on p.product_id = o.product_id
group by p.product_id

-- creating a view of user order summary
create view order_summary as
select u.user_id, u.username, count(o.order_id) as total_orders
from users u
left join orders o on u.user_id = o.user_id
group by u.user_id, u.username

select * from order_summary

-- getting stock details
select product_id, product_name, stock
from products

-- total quantity of items sold by each product
select p.product_id, p.product_name, sum(o.quantity) as total_sold
from products p
join orders o on o.product_id = p.product_id
group by p.product_id, p.product_name
order by total_sold desc

-- total amount spent by each user
select u.user_id, u.username, sum(p.price * o.quantity) as total_amount
from users u
join orders o on u.user_id = o.user_id
join products p on p.product_id = o.product_id
group by u.user_id, u.username
order by total_amount desc
 
























