<img src="https://cdn.icon-icons.com/icons2/2699/PNG/512/postgresql_logo_icon_170836.png" width=700px style="position:relative; left:22%; background-color: white;" >

# Understand Basics
- What is a Database?
An organised collection of data. A method to manipulate and access the data.

- What is RDBMS?
A type of databases system that stores data in structured tables (using rows and columns) and uses SQL for managing and querying data.
<br>

# Installation
- Ubuntu includes PostgreSQL by default. To install PostgreSQL on Ubuntu, use the apt (or other apt-driving) command
```
$ sudo apt install postgresql -y

# To access PostgreSQL Server
$ psql  
```
<br>

- Docker Container
```
$ docker run -dit --name postgres -p 5432:5432 -e TZ=Asia/Kolkata -e POSTGRES_PASSWORD=12345 -e PGDATA=/var/lib/postgresql/data/pgdata -v posdb:/var/lib/postgresql/data postgres:12-alpine3.17

# To access the PostgreSQL container
$ docker exec -it postgres bash

# Run this command to access PostgreSQL
$ psql -h localhost -U postgres
```
<br>

# Database
- Creating, Connect, Listing, Droping
<br>


# CRUD
- Create - New Table
  - Inserting Data
- Read - How to read data
- Update Data
- Delete Data

<br>

# Working with Databases
- List down existing databases
```
# Through PostgreSQL command
$ \l

# Through Query
$ SELECT datname FROM pg_database;
```

- Creating a new database
```
$ CREATE DATABASE <db_name>;
```

- Connect to your database
```
$ \c <db_name>;
```

- Deleting a Database
```
$ DROP DATABASE <db_name>;
```
<br>

# Let see CRUD (Create, Read, Update, Delete) Operation

## Creating Tables
- **A table is a collection of related data held in a table format within a database**
> CREATE TABLE <table_name> (<column_name> INT, <column_name> VARCHAR(100), <column_name> VARCHAR(100));
```
$ CREATE TABLE person (id INT, name VARCHAR(100), city VARCHAR(100));
```


- Display all tables
```
$ \dt or \dt+
```

- Display details of a particular table
```
$ \d <table_name>
```
<br>

## Inserting Data
- Adding data into a table
> INSERT INTO <table_name> (<column name>, <column name>, <column name>) VALUES ('value', 'value', 'value');
```
$ INSERT INTO person (id, name, city) VALUES (101, 'Raju', 'Delhi');
```

- Adding Multiple data at a same time
```
$ INSERT INTO person (id, name, city) VALUES (102, 'Sham', 'Mumbai'), (103, 'Paul', 'Chennai'), (104, 'Alex', 'Pune');
```
<br>

## Reading Data
- Reading data from a table
```
$ SELECT * FROM <table_name>;

$ SELECT <column_name> FROM <table_name>;
```
<br>

## Updating Data
- Modify/Update data from a table
> UPDATE <table_name> SET <column_name>=<'Value'> WHERE <column_name>=<table_data>;
```
$ UPDATE person SET city='Banglore' WHERE id=1;
```
<br>

## Deleting Data
- Delete data from a Table
> DELETE FROM <table_name> WHERE <column_name>=<table_data>;
```
$ DELETE FROM person WHERE name='Raju';
```
<br>

# Drawback of Current Structure
- Datatypes
**An attribute that specifies the type of data in a column of our database - table**
  - Most widely used are
    - Numeric: INT DOUBLE FLOAT DECIMAL
    - String: VARCHAR
    - Data: DATE
    - Boolean: Boolean

- Constraint
**A constraint in PostgreSQL is a rule applied to a column**
  - PRIMARY KEY
    - **The PRIMARY KEY constraint uniquely identifies each record in a table**
    - **Primary Keys must contain UNIQUE values, and cannot contain NULL values**
    - **A table can have only ONE primary key**
  
  - NOT NULL
  ```
  CREATE TABLE customers
  (
    id INT NOT NULL,
    name VARCHAR(100) NOT NULL
  );
  ```
 
  - DEFAULT
  ```
  CREATE TABLE customers
  (
    acc_no INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    acc_type VARCHAR(50) NOT NULL DEFAULT 'Saving'
  )
  ```
 
  - SERIAL (AUTO_INCREMENT)
  ```
  CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    firstname VARCHAR(50),
    lastname VARCHAR(50)
  );
  ```
 
  - UNIQUE

<br>

# Creating new table
```
$ CREATE TABLE employees (
    emp_id SERIAL PRIMARY KEY,
    fname VARCHAR(100) NOT NULL,
    lname VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    dept VARCHAR(100),
    salary DECIMAL(11,2) DEFAULT 30000.00,
    hire_date DATE NOT NULL DEFAULT CURRENT_DATE
  );
```
<br>

# Data Refining
- Clauses (SQL Conditions)
  - WHERE
  > SELECT * FROM <table_name> WHERE <column_name>=<column_data>
  ```
  $ SELECT * FROM employees WHERE emp_id=5;
  ```
  
  - DISTINCT (Find Unique Value)
  ```
  $ SELECT DISTINCT dept FROM employees;
  ```

  - ORDER BY (Sorting of Alphabetical Data)
  ```
  # Ascending Order
  $ SELECT * FROM employees ORDER BY fname;

  # Descending Order
  $ SELECT * FROM employees ORDER BY fname DESC;
  ```
  
  - LIMIT (Line of data show)
  ```
  $ SELECT * FROM employees LIMIT 5;
  ```
  
  - LIKE
  ```
  $ SELECT * FROM employees WHERE fname LIKE 'A%';
  ```
<br>

# Logical Operators
- AND and OR
> Condition 1 `AND` Condition 2             # When both the conditions are true
> Condition 1 `OR`  Condition 2             # When either of the condition is true

- IN and NOT IN
```
# IN Operator

$ SELECT * FROM employees WHERE dept IN ('IT', 'Finance', 'HR');
```

```
# NOT IN Operator

$ SELECT * FROM employees WHERE dept NOT IN ('IT', 'Finance', 'HR');
```

- BETWEEN
```
$ SELECT * FROM employees WHERE salary BETWEEN 50000 AND 60000;
```
<br>

# Aggregate Function
- COUNT
> SELECT COUNT(<column_name>) FROM <table_name>;
```
$ SELECT COUNT(emp_id) FROM employees;
```

- SUM
> SELECT SUM(<column_name>) FROM <table_name>;
```
$ SELECT SUM(salary) FROM employees;
```

- AVG
> SELECT AVG(<column_name>) FROM <table_name>;
```
$ SELECT AVG(salary) FROM employees;
```

- MIN
> SELECT MIN(<column_name>) FROM <table_name>;
```
$ SELECT MIN(salary) FROM employees;
```

- MAX
> SELECT MAX(<column_name>) FROM <table_name>;
```
$ SELECT MAX(salary) FROM employees;
```
<br>

# GROUP BY
> SELECT <column_name> FROM <table_name> GROUP BY <column_name>;
```
$ SELECT dept FROM employees GROUP BY dept;

Examples:-
$ SELECT dept, COUNT(emp_id) FROM employees GROUP BY dept;

$ SELECT dept, SUM(salary) FROM employees GROUP BY dept;
```
<br>

# String Functions
- CONCAT
> CONCAT (first_column, second_column, . . .)
```
$ SELECT CONCAT(fname, lname) AS <name> FROM employees;
```

- CONCAT_WS
> SELECT CONCAT_WS ('-', fname, lname) AS <name> FROM <table_name>;
```
$ SELECT CONCAT_WS (' ', fname, lname) AS FullName FROM employees;
```

- SUBSTRING
> SELECT SUBSTRING('Hey Buddy', 1, 4);
```
$ SELECT SUBSTR(salary::text, 1, 3) FROM employees;
$ SELECT SUBSTR(fname, 1, 3) FROM employees;
```

- LEFT, RIGHT

- LENGTH
> 

- UPPER, LOWER

- TRIM, LTRIM, RTRIM

- REPLACE
> REPLACE(str, from_str, to_str)
```
$ SELECT REPLACE(fname, 'Raj', 'Rohan') AS Updated_name FROM employees;

# REPLACE with UPDATE
$ UPDATE employees SET fname = REPLACE(fname, 'Raj', 'Rohan') WHERE fname LIKE '%Raj%';
```

- POSITION

- STRING_AGG

- REVERSE
> SELECT REVERSE(<column_name>) FROM <table_name>;
```
$ SELECT REVERSE(fname) FROM employees;
```