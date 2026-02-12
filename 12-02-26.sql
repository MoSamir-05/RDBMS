
-- create table customers(cust_id int generated always as identity primary key,cust_name varchar(15) not null,cust_email varchar(15) not null);
-- create table orders(order_id serial primary key,order_date date not null,order_amount decimal(10,2),cust_id int not null,foreign key(cust_id) references customer(cust_id));
-- insert into customers(cust_name,cust_email) values('Alice','Alice@gamil.com'),('Bob','bob12@gamil.com'),('Luke','lukee@gamil.com'),('Mark','mark@gamil.com');
-- insert into customers(cust_name,cust_email) values('Jonnaa','Jona@gamil.com');
CREATE TABLE emp (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    salary DECIMAL(10,2),
    joindt DATE,
    dept VARCHAR(30)
);


-- INSERT INTO emp (emp_id, name, salary, joindt, dept) VALUES
-- (1, 'Rahul Sharma', 12000.00, '2022-01-15', 'IT'),
-- (2, 'Priya Singh', 9500.00, '2021-03-20', 'HR'),
-- (3, 'Amit Verma', 15000.00, '2020-07-11', 'Finance'),
-- (4, 'Neha Gupta', 11000.00, '2023-02-01', 'IT'),
-- (5, 'Vikas Rao', 8000.00, '2019-09-18', 'Sales'),
-- (6, 'Sneha Iyer', 13000.00, '2022-11-25', 'HR'),
-- (7, 'Arjun Mehta', 7000.00, '2021-06-30', 'Sales'),
-- (8, 'Kavita Joshi', 17000.00, '2020-12-10', 'Finance'),
-- (9, 'Rohit Das', 10500.00, '2023-04-05', 'IT'),
-- (10, 'Anjali Nair', 9800.00, '2022-08-14', 'HR'),
(11,'kajal',15500,'2023-08-11','IT');
