Got it! Here's the updated **README.md** without bold formatting for table names:  

---

### 📜 **README.md**  
```md
# 📚 Library Management System (SQL)

This project is a Library Management System built using SQL. It helps manage books, members, employees, and transactions in a library. The database includes tables for book records, member details, issuance and return statuses, and employee management.

---

## 🏛️ Database Tables

- branch - Stores branch details and manager information.  
- books - Contains book details such as title, category, author, and rental status.  
- members - Stores member details and registration dates.  
- employees - Stores employee details, including salary and branch association.  
- issued_status - Tracks books issued to members.  
- return_status - Tracks returned books and their status.  

---

## 📝 SQL Tasks Implemented

### Task 1: Create a New Book Record
```sql
INSERT INTO books VALUES ('978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.');
```

### Task 2: Update an Existing Member's Address
```sql
UPDATE members
SET member_address='154 Main St'
WHERE member_id='C101';
```

### Task 3: Delete a Record from the Issued Status Table
```sql
DELETE FROM issued_status
WHERE issued_id = 'IS121';
```

### Task 4: Retrieve All Books Issued by a Specific Employee
```sql
SELECT * FROM issued_status
WHERE issued_emp_id='E101';
```

### Task 5: List Members Who Have Issued More Than One Book
```sql
SELECT ist.issued_emp_id, e.emp_name 
FROM issued_status ist 
JOIN employees e ON ist.issued_emp_id = e.emp_id
GROUP BY ist.issued_emp_id, e.emp_name 
HAVING COUNT(ist.issued_emp_id) > 1;
```

### Task 6: Create Summary Table of Book Issuance (CTAS)
```sql
CREATE TABLE book_counts AS    
SELECT b.isbn, b.book_title, COUNT(ist.issued_id) AS Total_issued_books
FROM books b 
JOIN issued_status ist ON b.isbn = ist.issued_book_isbn
GROUP BY b.isbn, b.book_title;

SELECT * FROM book_counts;
```

### Task 7: Retrieve All Books in a Specific Category
```sql
SELECT * FROM books 
WHERE category='Classic';
```

### Task 8: Find Total Rental Income by Category
```sql
SELECT b.category, SUM(b.rental_price) AS total_rental_income, COUNT(*) AS total_count 
FROM books b 
JOIN issued_status ist ON b.isbn = ist.issued_book_isbn
GROUP BY b.category;
```

### Task 9: List Members Who Registered in the Last 180 Days
```sql
INSERT INTO members(member_id, member_name, member_address, reg_date)
VALUES 
('C201', 'Sam', '145 Main St', '2025-02-01'),
('C202', 'John', '133 Main St', '2025-01-01');

SELECT * FROM members 
WHERE reg_date >= CURDATE() - INTERVAL 180 DAY;
```

### Task 10: List Employees with Their Branch Manager's Name
```sql
SELECT e1.*, b.manager_id, e2.emp_name AS manager_name 
FROM employees e1 
JOIN branch b ON e1.branch_id = b.branch_id
JOIN employees e2 ON b.manager_id = e2.emp_id;
```

### Task 11: Create a Table of Books with Rental Price Above $7
```sql
CREATE TABLE book_price_above_7USD AS
SELECT * FROM books 
WHERE rental_price > 7;

SELECT * FROM book_price_above_7USD;
```

### Task 12: Retrieve the List of Books Not Yet Returned
```sql
SELECT DISTINCT ist.issued_book_name 
FROM issued_status ist 
LEFT JOIN return_status r ON ist.issued_id = r.issued_id
WHERE r.issued_id IS NULL;
```

---

## 📌 How to Run

1. Execute all `CREATE TABLE` queries to set up the database schema.
2. Insert sample data into each table.
3. Run each SQL task to test operations.

---

## 🎯 Features

✔️ Manage Books – Store book details including title, category, and rental price.  
✔️ Manage Members – Keep track of registered members.  
✔️ Issue & Return Books – Track book borrowing and return transactions.  
✔️ Employee & Branch Management – Maintain employee records and branch details.  
✔️ Generate Reports – Use summary tables for better data analysis.  

---

## 📬 Contact

If you have any questions or suggestions, feel free to reach out! 😊
```
