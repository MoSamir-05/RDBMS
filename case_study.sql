-- -- =========================
-- -- 1. ROLES
-- -- =========================
-- CREATE TABLE roles (
--     id SERIAL PRIMARY KEY,
--     role_name VARCHAR(50) UNIQUE NOT NULL
-- );

-- -- =========================
-- -- 2. PERMISSIONS
-- -- =========================
-- CREATE TABLE permissions (
--     id SERIAL PRIMARY KEY,
--     permission_name VARCHAR(100) UNIQUE NOT NULL
-- );

-- -- =========================
-- -- 3. DEPARTMENTS
-- -- =========================
-- CREATE TABLE departments (
--     id SERIAL PRIMARY KEY,
--     department_name VARCHAR(100) UNIQUE NOT NULL
-- );

-- -- =========================
-- -- 4. AUTHORS
-- -- =========================
-- CREATE TABLE authors (
--     id SERIAL PRIMARY KEY,
--     author_name VARCHAR(150) NOT NULL,
--     bio TEXT
-- );

-- -- =========================
-- -- 5. PUBLISHERS
-- -- =========================
-- CREATE TABLE publishers (
--     id SERIAL PRIMARY KEY,
--     publisher_name VARCHAR(150) NOT NULL,
--     address TEXT,
--     contact VARCHAR(50)
-- );

-- -- =========================
-- -- 6. CATEGORIES
-- -- =========================
-- CREATE TABLE categories (
--     id SERIAL PRIMARY KEY,
--     category_name VARCHAR(100) UNIQUE NOT NULL,
--     description TEXT
-- );

-- -- =========================
-- -- 7. USERS
-- -- =========================
-- CREATE TABLE users (
--     id SERIAL PRIMARY KEY,
--     name VARCHAR(100) NOT NULL,
--     email VARCHAR(100) UNIQUE NOT NULL,
--     phone VARCHAR(20),
--     password VARCHAR(255) NOT NULL,
--     role_id INTEGER REFERENCES roles(id) ON DELETE CASCADE,
--     status BOOLEAN DEFAULT TRUE,
--     created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
-- );

-- -- =========================
-- -- 8. ROLE PERMISSIONS
-- -- =========================
-- CREATE TABLE role_permissions (
--     id SERIAL PRIMARY KEY,
--     role_id INTEGER REFERENCES roles(id) ON DELETE CASCADE,
--     permission_id INTEGER REFERENCES permissions(id) ON DELETE CASCADE
-- );

-- -- =========================
-- -- 9. MEMBERS
-- -- =========================
-- CREATE TABLE members (
--     id SERIAL PRIMARY KEY,
--     user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
--     enrollment_no VARCHAR(50) UNIQUE NOT NULL,
--     department_id INTEGER REFERENCES departments(id),
--     semester INTEGER,
--     membership_date DATE,
--     expiry_date DATE
-- );

-- -- =========================
-- -- 10. BOOKS
-- -- =========================
-- CREATE TABLE books (
--     id SERIAL PRIMARY KEY,
--     title VARCHAR(200) NOT NULL,
--     isbn VARCHAR(50) UNIQUE,
--     category_id INTEGER REFERENCES categories(id),
--     publisher_id INTEGER REFERENCES publishers(id),
--     edition VARCHAR(50),
--     language VARCHAR(50),
--     total_quantity INTEGER DEFAULT 0,
--     created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
-- );

-- -- =========================
-- -- 11. BOOK AUTHORS (Many-to-Many)
-- -- =========================
-- CREATE TABLE book_authors (
--     id SERIAL PRIMARY KEY,
--     book_id INTEGER REFERENCES books(id) ON DELETE CASCADE,
--     author_id INTEGER REFERENCES authors(id) ON DELETE CASCADE
-- );

-- -- =========================
-- -- 12. BOOK COPIES
-- -- =========================
-- CREATE TABLE book_copies (
--     id SERIAL PRIMARY KEY,
--     book_id INTEGER REFERENCES books(id) ON DELETE CASCADE,
--     barcode VARCHAR(100) UNIQUE NOT NULL,
--     status VARCHAR(20) DEFAULT 'available'
-- );

-- -- =========================
-- -- 13. ISSUES
-- -- =========================
-- CREATE TABLE issues (
--     id SERIAL PRIMARY KEY,
--     member_id INTEGER REFERENCES members(id),
--     book_copy_id INTEGER REFERENCES book_copies(id),
--     issue_date DATE NOT NULL,
--     due_date DATE NOT NULL,
--     return_date DATE,
--     issued_by INTEGER REFERENCES users(id),
--     status VARCHAR(20) DEFAULT 'issued'
-- );

-- -- =========================
-- -- 14. RESERVATIONS
-- -- =========================
-- CREATE TABLE reservations (
--     id SERIAL PRIMARY KEY,
--     member_id INTEGER REFERENCES members(id),
--     book_id INTEGER REFERENCES books(id),
--     reservation_date DATE DEFAULT CURRENT_DATE,
--     status VARCHAR(20) DEFAULT 'pending'
-- );

-- -- =========================
-- -- 15. FINES
-- -- =========================
-- CREATE TABLE fines (
--     id SERIAL PRIMARY KEY,
--     issue_id INTEGER REFERENCES issues(id) ON DELETE CASCADE,
--     fine_amount DECIMAL(10,2) NOT NULL,
--     paid_status BOOLEAN DEFAULT FALSE,
--     paid_date DATE
-- );

-- -- =========================
-- -- 16. PAYMENTS
-- -- =========================
-- CREATE TABLE payments (
--     id SERIAL PRIMARY KEY,
--     fine_id INTEGER REFERENCES fines(id) ON DELETE CASCADE,
--     payment_method VARCHAR(50),
--     transaction_id VARCHAR(100),
--     payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
-- );

-- -- =========================
-- -- 17. NOTIFICATIONS
-- -- =========================
-- CREATE TABLE notifications (
--     id SERIAL PRIMARY KEY,
--     user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
--     message TEXT NOT NULL,
--     type VARCHAR(50),
--     status VARCHAR(20) DEFAULT 'pending',
--     sent_at TIMESTAMP
-- );

-- -- =========================
-- -- 18. ACTIVITY LOGS
-- -- =========================
-- CREATE TABLE activity_logs (
--     id SERIAL PRIMARY KEY,
--     user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
--     action VARCHAR(100),
--     description TEXT,
--     created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
-- );
-- -- =========================
-- -- 1. ROLES
-- -- =========================
-- INSERT INTO roles (role_name) VALUES
-- ('Admin'),
-- ('Librarian'),
-- ('Student');

-- -- =========================
-- -- 2. PERMISSIONS
-- -- =========================
-- INSERT INTO permissions (permission_name) VALUES
-- ('Manage Users'),
-- ('Manage Books'),
-- ('Issue Books'),
-- ('Return Books'),
-- ('View Reports');

-- -- =========================
-- -- 3. ROLE PERMISSIONS
-- -- =========================
-- -- Admin → All permissions
-- INSERT INTO role_permissions (role_id, permission_id)
-- SELECT 1, id FROM permissions;

-- -- Librarian → Manage Books + Issue + Return
-- INSERT INTO role_permissions (role_id, permission_id) VALUES
-- (2,2),
-- (2,3),
-- (2,4);

-- -- Student → Issue + Return
-- INSERT INTO role_permissions (role_id, permission_id) VALUES
-- (3,3),
-- (3,4);

-- -- =========================
-- -- 4. DEPARTMENTS
-- -- =========================
-- INSERT INTO departments (department_name) VALUES
-- ('Computer Science'),
-- ('Mechanical Engineering'),
-- ('Commerce'),
-- ('Arts');

-- -- =========================
-- -- 5. USERS
-- -- =========================
-- INSERT INTO users (name, email, phone, password, role_id) VALUES
-- ('Admin User', 'admin@library.com', '9999999991', 'admin123', 1),
-- ('Lib User', 'librarian@library.com', '9999999992', 'lib123', 2),
-- ('Student One', 'student1@library.com', '9999999993', 'stud123', 3);

-- -- =========================
-- -- 6. MEMBERS
-- -- =========================
-- INSERT INTO members (user_id, enrollment_no, department_id, semester, membership_date, expiry_date)
-- VALUES
-- (3, 'CS2024001', 1, 5, CURRENT_DATE, CURRENT_DATE + INTERVAL '1 year');

-- -- =========================
-- -- 7. AUTHORS
-- -- =========================
-- INSERT INTO authors (author_name, bio) VALUES
-- ('Dennis Ritchie', 'Creator of C Language'),
-- ('Bjarne Stroustrup', 'Creator of C++'),
-- ('James Gosling', 'Creator of Java');

-- -- =========================
-- -- 8. PUBLISHERS
-- -- =========================
-- INSERT INTO publishers (publisher_name, address, contact) VALUES
-- ('Pearson', 'New Delhi', '1111111111'),
-- ('McGraw Hill', 'Mumbai', '2222222222');

-- -- =========================
-- -- 9. CATEGORIES
-- -- =========================
-- INSERT INTO categories (category_name, description) VALUES
-- ('Programming', 'Coding related books'),
-- ('Engineering', 'Technical books');

-- -- =========================
-- -- 10. BOOKS
-- -- =========================
-- INSERT INTO books (title, isbn, category_id, publisher_id, edition, language, total_quantity) VALUES
-- ('C Programming', 'ISBN001', 1, 1, '2nd', 'English', 5),
-- ('Java Complete Guide', 'ISBN002', 1, 2, '1st', 'English', 3);

-- -- =========================
-- -- 11. BOOK AUTHORS
-- -- =========================
-- INSERT INTO book_authors (book_id, author_id) VALUES
-- (1,1),
-- (2,3);

-- -- =========================
-- -- 12. BOOK COPIES
-- -- =========================
-- INSERT INTO book_copies (book_id, barcode) VALUES
-- (1,'BCODE001'),
-- (1,'BCODE002'),
-- (2,'BCODE003');

-- -- =========================
-- -- 13. ISSUE RECORD
-- -- =========================
-- INSERT INTO issues (member_id, book_copy_id, issue_date, due_date, issued_by)
-- VALUES
-- (1,1,CURRENT_DATE, CURRENT_DATE + INTERVAL '7 days',2);

-- -- =========================
-- -- 14. RESERVATION
-- -- =========================
-- INSERT INTO reservations (member_id, book_id)
-- VALUES
-- (1,2);

-- -- =========================
-- -- 15. FINE
-- -- =========================
-- INSERT INTO fines (issue_id, fine_amount)
-- VALUES
-- (1, 50.00);

-- -- =========================
-- -- 16. PAYMENT
-- -- =========================
-- INSERT INTO payments (fine_id, payment_method, transaction_id)
-- VALUES
-- (1,'UPI','TXN123456');
SELECT * FROM users;
SELECT * FROM books;
SELECT * FROM issues;