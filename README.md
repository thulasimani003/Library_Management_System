### 📜 **README.md**
```md
# 📚 Library Management System (SQL)

This project is a **Library Management System** built using SQL. It helps manage books, members, employees, and transactions in a library. The database includes tables for book records, member details, issuance and return statuses, and employee management.

## 🏛️ Database Schema
The project consists of the following tables:

1. **Branch** - Stores branch details and manager information.
2. **Books** - Contains book-related details such as title, category, author, and rental status.
3. **Members** - Stores member details and registration dates.
4. **Employees** - Stores employee details, including salary and branch association.
5. **Issued_Status** - Tracks books issued to members.
6. **Return_Status** - Tracks returned books and their status.

---

## 🚀 Creating the Database & Tables

### **Step 1: Create the Database**
```sql
CREATE DATABASE Library_Management_System;
USE Library_Management_System;
```

### **Step 2: Create Tables**

#### **Branch Table**
```sql
CREATE TABLE branch (
    branch_id VARCHAR(30) PRIMARY KEY,
    manager_id VARCHAR(30),
    branch_address VARCHAR(60),
    contact_no VARCHAR(30)
);
```

#### **Books Table**
```sql
CREATE TABLE books (
    isbn VARCHAR(50) PRIMARY KEY,
    book_title VARCHAR(50),
    category VARCHAR(50),
    rental_price DECIMAL(10,2),
    status VARCHAR(50),
    author VARCHAR(50),
    publisher VARCHAR(50)
);
```

#### **Members Table**
```sql
CREATE TABLE members (
    member_id VARCHAR(50) PRIMARY KEY,
    member_name VARCHAR(50),
    member_address VARCHAR(50),
    reg_date DATE
);
```

#### **Return Status Table**
```sql
CREATE TABLE return_status (
    return_id VARCHAR(10) PRIMARY KEY,
    issued_id VARCHAR(30),
    return_book_name VARCHAR(80),
    return_date DATE,
    return_book_isbn VARCHAR(50),
    FOREIGN KEY (return_book_isbn) REFERENCES books(isbn)
);
```

#### **Employees Table**
```sql
CREATE TABLE employees (
    emp_id VARCHAR(30) PRIMARY KEY,
    emp_name VARCHAR(30),
    position VARCHAR(30),
    salary DECIMAL(10,2),
    branch_id VARCHAR(30),
    FOREIGN KEY (branch_id) REFERENCES branch(branch_id)
);
```

#### **Issued Status Table**
```sql
CREATE TABLE issued_status (
    issued_id VARCHAR(30) PRIMARY KEY,
    issued_member_id VARCHAR(30),
    issued_book_name VARCHAR(30),
    issued_date DATE,
    issued_book_isbn VARCHAR(30),
    issued_emp_id VARCHAR(30),
    FOREIGN KEY (issued_member_id) REFERENCES members(member_id),
    FOREIGN KEY (issued_book_isbn) REFERENCES books(isbn),
    FOREIGN KEY (issued_emp_id) REFERENCES employees(emp_id)
);
```

---

## 📂 File Structure
```
Library-Management-SQL/
│-- 📂 database/
│   │-- schema.sql  # Contains table structures
│   │-- seed_data.sql  # Insert statements (sample data)
│-- 📂 queries/
│   │-- core_queries.sql  # Basic & intermediate queries
│-- README.md  # Project documentation
```

---

## 🎯 Features
✔️ **Manage Books** – Store book details including title, category, and rental price.  
✔️ **Manage Members** – Keep track of registered members.  
✔️ **Issue & Return Books** – Track book borrowing and return transactions.  
✔️ **Employee & Branch Management** – Maintain employee records and branch details.  

---

## 🔧 How to Run
1. **Import `schema.sql`** to create tables.  
2. **Import `seed_data.sql`** to insert sample data.  
3. Run SQL queries from **`core_queries.sql`** to test different operations.  

---

## 📌 Future Improvements
🔹 Add **fine calculation** for late returns.  
🔹 Implement **stored procedures & triggers** for automation.  
🔹 Create **views & reports** for better data insights.  

---

## 📬 Contact
If you have any questions or suggestions, feel free to reach out! 😊  

---
