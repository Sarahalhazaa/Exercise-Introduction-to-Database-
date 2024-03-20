create database store;

create table countries(
    code int primary key ,
    name varchar(20)  unique  ,
   continent_name varchar(20) not null
);

select * from countries;

create table users(
    id int primary key ,
    full_name varchar(20)   ,
    email varchar(20)  unique ,
    gender char(1) check ( gender='m' or gender='f'),
   date_of_birth varchar(15),
    created_at datetime,
    country_code int,
      foreign key (country_code) references countries(code)
);

select * from users;

create table orders(
    id int primary key ,
    status varchar(6) check (status  ='start' or status ='finish' ),
     created_at datetime,
        user_id int,
   foreign key (user_id) references users(id)

);

select * from orders;

create table products(
    id int primary key ,
    name varchar(10)  not null  ,
    price int default 0,
    status varchar(6) check (status  ='valid' or status ='expired' ),
     created_at datetime
);

select * from products;

create table order_products(
    order_id int  ,
    product_id int ,
    quantity int  ,
     foreign key (order_id) references orders(id),
     foreign key (product_id) references products(id)
);

select * from order_products;


alter table users modify column created_at timestamp default current_timestamp ;
alter table orders modify column created_at timestamp default current_timestamp;
alter table products modify column created_at timestamp default current_timestamp;


insert into countries values (1,'riyadh','saudi');
select * from countries;
insert into users(id, full_name, email, gender, date_of_birth, created_at, country_code) values (1,'mahaalhazaa','maha@gmail.com','m','2000/6/20',default,1);
select * from users;
insert into orders(id, status, created_at, user_id) values (1,'start',default,1);
select * from orders;
insert into products(id, name, price, status, created_at) values (1,'techt',200,'valid',default);
select * from products;
insert into order_products values (1,1,3);
select * from order_products;

