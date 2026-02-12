-- create table company(
-- id int not null generated always as identity primary key,
-- name varchar(20) not null,
-- age int not null,
-- address char(25),
-- salary decimal(10,2) default 10000.00,
-- join_date date default current_date
-- );

-- insert into company(name,age,address,salary)values
-- ('paul',32,'california',20000),
-- ('sam',23,'bharuch',50000),
-- ('kaif',20,'jambusar',40000),
-- ('sakib',26,'bharuch',45000),
-- ('hujaifa',20,'japan',70000);

-- create table deparment (
-- id int not null generated always as identity primary key,
-- dept char(50) not null,
-- emp_id int not null,
-- foreign key (emp_id) references company(id)
-- );

-- insert into deparment (dept,emp_id)values
-- ('IT',001),
-- ('HR',002),
-- ('FINANCE',003);

-- SELECT * FROM deparment join company on deparment.emp_id=company.id;
-- SELECT * FROM deparment full join company on deparment.emp_id=company.id;