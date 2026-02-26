-- insert data from table
-- ====================================
-- DATA INSERT IN DEPARTMENTS TABLE 
-- ====================================
-- INSERT INTO departments (department_name) VALUES
-- ('Computer'),
-- ('Mechanical'),
-- ('Civil'),
-- ('Electrical'),
-- ('IT'),
-- ('Chemical'),
-- ('Automobile'),
-- ('AI'),
-- ('Data Science'),
-- ('Business');
-- select * from departments;


-- ======================================
-- INSERT DATA FROM categories TABLE
-- ======================================
-- INSERT INTO categories (category_name) VALUES
-- ('Database'),
-- ('Networking'),
-- ('AI'),
-- ('Maths'),
-- ('Physics'),
-- ('Chemistry'),
-- ('Management'),
-- ('History'),
-- ('English');
-- SELECT * FROM categories;


-- =================================
-- INSERT DATA FROM authors TABLE
-- =================================
-- INSERT INTO authors (author_name) VALUES
-- ('Dennis Ritchie'),
-- ('James Gosling'),
-- ('Bjarne Stroustrup'),
-- ('Guido Rossum'),
-- ('E F Codd'),
-- ('Andrew Tanenbaum'),
-- ('Stuart Russell'),
-- ('Thomas H Cormen'),
-- ('Robert Kiyosaki'),
-- ('William Shakespeare');
-- select * from authors;


-- ===================================
-- INSERT DATA FROM publishers TABLE
-- ===================================
-- INSERT INTO publishers (publisher_name) VALUES
-- ('Pearson'),
-- ('McGraw Hill'),
-- ('Oxford'),
-- ('Cambridge'),
-- ('Springer'),
-- ('Wiley'),
-- ('BPB'),
-- ('OReilly'),
-- ('S Chand'),
-- ('Penguin');
-- select * from publishers;


-- ===================================
-- INSERT DATA FROM users TABLE
-- ===================================
-- INSERT INTO users (name,email,password,role_id) VALUES
-- ('Samir','samir@gmail.com','123',1),
-- ('Rahul','rahul@gmail.com','123',2),
-- ('Amit','amit@gmail.com','123',3),
-- ('Riya','riya@gmail.com','123',3),
-- ('Kiran','kiran@gmail.com','123',3),
-- ('Neha','neha@gmail.com','123',3),
-- ('Arjun','arjun@gmail.com','123',3),
-- ('Priya','priya@gmail.com','123',3),
-- ('Manish','manish@gmail.com','123',2),
-- ('Sneha','sneha@gmail.com','123',3);
-- SELECT * FROM users;


-- ================================
-- INSERT DATA FROM books TABLE
-- ================================
-- INSERT INTO books (title,category_id,publisher_id,total_quantity) VALUES
-- ('C Programming',1,1,10),
-- ('Java Basics',1,2,15),
-- ('C++ Guide',1,3,12),
-- ('Python Mastery',1,4,20),
-- ('DBMS Concepts',2,5,18),
-- ('Networking Basics',2,6,9),
-- ('AI Modern Approach',4,7,14),
-- ('Data Structures',5,8,11),
-- ('Rich Dad Poor Dad',8,9,25),
-- ('Hamlet',10,10,8);
-- SELECT * FROM books;


-- ==============
-- DQL COMMAND
-- ==============
-- SELECT * FROM users
-- WHERE status = TRUE;



-- ============
-- BETWEEN
-- ============
-- SELECT * FROM books
-- WHERE total_quantity BETWEEN 5 AND 50;


-- ===========
-- JOIN
-- ===========
-- SELECT books.title, categories.category_name
-- FROM books
-- INNER JOIN categories
-- ON books.category_id = categories.id;


-- ============
-- LEFT JOIN
-- ============
SELECT users.name, roles.role_name
FROM users
LEFT JOIN roles
ON users.role_id = roles.id;