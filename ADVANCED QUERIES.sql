use library_management_system;
SELECT * FROM books;
SELECT * FROM branch;
SELECT * FROM employees;
SELECT * FROM issued_status;
SELECT * FROM members;
SELECT * FROM return_status;
/*
Task 13: 
Identify Members with Overdue Books
Write a query to identify members who have overdue books (assume a 30-day return period). 
Display the member's_id, member's name, book title, issue date, and days overdue.
*/

-- issued_status == members == books == return_status
-- filter books which is return
-- overdue > 30 

select m.member_id,m.member_name,i.issued_book_name as book_title,i.issued_date,
datediff(current_date,i.issued_date) as overdue_days
from members m join issued_status i on m.member_id=i.issued_member_id left join
return_status r on i.issued_id=r.issued_id
where return_date is null and datediff(current_date,i.issued_date)>30
order by 1;

/*    
Task 14: Update Book Status on Return
Write a query to update the status of books in the books table to "Yes" 
when they are returned (based on entries in the return_status table).
*/
-- MANUAL CHECKING
SELECT * FROM issued_status
WHERE issued_book_isbn = '978-0-330-25864-8';

SELECT * FROM books
WHERE isbn = '978-0-451-52994-2';

update books
set status='no'
where isbn='978-0-451-52994-2';

SELECT * FROM return_status
WHERE return_book_isbn = '978-0-451-52994-2';


-- Stored Proc
delimiter $$
create procedure add_return_records(
in p_return_id varchar(10),
in p_issued_id varchar(10),
in p_book_Quality varchar(20))

begin
Declare v_isbn varchar(80);
Declare v_book_name varchar(80);

insert into return_status (return_id,issued_id,return_date,book_Quality) 
values (p_return_id,p_issued_id,curdate(),p_book_Quality);

select issued_book_isbn,issued_book_name into 
v_isbn,V_book_name from issued_status 
where issued_id=p_issued_id;

update books
set status='yes'
where isbn=v_isbn;

select concat('Thankyou for returning the book:',v_book_name) as Message;

end ;

-- TESTING THE PROCEDURE
SELECT * FROM books
WHERE isbn = '978-0-307-58837-1';

SELECT * FROM issued_status
WHERE issued_book_isbn = '978-0-307-58837-1';

SELECT * FROM return_status
WHERE issued_id = 'IS135';

-- ADDING RECORDS BY CALLING THE STORED PROCEDURE
call add_return_records('RS139','IS135','Good');


/*
Task 15: Branch Performance Report
Create a query that generates a performance report for each branch, 
showing the number of books issued, the number of books returned, 
and the total revenue generated from book rentals.
*/
create table Branch_Performance as
Select b.branch_id,b.manager_id,count(i.issued_id) as total_books_issued,
count(r.return_id) as total_book_returned,sum(bk.rental_price) as Total_price
from branch b join employees e on b.branch_id=e.branch_id join issued_status i on e.emp_id=i.issued_emp_id
left join return_status r on i.issued_id=r.issued_id join books bk on i.issued_book_isbn=bk.isbn 
group by 1,2;

drop table Branch_Performance;
select * from Branch_Performance;


-- Task 16: CTAS: Create a Table of Active Members
-- Use the CREATE TABLE AS (CTAS) statement to 
-- create a new table active_members containing members who have issued at least one book in the last 2 months.
create table active_member as
SELECT * FROM members WHERE member_id IN (SELECT 
                        DISTINCT issued_member_id   
                    FROM issued_status
                    WHERE 
                        issued_date >= CURRENT_DATE - INTERVAL 2 month
                    );
select * from active_member;


/*
Task 17: Find Employees with the Most Book Issues Processed
Write a query to find the top 3 employees
 who have processed the most book issues. 
 Display the employee name, number of books processed, and their branch.
*/

select e.emp_name,b.* ,count(issued_id) as total_issued_book from employees e 
join issued_status i on e.emp_id=i.issued_emp_id join branch b on e.branch_id=b.branch_id group by 1,2
order by total_issued_book desc limit 3 ;


/*
Task 18: Stored Procedure Objective: 
Create a stored procedure to manage the status of books in a library system. 
description: Write a stored procedure that updates the status of a book in the library based on its issuance. 
The procedure should function as follows: 
The stored procedure should take the book_id as an input parameter. 
The procedure should first check if the book is available (status = 'yes'). 
If the book is available, it should be issued, and the status in the books table should be updated to 'no'. 
If the book is not available (status = 'no'), 
the procedure should return an error message indicating that the book is currently not available.
*/

-- STORED PROC
delimiter $$
create procedure issued_book(
in p_issued_id varchar(20),
in p_member_id varchar(20),
in p_issued_book_isbn varchar(30),
in p_issued_emp_id varchar(20))

begin
declare v_book_status varchar(20);

select status into v_book_status 
from books where isbn=p_issued_book_isbn;

if v_book_status='yes'
 then
insert into issued_status(issued_id,issued_member_id,issued_date,issued_book_isbn,issued_emp_id)
values (p_issued_id,p_member_id,curdate(),p_issued_book_isbn,p_issued_emp_id);

update books
set status='no'
where isbn=p_issued_book_isbn;

select concat("BOOK RECORD SUCCESSFULLY ADDED FOR BOOK ISBN:",p_issued_book_isbn) as Message;

else
select concat('BOOK IS NOT AVAILABLE',p_issued_book_isbn) as Message;
end if;
end ;

-- TESTING
SELECT * FROM books
where isbn= "978-0-553-29698-2"; -- STATUS=YES

SELECT * FROM books
where isbn= "978-0-375-41398-8"; -- STATUS=NO

call issued_book('IS155', 'C108', '978-0-553-29698-2', 'E104'); -- UPDATED THE STATUS TO NO// SUCCESSFULY ADDED

CALL issued_book('IS156', 'C108', '978-0-375-41398-8', 'E104'); -- THE BOOK IS NOT AVAILABLE

SELECT * FROM books
where isbn= "978-0-553-29698-2"; -- NOW STATUS UPDATED TO NO
 














