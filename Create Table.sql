create database Library_Management_System;
use Library_Management_System;

create table branch(
branch_id varchar(30) primary key,
manager_id varchar(30),
branch_address varchar(60),
contact_no varchar(30));
create table books(
isbn varchar(50) primary key,
book_title varchar(50),
category varchar(50),
rental_price decimal(10,2),
status varchar(50),
author varchar(50),	
publisher varchar(50));

CREATE table members(
member_id varchar(50) primary key,
member_name varchar(50),
member_address varchar(50),
reg_date date);

create table return_status(
return_id VARCHAR(10) PRIMARY KEY,
            issued_id VARCHAR(30),
            return_book_name VARCHAR(80),
            return_date DATE,
            return_book_isbn VARCHAR(50),
            FOREIGN KEY (return_book_isbn) REFERENCES books(isbn));
            
create table employees(emp_id varchar(30) primary key,
	emp_name varchar(30),
	position varchar(30),
	salary decimal(10,2),
	branch_id varchar(30),
    foreign key (branch_id) references branch(branch_id));
            
create table issued_status(
issued_id varchar(30) primary key,
issued_member_id varchar(30),
issued_book_name varchar(30),
issued_date date,
issued_book_isbn varchar(30),
issued_emp_id varchar(30),
foreign key (issued_member_id) references members(member_id),
foreign key (issued_book_isbn) references books(isbn),
foreign key (issued_emp_id) references employees(emp_id)
);




    
    
