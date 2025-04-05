📚 Library Management System (SQL Project)
📝 Project Title:
Library Management System

📊 Project Level:
Intermediate

🧠 Database Used:
library_db

🔍 Project Overview
This project showcases the development of a Library Management System using SQL. It involves designing and managing a relational database that maintains details of books, members, employees, branches, and transactions (issue/return).
It demonstrates proficiency in:

Database creation and structure

CRUD operations

CTAS (Create Table As Select)

Advanced SQL querying and logic (like procedures and nested queries)

🎯 Objectives
Set up the Database:

Create library_db

Design tables: branches, employees, members, books, issued_status, return_status

CRUD Operations:

Perform Insert, Select, Update, and Delete on all major tables.

CTAS – Create Table As Select:

Generate new tables from query results for data analysis or reporting.

Advanced SQL Queries:

Use nested queries, JOINs, stored procedures, IF conditions, and aggregate functions for powerful data retrieval.

🗂️ Project Structure
1. Database Setup
Create library_db

Create necessary tables with proper data types and constraints

2. Tables Included
branches

employees

members

books

issued_status

return_status

3. Stored Procedures
issued_book: Handles issuing books (with availability check)

add_return_records: Handles return transactions and updates book status

4. Sample Queries
Members who borrowed books in the last 2 months

Books currently issued or available

Number of books issued by each employee

Members with most borrow history

5. CTAS Examples
Table of currently borrowed books

Table of frequent borrowers

⚙️ Sample Features Implemented
✅ Book issuing and returning with availability check

✅ Auto date insertion with CURDATE()

✅ Status update for books (yes/no)

✅ Messages for user feedback via SELECT CONCAT(...)

✅ Procedures written in MySQL for modular tasks

🚀 How to Use
Create the database:

sql
Copy
Edit
CREATE DATABASE library_db;
USE library_db;
Run the SQL script files to create and populate the tables.

Execute procedures like:

sql
Copy
Edit
CALL issued_book('IS101', 'MB001', 'ISBN123', 'EMP001');
CALL add_return_records('RS102', 'IS101', 'Good');
Run queries to test features like borrowed books, overdue status, and book availability.

💡 Skills Demonstrated
SQL table creation and normalization

CRUD operations

Stored procedure creation and logic handling

CTAS usage

Data analysis via queries

Understanding of real-world database management


   
