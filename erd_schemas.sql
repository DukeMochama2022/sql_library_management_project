-- Library Management System Project 2

-- create branch table
DROP TABLE IF EXISTS branch;
CREATE TABLE branch
(
	branch_id VARCHAR(10) PRIMARY KEY,
	manager_id VARCHAR(10),
	branch_address VARCHAR(50),
	contact_no VARCHAR(10)
);

ALTER TABLE branch
ALTER COLUMN contact_no TYPE VARCHAR(25);

-- create employees table
DROP TABLE IF EXISTS employees;
CREATE TABLE employees
(
	emp_id	VARCHAR(10) PRIMARY KEY,
	emp_name VARCHAR(50),	
	position	VARCHAR(20),
	salary	DECIMAL(10,2),
	branch_id VARCHAR(25)
);

-- craete table boooks
DROP TABLE IF EXISTS books;
CREATE TABLE books
(
	isbn VARCHAR(20) PRIMARY KEY,
	book_title VARCHAR(75),
	category VARCHAR(10),	
	rental_price FLOAT,
	status	VARCHAR(15),
	author VARCHAR(25),
	publisher VARCHAR(55)
);
ALTER TABLE books
ALTER COLUMN category TYPE VARCHAR(50);

-- create table members
DROP TABLE IF EXISTS members;
CREATE TABLE members
(
	member_id VARCHAR(20) PRIMARY KEY,
	member_name	VARCHAR(20),
	member_address VARCHAR(30),
	reg_date DATE
);

-- create table issue_status
DROP TABLE IF EXISTS issued_status;
CREATE TABLE issued_status
(
	issued_id VARCHAR(10) PRIMARY KEY,
	issued_member_id VARCHAR(10), --fk
	issued_book_name VARCHAR(70),
	issued_date DATE,
	issued_book_isbn VARCHAR(20), --fk
	issued_emp_id VARCHAR(10) --fk
);

-- create table issued_return
DROP TABLE IF EXISTS return_status;
CREATE TABLE return_status
(
return_id VARCHAR(10) PRIMARY KEY,
issued_id VARCHAR(10),
return_book_name VARCHAR(75),
return_date DATE,
return_book_isbn VARCHAR(20)
);

-- foreign key
ALTER TABLE issued_status
ADD CONSTRAINT fk_members
FOREIGN KEY (issued_member_id)
REFERENCES members(member_id);

ALTER TABLE issued_status
ADD CONSTRAINT fk_employees
FOREIGN KEY (issued_emp_id)
REFERENCES employees(emp_id);

ALTER TABLE issued_status
ADD CONSTRAINT fk_books
FOREIGN KEY (issued_book_isbn )
REFERENCES books(isbn);

ALTER TABLE employees
ADD CONSTRAINT fk_branch
FOREIGN KEY (branch_id )
REFERENCES branch(branch_id);

ALTER TABLE return_status
ADD CONSTRAINT fk_issued_status
FOREIGN KEY (issued_id)
REFERENCES issued_status(issued_id);


