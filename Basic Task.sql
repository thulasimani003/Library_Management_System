select * from employees;
select * from books;
select * from issued_status;
select * from return_status;
SELECT * FROM branch;
select * from members;

-- TASK

--  Task 1. Create a New Book Record -- "978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')"
insert into books values('978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.');

--  Task 2: Update an Existing Member's Address
update members
set member_address='154 Main St'
where member_id='C101';

-- Task 3: Delete a Record from the Issued Status Table 
-- Objective: Delete the record with issued_id = 'IS121' from the issued_status table.

delete from issued_status
where issued_id = 'IS121';

-- Task 4: Retrieve All Books Issued by a Specific Employee 
-- Objective: Select all books issued by the employee with emp_id = 'E101'.

select * from issued_status
where issued_emp_id='E101';

-- - Task 5: List Members Who Have Issued More Than One Book 
-- Objective: Use GROUP BY to find members who have issued more than one book.
select ist.issued_emp_id,e.emp_name from issued_status ist join 
employees e on
 ist.issued_emp_id=e.emp_id
group by ist.issued_emp_id,e.emp_name having count(ist.issued_emp_id)>1;

-- CTAS
-- Task 6: Create Summary Tables: Used CTAS to generate new tables based on query results - each book and total book_issued_cnt**
CREATE TABLE book_counts
AS    
SELECT 
   b.isbn,b.book_title,count(ist.issued_id) as Total_issued_books
   from books b join issued_status ist on b.isbn=ist.issued_book_isbn
   group by 1,2 ;
   
select * from book_counts;

-- Task 7. Retrieve All Books in a Specific Category:
select * from books
 where category='Classic';
 
 -- Task 8: Find Total Rental Income by Category:
  select b.category,sum(b.rental_price) as total_rental_income,count(*) as total_count from books b 
  join 
  issued_status ist on b.isbn=ist.issued_book_isbn
  group by b.category;
  
-- task 9:List Members Who Registered in the Last 180 Days:
INSERT INTO members(member_id, member_name, member_address, reg_date)
VALUES
('C201', 'sam', '145 Main St', '2025-02-01'),
('C202', 'john', '133 Main St', '2025-01-01'); 
select * from members
where reg_date>=curdate()-interval 180 day;
  
-- task 10 List Employees with Their Branch Manager's Name and their branch details:
select e1.*,b.manager_id,e2.emp_name as manager_name from employees e1 
join branch b on
e1.branch_id=b.branch_id
join employees e2 on 
b.manager_id=e2.emp_id;

-- Task 11. Create a Table of Books with Rental Price Above a Certain Threshold 7USD:
create table book_price_above_7USD
as
select * from books 
where rental_price>7;
select * from book_price_above_7USD;

-- Task 12: Retrieve the List of Books Not Yet Returned
select distinct ist.issued_book_name from issued_status ist 
left join return_status r on ist.issued_id=r.issued_id
where r.issued_id is null;


