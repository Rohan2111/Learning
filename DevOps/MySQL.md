<img src="https://d1.awsstatic.com/asset-repository/products/amazon-rds/1024px-MySQL.ff87215b43fd7292af172e2a5d9b844217262571.png" width="600px" style="margin-left:30%;">

## <span style="font-size:35px; display: block; margin-top: 50px;">**What is Database?**</span>
- <span span style="font-size:25px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> ***A database is an organized collection of data or a type of data store based on the use of a database management system, the software that interacts with end users, applications, and the database itself to capture and analyze the data.***</span>

## <span style="font-size:35px; display: block; margin-top: 50px;">**What is RDBMS?**</span>
- <span span style="font-size:25px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> ***RDBMS stands for Relational Database Management System. RDBMS is a program used to maintain a relational database. RDBMS uses SQL queries to access the data in the database.***</span>

## <span style="font-size:35px; display: block; margin-top: 50px;">**What is a Relational Database?**</span>
- <span span style="font-size:25px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> ***A relational database defines database relationships in the form of tables. The tables are related to each other - based on data common to each.***</span>

## <span style="font-size:35px; display: block; margin-top: 50px;">**What is SQL?**</span>
- <span span style="font-size:25px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> ***SQL is the standard language for dealing with Relational Databases. SQL is used to INSERT, search, update, and delete database records.***</span>

## <span style="font-size:35px; display: block; margin-top: 50px;">**MySQL Installation**</span>
-  <span span style="font-size:25px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **Debian/Ubuntu [(More Info)](https://www.digitalocean.com/community/tutorials/how-to-install-mysql-on-ubuntu-20-04)**</span> 
```
root@localhost:~# sudo apt update && sudo apt upgrade -y
root@localhost:~# sudo apt install mysql-server -y
root@localhost:~# sudo systemctl restart mysql.service				# Restart MySQL service
```

-  <span span style="font-size:25px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **Fedora/CentOS**</span>
```
root@localhost:~# sudo yum update or sudo dnf update
root@localhost:~# sudo dnf install mysql-server -y						# Install MySQL-Server through dnf (CentOS 8 and 9)
root@localhost:~# sudo yum install mysql-server -y						# Install MySQL-Server through yum (CentOS 6 and 7)
root@localhost:~# sudo systemctl restart mysql.service				# Restart MySQL service
```

-  <span span style="font-size:25px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **Docker Container**</span>

```
root@localhost:~# docker run -dit --name mysql --restart always -e TZ=Asia/Kolkata -e MYSQL_ROOT_PASSWORD={Password} -e MYSQL_DATABASE={Database_Name} -e MYSQL_USER={User_Name} -e MYSQL_PASSWORD={User_Password} -p 3306:3306 -v ./mysql_data:/var/lib/mysql mysql:latest

# Replace the following placeholders:
#your_root_password: Set this to your desired MySQL root password.
#your_database_name: Specify the name of the database you want to create.
#your_database_user: Set the username for the database user.
#your_database_password: Set the password for the database user.
#/path/to/your/mysql/data: Replace this with the path on your host machine where you want to store MySQL data files.

root@localhost:~# docker exec -it mysql_container bash

bash-4.4# mysql -h localhost -u root -prohan@123
```

- <span span style="font-size:25px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **Docker-Compose**</span>
```
# MySQL through docker-compose with adminer dashboard
version: '3.7'

services:
  mysql:
    image: mysql:latest
    container_name: mysql_container
    environment:
      MYSQL_ROOT_PASSWORD: {DB_Password}
      MYSQL_DATABASE: {Database_Name}
      MYSQL_USER: {User_name}
      MYSQL_PASSWORD: {User_Password}
    volumes:
      - ./mysql_data:/var/lib/mysql
    ports:
      - '3306:3306'
    restart: always  # Added restart policy for mysql service

  adminer:
    image: adminer:latest
    container_name: adminer_container
    ports:
      - '8085:8080'
    restart: always  # Added restart policy for adminer service

volumes:
  mysql_data:
```
</br>

## <span style="font-size:35px; display: block; margin-top: 50px;">**MySQL Commands**</span>
- <span span style="font-size:22px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **Lists all the databases available**</span>
> *`SHOW DATABASES;`*
```
mysql> SHOW DATABASES;

+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| rondb              |
| sys                |
+--------------------+
```
<br>

- <span span style="font-size:22px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **The `CREATE DATABASE` statement in MySQL creates a new database to store and manage structured data**</span>
> *`CREATE DATABASE {db_name};`*
```
mysql> CREATE DATABASE bank_db;
```
<br>

- <span span style="font-size:22px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **Selects a specific database as the default for subsequent queries in your MySQL session**</span>
> *`USE {db_name};`*
```
mysql> USE bank_db;
```
<br>

- <span span style="font-size:22px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **Deletes the specified database from MySQL, including all its tables and data**</span>
> *`DROP DATABASES {db_name};`*
```
mysql> DROP DATABASES bank_db;
```
</br>

## <span style="font-size:35px; display: block; margin-top: 50px;">**Working with MySQL Tables**</span>
- <span span style="font-size:22px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **Creating a new table in selected database**</span>
> *`CREATE TABLE {table_name} ({column_name} INT, {column_name} VARCHAR(100), {column_name} VARCHAR(100));`*
```
mysql> CREATE TABLE employees (id INT, name VARCHAR(100), desig VARCHAR(100), salary INT);
```
<br>

- <span span style="font-size:22px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **Lists all the tables in the current database**</span>
> *`SHOW TABLES;`*
```
mysql> SHOW TABLES;

+-------------------+
| Tables_in_bank_db |
+-------------------+
| employees         |
+-------------------+
```
<br>

- <span span style="font-size:22px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **Retrieves the structure (column names, data types, constraints) of the specified table**</span>
> *`DESC {table_name};`*
```
mysql> DESC employees;

+--------+--------------+------+-----+---------+----------------+
| Field  | Type         | Null | Key | Default | Extra          |
+--------+--------------+------+-----+---------+----------------+
| id     | int          | NO   | PRI | NULL    | auto_increment |
| fname  | varchar(100) | NO   |     | NULL    |                |
| lname  | varchar(100) | NO   |     | NULL    |                |
| desig  | varchar(100) | NO   |     | NULL    |                |
| dept   | varchar(100) | YES  |     | NULL    |                |
| salary | int          | NO   |     | 20000   |                |
+--------+--------------+------+-----+---------+----------------+
```
<br>

- <span span style="font-size:22px; vertical-align: middle;line-height: 1; margin-bottom: 0;margin-top:3em;"> **`NOT NULL:`** *Enforces that a column in a table cannot hold a null value*</span>
> `CREATE TABLE {new_table_name} ({column_name} INT NOT NULL, {column_name} VARCHAR(100) NOT NULL);`
```
mysql> CREATE TABLE employees (id INT NOT NULL, name VARCHAR(100) NOT NULL);

+-------+--------------+------+-----+---------+-------+
| Field | Type         | Null | Key | Default | Extra |
+-------+--------------+------+-----+---------+-------+
| id    | int          | NO   |     | NULL    |       |
| name  | varchar(100) | NO   |     | NULL    |       |
+-------+--------------+------+-----+---------+-------+
```
<br>

- <span span style="font-size:22px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **`DEFAULT VALUE`:** *Specifies a default value to be assigned to a column in a table if no value is explicitly provided during data insertion*</span>
> `CREATE TABLE {new_table_name} ({column_name} INT NOT NULL, {column_name} VARCHAR(100) NOT NULL DEFAULT '{value}');`
```
mysql> CREATE TABLE employees (id INT NOT NULL, desig VARCHAR(100) NOT NULL DEFAULT 'Intern');

+-------+--------------+------+-----+---------+-------+
| Field | Type         | Null | Key | Default | Extra |
+-------+--------------+------+-----+---------+-------+
| id    | int          | NO   |     | NULL    |       |
| desig | varchar(100) | NO   |     | Intern  |       |
+-------+--------------+------+-----+---------+-------+
```
<br>

- <span span style="font-size:22px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **`PRIMARY KEY`:** *A table can have only ONE primary key, The PRIMARY KEY constraint uniquely identifies each record in a table*</span>
> `CREATE TABLE {new_table_name} ({column_name} INT PRIMARY KEY, {column_name} VARCHAR(100) NOT NULL);`
```
mysql> CREATE TABLE employees (id INT PRIMARY KEY, name VARCHAR(100) NOT NULL);

+-------+--------------+------+-----+---------+-------+
| Field | Type         | Null | Key | Default | Extra |
+-------+--------------+------+-----+---------+-------+
| id    | int          | NO   | PRI | NULL    |       |
| name  | varchar(100) | NO   |     | NULL    |       |
+-------+--------------+------+-----+---------+-------+
```
<br>

- <span span style="font-size:22px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **`UNIQUE`:** *For a column ensures that each value in that column is unique across all rows in the table, preventing duplicates*</span>
> `CREATE TABLE {new_table_name} ({column_name} INT PRIMARY KEY, {column_name} VARCHAR(100) UNIQUE);`
```
mysql> CREATE TABLE employees (id INT PRIMARY KEY, Name VARCHAR(100) NOT NULL, Mobile VARCHAR(100) UNIQUE);

+--------+--------------+------+-----+---------+-------+
| Field  | Type         | Null | Key | Default | Extra |
+--------+--------------+------+-----+---------+-------+
| id     | int          | NO   |     | NULL    |       |
| Name   | varchar(100) | NO   |     | NULL    |       |
| Mobile | varchar(100) | NO   | UNI | NULL    |       |
+--------+--------------+------+-----+---------+-------+
```
<br>

- <span span style="font-size:22px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **`CHECK`:** *Typically refers to applying conditions or constraints on column VALUES to ensure data integrity*</span>
> `CREATE TABLE {new_table_name} ({column_name} INT PRIMARY KEY, {column_name} VARCHAR(100) NOT NULL, {column_name} VARCHAR(100) UNIQUE CHECK (LENGTH({column_name}) >= 10));`
```
mysql> CREATE TABLE employees (id INT PRIMARY KEY, Name VARCHAR(100) NOT NULL, Mobile VARCHAR(100) UNIQUE CHECK (LENGTH(Mobile) >= 10));
```
<br>

- <span span style="font-size:22px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **`AUTO_INCREMENT`:** *Property that automatically generates a unique integer value for a column whenever a new row is INSERTed INTO the table*</span>
> `CREATE TABLE {new_table_name} ({column_name} INT PRIMARY KEY AUTO_INCREMENT, {column_name} VARCHAR(100) NOT NULL);`
```
mysql> CREATE TABLE employees (id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, name VARCHAR(100) NOT NULL);
```
<br>

- <span span style="font-size:22px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **`ALIAS`:** *Provides temporary names for tables or columns in query results, enhancing readability and simplicity in SQL*</span>
> `SELECT {column_name} AS {Name}, {column_name} AS {Name} FROM {table_name};`
```
mysql> SELECT id AS 'Employee ID', fname AS 'Employee Name' FROM employees;

+-------------+---------------+
| Employee ID | Employee Name |
+-------------+---------------+
|         101 | Raju          |
|         102 | Sham          |
|         103 | Baburao       |
|         104 | Paul          |
|         105 | Alex          |
|         106 | Rick          |
|         107 | Leena         |
|         108 | John          |
|         109 | Alex          |
+-------------+---------------+
```
<br>

- <span span style="font-size:22px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **Remove the specified table from the database in MySQL, permanently deleting all its data and structure**</span>
> *`DROP TABLE {table_name};`*
```
mysql> DROP TABLE employees;
```
<br>

- <span span style="font-size:22px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> `INSERT INTO:` *Statement is used to insert new records in a table*</span>
> *`INSERT INTO {table_name} (id, name, desig) VALUES (int_value, 'string_value', 'string_value');`*
```
mysql> INSERT INTO employees (id, name, desig, dept) VALUES
			 (101, 'Raju', 'Manager', 'Loan'),
			 (102, 'Sham', 'Cashier', 'Cash'),
			 (103, 'Paul', 'Associate', 'IT');
```
<br>

- <span span style="font-size:22px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **Retrieves all data from a table**</span>
> *`SELECT * FROM {table_name};`*
```
mysql> SELECT * FROM employees;

+-----+---------+---------+------------+----------+--------+
| id  | fname   | lname   | desig      | dept     | salary |
+-----+---------+---------+------------+----------+--------+
| 101 | Raju    | Rastogi | Manager    | Loan     |  75000 |
| 102 | Sham    | Mohan   | Cashier    | Cash     |  32000 |
| 103 | Baburao | Apte    | Associate  | Loan     |  25000 |
| 104 | Paul    | Philip  | Accountant | Accounts |  45000 |
| 105 | Alex    | Watt    | Associate  | Deposit  |  36000 |
| 106 | Rick    | Watt    | Manager    | Accounts |  67000 |
| 107 | Leena   | Jhonson | Lead       | Cash     |  34000 |
| 108 | John    | Paul    | Manager    | IT       |  77000 |
| 109 | Alex    | Croft   | Probation  | Loan     |  40000 |
+-----+---------+---------+------------+----------+--------+
```
<br>

- <span span style="font-size:22px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **Retrieves specific columns from a table**</span>
> *`SELECT {column_name} FROM {table_name};`*
```
mysql> SELECT id FROM employees;

+-----+
| id  |
+-----+
| 101 |
| 102 |
| 103 |
| 104 |
| 105 |
| 106 |
| 107 |
| 108 |
| 109 |
+-----+
```
<br>

- <span span style="font-size:22px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **SELECT (`WHERE`):** *Retrieves all rows from the specified table where the value in the column matches the specified value*</span>
> `SELECT * FROM {table_name} WHERE {column_name}={Value};`
```
mysql> SELECT * FROM employees WHERE id=108;

+-----+-------+-------+---------+------+--------+
| id  | fname | lname | desig   | dept | salary |
+-----+-------+-------+---------+------+--------+
| 108 | John  | Paul  | Manager | IT   |  77000 |
+-----+-------+-------+---------+------+--------+
```
<br>

- <span span style="font-size:22px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **ALTER (`ADD`):** *Adds a new column to an existing table*</span>
> `ALTER TABLE {table_name} ADD {new_column_name} VARCHAR(100);`
```
mysql> ALTER TABLE employees ADD Timing TIMESTAMP;

+--------+--------------+------+-----+---------+----------------+
| Field  | Type         | Null | Key | Default | Extra          |
+--------+--------------+------+-----+---------+----------------+
| id     | int          | NO   | PRI | NULL    | auto_increment |
| fname  | varchar(100) | NO   |     | NULL    |                |
| lname  | varchar(100) | NO   |     | NULL    |                |
| desig  | varchar(100) | NO   |     | NULL    |                |
| dept   | varchar(100) | YES  |     | NULL    |                |
| salary | int          | NO   |     | NULL    |                |
| Timing | timestamp    | YES  |     | NULL    |                |
+--------+--------------+------+-----+---------+----------------+
```
<br>

- <span span style="font-size:22px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **ALTER (`MODIFY`):** *Modifies the specified column in the table*</span>
> `ALTER TABLE {table_name} MODIFY {column_name} {Anything_you_want_change_in_this_column};`
```
mysql> ALTER TABLE employees MODIFY dept VARCHAR(100) DEFAULT 'NULL';

# The default value of salary is 20,000; when you run this query, it's changed to the NULL value.
+--------+--------------+------+-----+---------+----------------+
| Field  | Type         | Null | Key | Default | Extra          |
+--------+--------------+------+-----+---------+----------------+
| id     | int          | NO   | PRI | NULL    | auto_increment |
| fname  | varchar(100) | NO   |     | NULL    |                |
| lname  | varchar(100) | NO   |     | NULL    |                |
| desig  | varchar(100) | NO   |     | NULL    |                |
| dept   | varchar(100) | YES  |     | NULL    |                |
| salary | varchar(100) | YES  |     | 20000   |                |
| Timing | varchar(100) | YES  |     | NULL    |                |
+--------+--------------+------+-----+---------+----------------+
```
<br>

- <span span style="font-size:22px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **ALTER (`DROP`):** *Removes the specified column from the table in MySQL*</span>
> `ALTER TABLE {table_name} DROP COLUMN {column_name};`
```
mysql> ALTER TABLE employees DROP COLUMN Timing;

+--------+--------------+------+-----+---------+----------------+
| Field  | Type         | Null | Key | Default | Extra          |
+--------+--------------+------+-----+---------+----------------+
| id     | int          | NO   | PRI | NULL    | auto_increment |
| fname  | varchar(100) | NO   |     | NULL    |                |
| lname  | varchar(100) | NO   |     | NULL    |                |
| desig  | varchar(100) | NO   |     | NULL    |                |
| dept   | varchar(100) | YES  |     | NULL    |                |
| salary | int          | NO   |     | NULL    |                |
+--------+--------------+------+-----+---------+----------------+
```
<br>

- <span span style="font-size:22px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **ALTER (`RENAME`):** *Renames the specified columns in the table, allowing you to update their names without changing their data or properties*</span>
> `ALTER TABLE {table_name} RENAME COLUMN {existing_column_name} TO {new_column_name};`
```
mysql> ALTER TABLE employees RENAME COLUMN id TO Emp_ID;

+--------+--------------+------+-----+---------+----------------+
| Field  | Type         | Null | Key | Default | Extra          |
+--------+--------------+------+-----+---------+----------------+
| Emp_ID | int          | NO   | PRI | NULL    | auto_increment |
| fname  | varchar(100) | NO   |     | NULL    |                |
| lname  | varchar(100) | NO   |     | NULL    |                |
| desig  | varchar(100) | NO   |     | NULL    |                |
| dept   | varchar(100) | YES  |     | NULL    |                |
| salary | int          | NO   |     | NULL    |                |
+--------+--------------+------+-----+---------+----------------+
```
<br>

- <span span style="font-size:22px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **`UPDATE`:** *Modifies the specified column's value in the table where the column matches the given value*</span>
> `UPDATE {table_name} SET {column_name}={changes} WHERE {column_name}='{Value}';`
```
mysql> UPDATE employees SET desig='Manager' WHERE name='Raju';

+-----+-------+---------+---------+------+--------+
| id  | fname | lname   | desig   | dept | salary |
+-----+-------+---------+---------+------+--------+
| 101 | Raju  | Rastogi | Manager | Loan |  75000 |
+-----+-------+---------+---------+------+--------+
```
<br>

- <span span style="font-size:22px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **`DELETE:`** *Removes rows from the specified table where the value in the column matches the given value*</span>
> `DELETE FROM {table_name} WHERE {column_name}={value};`
```
mysql> DELETE FROM employees WHERE id=101;

+-----+---------+---------+------------+----------+--------+
| id  | fname   | lname   | desig      | dept     | salary |
+-----+---------+---------+------------+----------+--------+
| 102 | Sham    | Mohan   | Cashier    | Cash     |  32000 |
| 103 | Baburao | Apte    | Associate  | Loan     |  25000 |
| 104 | Paul    | Philip  | Accountant | Accounts |  45000 |
| 105 | Alex    | Watt    | Associate  | Deposit  |  36000 |
+-----+---------+---------+------------+----------+--------+
```
</br>

## <span style="font-size:35px; display: block; margin-top: 50px;">**String Functions**</span>
- <span span style="font-size:22px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **`CONCAT:`** *Function used to merge two or more strings together into a single string*</span>
> `SELECT CONCAT(column_name, column_name) as {Join_Output_Column_name} FROM {table_name};`
```
mysql> SELECT CONCAT(fname, lname) AS 'Full_Name' FROM employees;

# wtihout spacing
+--------------+
| Full_Name    |
+--------------+
| RajuRastogi  |
| ShamMohan    |
| BaburaoApte  |
| PaulPhilip   |
| AlexWatt     |
| RickWatt     |
| LeenaJhonson |
| JohnPaul     |
| AlexCroft    |
+--------------+
```
> `SELECT CONCAT(column_name, ' ', column_name) as {Join_Output_Column_name} FROM {table_name};`
```
mysql> SELECT CONCAT(fname, ' ', lname) AS 'Full_Name' FROM employees;

# with spacing
+---------------+
| Full Name     |
+---------------+
| Raju Rastogi  |
| Sham Mohan    |
| Baburao Apte  |
| Paul Philip   |
| Alex Watt     |
| Rick Watt     |
| Leena Jhonson |
| John Paul     |
| Alex Croft    |
+---------------+
```
> `SELECT CONCAT(column_name, 'ABCD') as {Join_Output_Column_name} FROM {table_name};`
```
mysql> SELECT CONCAT('EMP', '-', id) AS 'Employee_id', fname FROM employees;

# add something
+-------------+---------+
| Employee_id | name    |
+-------------+---------+
| EMP-101     | Raju    |
| EMP-102     | Sham    |
| EMP-103     | Baburao |
| EMP-104     | Paul    |
| EMP-105     | Alex    |
| EMP-106     | Rick    |
| EMP-107     | Leena   |
| EMP-108     | John    |
| EMP-109     | Alex    |
+-------------+---------+
```
<br>

- <span span style="font-size:22px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **`CONCAT_WS:`** *Merge strings with a specified separator, providing a convenient way to combine VALUES while controlling the output format*</span>
> `SELECT CONCAT_WS(':', column_name, column_name, column_name) FROM {table_name};`
```
mysql> SELECT CONCAT_WS(' ', id, fname, salary) AS Emp_details FROM employees;

+-------------------+
| Emp_details       |
+-------------------+
| 101:Raju:56000    |
| 102:Sham:32000    |
| 103:Baburao:25000 |
| 104:Paul:45000    |
| 105:Alex:36000    |
| 106:Rick:67000    |
| 107:Leena:34000   |
| 108:John:77000    |
| 109:Alex:40000    |
+-------------------+
```
<br>

- <span span style="font-size:22px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **`SUBSTRING:`** *Useful for manipulating string data, such as extracting portions of text or trimming unwanted characters*</span>
> `SELECT SUBSTRING({column_name}, {starting_value_number}, {ending_value_number});`
```
mysql> SELECT SUBSTRING('Hey Buddy', 1, 3);

# Output: Counting from the first word (H=1, E=2, Y=3, 'space=4' = Hey)
+------------------------------+
| SUBSTRING('Hey Buddy', 1, 3) |
+------------------------------+
| Hey                          |
+------------------------------+
```
> `SELECT SUBSTRING({column_name}, -5);`
```
mysql> SELECT SUBSTRING('Hey Buddy, Hello Rohan', -5);

# Output: Counting from the last word (N=-1, A=-2, H=-3, O=-4, R=-5 = Rohan)
+-----------------------------------------+
| SUBSTRING('Hey Buddy, Hello Rohan', -5) |
+-----------------------------------------+
| Rohan                                   |
+-----------------------------------------+
```
<br>

- <span span style="font-size:22px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **`REPLACE:`** *Changes specified parts of a string to another string*</span>
> `SELECT REPLACE(string or column_name, string_value, change_into_str) FROM employees;`
```
mysql> SELECT REPLACE(id, 10, 'EMP') AS IDs, fname from employees;

+------+---------+
| IDs  | fname   |
+------+---------+
| EMP1 | Raju    |
| EMP2 | Sham    |
| EMP3 | Baburao |
| EMP4 | Paul    |
| EMP5 | Alex    |
| EMP6 | Rick    |
| EMP7 | Leena   |
| EMP8 | John    |
| EMP9 | Alex    |
+------+---------+
```
<br>

- <span span style="font-size:22px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **`REVERSE:`** *Returns the reverse of a given string*</span>
> `SELECT REVERSE({column_name}) AS {name} FROM {table_name};`
```
mysql> SELECT REVERSE(fname) AS rname FROM employees;

+---------+
| rname   |
+---------+
| ujaR    |
| mahS    |
| oarubaB |
| luaP    |
| xelA    |
| kciR    |
| aneeL   |
| nhoJ    |
| xelA    |
+---------+
```
<br>

- <span span style="font-size:22px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **`UPPER (UCASE):`** *Converts a string to all uppercase letters*</span>
> `SELECT UPPER({column_name}) FROM {table_name};`
```
mysql> SELECT id, UPPER(fname) FROM employees;

+-----+--------------+
| id  | LOWER(fname) |
+-----+--------------+
| 101 | raju         |
| 102 | sham         |
| 103 | baburao      |
| 104 | paul         |
| 105 | alex         |
| 106 | rick         |
| 107 | leena        |
| 108 | john         |
| 109 | alex         |
+-----+--------------+
```
<br>

- <span span style="font-size:22px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **`CHAR_LENGTH:`** *Returns the number of characters in a string*</span>
> `SELECT CHAR_LENGTH({column_name}) FROM {table_name};`
```
mysql> SELECT fname, CHAR_LENGTH(fname) FROM employees;

+---------+--------------------+
| fname   | CHAR_LENGTH(fname) |
+---------+--------------------+
| Raju    |                  4 |
| Sham    |                  4 |
| Baburao |                  7 |
| Paul    |                  4 |
| Alex    |                  4 |
| Rick    |                  4 |
| Leena   |                  5 |
| John    |                  4 |
| Alex    |                  4 |
+---------+--------------------+
```
<br>

- <span span style="font-size:22px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **`LEFT:`** *Returns a specified number of characters from the beginning **(Left Side)** of a string*</span>
> `SELECT LEFT({column_name}, {Number_Begins_with_the_First_Word}) FROM {table_name};`
```
mysql> SELECT LEFT(fname, 3) FROM employees;

+----------------+
| LEFT(fname, 3) |
+----------------+
| Raj            |
| Sha            |
| Bab            |
| Pau            |
| Ale            |
| Ric            |
| Lee            |
| Joh            |
| Ale            |
+----------------+
```
<br>

- <span span style="font-size:22px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **`RIGHT:`** *Returns a specified number of characters from the end **(Right Side)** of a string*</span>
> `SELECT LEFT({column_name}, {Number_Begins_with_the_Last_Word}) FROM {table_name};`
```
mysql> SELECT LEFT(fname, 3) FROM employees;

+-----------------+
| RIGHT(fname, 3) |
+-----------------+
| aju             |
| ham             |
| rao             |
| aul             |
| lex             |
| ick             |
| ena             |
| ohn             |
| lex             |
+-----------------+
```
<br>

- <span span style="font-size:22px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **`TRIM:`** ***(Delete extra spaces / White spaces)** it's important to use when accidentally user add space*</span>
> `SELECT TRIM({column_name}) FROM {table_name};`
```
mysql> SELECT TRIM('   HELLO   ');

+---------------------+
| TRIM('   HELLO   ') |
+---------------------+
| HELLO               |
+---------------------+
```
<br>


## <span style="font-size:35px; display: block; margin-top: 50px;">**MySQL Functions**</span>
- <span span style="font-size:22px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **`DISTINCT:`** *Removes duplicate rows from the result set*</span>
> `SELECT DISTINCT {column_name} FROM {table_name};`
```
mysql> SELECT DISTINCT dept FROM employees;

+----------+
| dept     |
+----------+
| Loan     |
| Cash     |
| Accounts |
| Deposit  |
| IT       |
+----------+
```
<br>

- <span span style="font-size:22px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **`ORDER BY:`** *Sorts the retrieved data in a specific order **Ascending** or **Descending***</span>
> `SELECT * FROM {table_name} ORDER BY {column_name};`
```
mysql> SELECT * FROM employees ORDER BY fname;

# Ascending Order
+-----+---------+---------+------------+----------+--------+
| id  | fname   | lname   | desig      | dept     | salary |
+-----+---------+---------+------------+----------+--------+
| 105 | Alex    | Watt    | Associate  | Deposit  |  36000 |
| 109 | Alex    | Croft   | Probation  | Loan     |  40000 |
| 103 | Baburao | Apte    | Associate  | Loan     |  25000 |
| 108 | John    | Paul    | Manager    | IT       |  77000 |
| 107 | Leena   | Jhonson | Lead       | Cash     |  34000 |
| 104 | Paul    | Philip  | Accountant | Accounts |  45000 |
| 101 | Raju    | Rastogi | Manager    | Loan     |  56000 |
| 106 | Rick    | Watt    | Manager    | Accounts |  67000 |
| 102 | Sham    | Mohan   | Cashier    | Cash     |  32000 |
+-----+---------+---------+------------+----------+--------+
```
> `SELECT * FROM {table_name} ORDER BY {column_name} DESC;`
```
mysql> SELECT * FROM employees ORDER BY fname DESC;

# Descending Order
+-----+---------+---------+------------+----------+--------+
| id  | fname   | lname   | desig      | dept     | salary |
+-----+---------+---------+------------+----------+--------+
| 102 | Sham    | Mohan   | Cashier    | Cash     |  32000 |
| 106 | Rick    | Watt    | Manager    | Accounts |  67000 |
| 101 | Raju    | Rastogi | Manager    | Loan     |  56000 |
| 104 | Paul    | Philip  | Accountant | Accounts |  45000 |
| 107 | Leena   | Jhonson | Lead       | Cash     |  34000 |
| 108 | John    | Paul    | Manager    | IT       |  77000 |
| 103 | Baburao | Apte    | Associate  | Loan     |  25000 |
| 105 | Alex    | Watt    | Associate  | Deposit  |  36000 |
| 109 | Alex    | Croft   | Probation  | Loan     |  40000 |
+-----+---------+---------+------------+----------+--------+
```
<br>

- <span span style="font-size:22px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **`LIKE:`** *Used to search for a specified pattern within a column*</span>
> `SELECT * FROM {table_name} WHERE {column_name} LIKE '%{what_you_find}%';`
```
mysql> SELECT * FROM employees WHERE fname LIKE '%sham%';

# The percent sign (%) represents zero, one, or multiple characters
+-----+-------+-------+---------+------+--------+
| id  | fname | lname | desig   | dept | salary |
+-----+-------+-------+---------+------+--------+
| 102 | Sham  | Mohan | Cashier | Cash |  32000 |
+-----+-------+-------+---------+------+--------+
```
> `SELECT * FROM {table_name} WHERE {column_name} LIKE '____';`
```
mysql> SELECT * FROM employees WHERE fname LIKE 'R___';			# Find R name with more 3 character

# The underscore sign (_) represents one, single character
+-----+-------+---------+---------+----------+--------+
| id  | fname | lname   | desig   | dept     | salary |
+-----+-------+---------+---------+----------+--------+
| 101 | Raju  | Rastogi | Manager | Loan     |  56000 |
| 106 | Rick  | Watt    | Manager | Accounts |  67000 |
+-----+-------+---------+---------+----------+--------+
```
<br>

- <span span style="font-size:22px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **`NOT LIKE:`** *Excludes rows containing patterns that match your criteria in a MySQL search*</span>
> `SELECT * FROM {table_name} WHERE {column_name} NOT LIKE '%{what_you_find}%`
```
mysql> SELECT * FROM employees WHERE fname NOT LIKE '%R%';

# Exculde all starts with R name words in a result
+-----+-------+---------+------------+----------+--------+
| id  | fname | lname   | desig      | dept     | salary |
+-----+-------+---------+------------+----------+--------+
| 102 | Sham  | Mohan   | Cashier    | Cash     |  32000 |
| 104 | Paul  | Philip  | Accountant | Accounts |  45000 |
| 105 | Alex  | Watt    | Associate  | Deposit  |  36000 |
| 107 | Leena | Jhonson | Lead       | Cash     |  34000 |
| 108 | John  | Paul    | Manager    | IT       |  77000 |
| 109 | Alex  | Croft   | Probation  | Loan     |  40000 |
+-----+-------+---------+------------+----------+--------+
```
<br>

- <span span style="font-size:22px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **`LIMIT:`** *Restricts the number of rows returned in a query result*</span>
> `SELECT * FROM {table_name} LIMIT 5;`
```
mysql> SELECT * FROM employees LIMIT 5;

# Gets all columns from a table but only returns the first 5 rows
+-----+---------+---------+------------+----------+--------+
| id  | fname   | lname   | desig      | dept     | salary |
+-----+---------+---------+------------+----------+--------+
| 101 | Raju    | Rastogi | Manager    | Loan     |  56000 |
| 102 | Sham    | Mohan   | Cashier    | Cash     |  32000 |
| 103 | Baburao | Apte    | Associate  | Loan     |  25000 |
| 104 | Paul    | Philip  | Accountant | Accounts |  45000 |
| 105 | Alex    | Watt    | Associate  | Deposit  |  36000 |
+-----+---------+---------+------------+----------+--------+
```
<br>

- <span span style="font-size:22px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **`COUNT:`** *Returns the number of rows that match a specified condition*</span>
> `SELECT COUNT(*) FROM {table_name};`
```
mysql> SELECT COUNT(*) FROM employees;

# Counts the total number of employees in the employees table
+----------+
| COUNT(*) |
+----------+
|        9 |
+----------+
```
> `SELECT COUNT({column_name}) FROM {table_name};`
```
mysql> SELECT COUNT(fname) FROM employees;

# Counts the total number of employees by there name in the employees table
+--------------+
| COUNT(fname) |
+--------------+
|            9 |
+--------------+
```
> `SELECT COUNT(DISTINCT(column_name)) FROM {table_name};`
```
mysql> SELECT COUNT(DISTINCT(dept)) FROM employees;

# Counts the number of unique values in a specific column of a table
+-----------------------+
| COUNT(DISTINCT(dept)) |
+-----------------------+
|                     5 |
+-----------------------+
```
<br>

- <span span style="font-size:22px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **`SUM:`** *Calculates the total of all VALUES in a specified numeric column*</span>
> `SELECT SUM({column_name}) FROM {table_name};`
```
mysql> SELECT SUM(salary) FROM employees;

+-------------+
| SUM(salary) |
+-------------+
|      412000 |
+-------------+
```
<br>

- <span span style="font-size:22px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **`AVG:`** *Calculates the average value of a specified numeric column*</span>
> `SELECT AVG({column_name}) FROM {table_name};`
```
mysql> SELECT AVG(salary) FROM employees;

+-------------+
| AVG(salary) |
+-------------+
|  45777.7778 |
+-------------+
```
<br>

- <span span style="font-size:22px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **`GROUP BY:`** *Groups rows that have the same VALUES in specified columns, allowing aggregate functions like **(COUNT, SUM, AVG)** to be applied to each group*</span>
> `SELECT {column_name} FROM {table_name} GROUP BY {column_name};`
```
mysql> SELECT dept FROM employees GROUP BY dept;

+----------+
| dept     |
+----------+
| Loan     |
| Cash     |
| Accounts |
| Deposit  |
| IT       |
+----------+
```
> `SELECT {column_name}, COUNT({column_name}) FROM {table_name} GROUP BY {column_name};`
```
mysql> SELECT fname, COUNT(desig) FROM employees GROUP BY fname;

+---------+--------------+
| fname   | COUNT(desig) |
+---------+--------------+
| Raju    |            1 |
| Sham    |            1 |
| Baburao |            1 |
| Paul    |            1 |
| Alex    |            2 |
| Rick    |            1 |
| Leena   |            1 |
| John    |            1 |
+---------+--------------+
```
<br>

- <span span style="font-size:22px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **`MIN:`** *Returns the smallest value of the selected column*</span>
> `SELECT MIN({column_name}) FROM {table_name};`
```
mysql> SELECT MIN(salary) FROM employees;

# Minimum salary in a employee table
+-------------+
| MIN(salary) |
+-------------+
|       25000 |
+-------------+
```
<br>

- <span span style="font-size:22px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **`MAX:`** *Returns the largest value of the selected column*</span>
> `SELECT MAX({column_name}) FROM {table_name};`
```
mysql> SELECT MAX(salary) FROM employees;

# Maximum salary in a employee table
+-------------+
| MAX(salary) |
+-------------+
|       77000 |
+-------------+
```
<br>

- <span span style="font-size:22px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **`SUB QUERIES:`** *are nested queries used within another query to perform complex data operations and filtering*</span>
> `SELECT {column_name_1}, {column_name_2}, {column_you_want_to_excute} FROM {table_name} WHERE {column_you_want_to_excute} = (SELECT SYNTAX({column_you_want_to_excute}) FROM {table_name});`
```
mysql> SELECT id, fname, salary FROM employees WHERE salary = (SELECT MAX(salary) FROM employees);

# Maximum salary employee with nama and id
+-----+-------+--------+
| id  | fname | salary |
+-----+-------+--------+
| 108 | John  |  77000 |
+-----+-------+--------+
```
<br>

## <span style="font-size:35px; display: block; margin-top: 50px;">**Data Types**</span>
- <span span style="font-size:22px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **`DECIMALS:`** *(DECIMAL 5(Total_Digit), 2(Digits_after_decimal)) = DECIMAL(5, 2) (It's work like 188.35 it's 5 digit with 2 decimal number)*</span>
> `CREATE TABLE {table_name} ({coloumn_name} DECIMAL(Total_Digit, Digits_after_decimal));`
```
mysql> CREATE TABLE num (price DECIMAL(5, 2));
```
<br>

- <span span style="font-size:22px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **`FLOAT:`** *stores approximate numerical values, suitable for general-purpose use where precision is not critical*</span>
> `CREATE TABLE {table_name} ({column_name} FLOAT);`
```
# It's save 7 Digits, takes 4 bytes of memory

mysql> CREATE TABLE num1 (price FLOAT);	

+-------+-------+------+-----+---------+-------+
| Field | Type  | Null | Key | Default | Extra |
+-------+-------+------+-----+---------+-------+
| price | float | YES  |     | NULL    |       |
+-------+-------+------+-----+---------+-------+

mysql> INSERT INTO num1 VALUES (123.1231);								# Given 7 digits its only accept 6 digits

+---------+
| price   |
+---------+
| 123.123 |
+---------+
```
<br>

- <span span style="font-size:22px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **`DOUBLE:`** *stores double-precision floating-point numbers, providing a larger range and higher precision compared to `FLOAT`*</span>
> `CREATE TABLE {table_name} ({coloumn_name} DOUBLE);`
```
# It's save 15 digits only takes 8 bytes of memory

mysql> CREATE TABLE num1 (price DOUBLE);

+-------+--------+------+-----+---------+-------+
| Field | Type   | Null | Key | Default | Extra |
+-------+--------+------+-----+---------+-------+
| price | double | YES  |     | NULL    |       |
+-------+--------+------+-----+---------+-------+

mysql> INSERT INTO num1 VALUES (123.123456789009876);		# Given 15 digits its only save and accept 14 digits;

+--------------------+
| price              |
+--------------------+
| 123.12345678900988 |
+--------------------+
```
<br>

- <span span style="font-size:22px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **`DATE:`** *Stores date values in the format **YYYY-MM-DD***</span>
> `CREATE TABLE {table_name} ({column_name} DATE);`
```
mysql> CREATE TABLE date (dt DATE);

+-------+------+------+-----+---------+-------+
| Field | Type | Null | Key | Default | Extra |
+-------+------+------+-----+---------+-------+
| dt    | date | YES  |     | NULL    |       |
+-------+------+------+-----+---------+-------+

mysql> INSERT INTO date (dt) VALUES ('2022-04-17');

+------------+
| dt         |
+------------+
| 2022-04-17 |
+------------+
```
<br>

- <span span style="font-size:22px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **`TIME:`** *Stores time values in the format **HH:MM:SS***</span>
> `CREATE TABLE {table_name} ({column_name} TIME);`
```
mysql> CREATE TABLE time (tm TIME);

+-------+------+------+-----+---------+-------+
| Field | Type | Null | Key | Default | Extra |
+-------+------+------+-----+---------+-------+
| tm    | time | YES  |     | NULL    |       |
+-------+------+------+-----+---------+-------+

mysql> INSERT INTO time (tm) VALUES ('12:06:00');

+----------+
| tm       |
+----------+
| 12:06:00 |
+----------+
```
<br>

- <span span style="font-size:22px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **`DATETIME:`** *Stores both `DATE` and `TIME` values in the format **YYYY-MM-DD HH:MM:SS***</span>
> `CREATE TABLE {table_name} ({column_name} DATETIME);`
```
mysql> CREATE TABLE datetime (dtm DATETIME);

+-------+----------+------+-----+---------+-------+
| Field | Type     | Null | Key | Default | Extra |
+-------+----------+------+-----+---------+-------+
| dtm   | datetime | YES  |     | NULL    |       |
+-------+----------+------+-----+---------+-------+

mysql> INSERT INTO datetime (dtm) VALUES ('2022-04-17 12:06:00');

+---------------------+
| dtm                 |
+---------------------+
| 2022-04-17 12:06:00 |
+---------------------+
```
<br>

- <span span style="font-size:22px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **`CURDATE:`** *Returns the current Date*</span>
> `CURDATE()`
```
mysql> INSERT INTO {table_name} VALUES (CURDATE());

+------------+
| CURDATE()  |
+------------+
| 2024-06-03 |
+------------+
```
<br>

- <span span style="font-size:22px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **`CURTIME:`** *Returns the current Time*</span>
> `CURTIME()`
```
mysql> INSERT INTO {table_name} VALUES (CURTIME());

+-----------+
| CURTIME() |
+-----------+
| 16:25:27  |
+-----------+
```
<br>

- <span span style="font-size:22px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **`NOW:`** *Returns the current Date and Time*</span>
> `NOW()`
```
mysql> INSERT INTO {table_name} VALUES (NOW());

+---------------------+
| NOW()               |
+---------------------+
| 2024-06-03 16:37:56 |
+---------------------+
```
</br>

## <span style="font-size:35px; display: block; margin-top: 50px;">**Relational Operators**</span>
- <span span style="font-size:22px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **`=`:** *Equality operator compares if two values are equal*</span>
> `SELECT * FROM {table_name} WHERE {column_name} = {string};`
```
mysql> SELECT * FROM employees WHERE salary = 56000;

+-----+-------+---------+---------+------+--------+
| id  | fname | lname   | desig   | dept | salary |
+-----+-------+---------+---------+------+--------+
| 101 | Raju  | Rastogi | Manager | Loan |  56000 |
+-----+-------+---------+---------+------+--------+
```
<br>

- <span span style="font-size:22px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **`!=`:** *Not equal to operator compares two values and returns true if they are not equal. It returns true if values are different*</span>
> `SELECT * FROM {table_name} WHERE {column_name} != {string};`
```
mysql> SELECT * FROM employees WHERE salary != 56000;

+-----+---------+---------+------------+----------+--------+
| id  | fname   | lname   | desig      | dept     | salary |
+-----+---------+---------+------------+----------+--------+
| 102 | Sham    | Mohan   | Cashier    | Cash     |  32000 |
| 103 | Baburao | Apte    | Associate  | Loan     |  25000 |
| 104 | Paul    | Philip  | Accountant | Accounts |  45000 |
| 105 | Alex    | Watt    | Associate  | Deposit  |  36000 |
| 106 | Rick    | Watt    | Manager    | Accounts |  67000 |
| 107 | Leena   | Jhonson | Lead       | Cash     |  34000 |
| 108 | John    | Paul    | Manager    | IT       |  77000 |
| 109 | Alex    | Croft   | Probation  | Loan     |  40000 |
+-----+---------+---------+------------+----------+--------+
```
<br>

- <span span style="font-size:22px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> **`>`:** *operator that checks if the value on the left is greater than the value on the right*</span>
> `SELECT * FROM {table_name} WHERE {column_name} > {string};`
```
mysql> SELECT * FROM employees WHERE salary > 45000;

+-----+-------+---------+---------+----------+--------+
| id  | fname | lname   | desig   | dept     | salary |
+-----+-------+---------+---------+----------+--------+
| 101 | Raju  | Rastogi | Manager | Loan     |  56000 |
| 106 | Rick  | Watt    | Manager | Accounts |  67000 |
| 108 | John  | Paul    | Manager | IT       |  77000 |
+-----+-------+---------+---------+----------+--------+
```
<br>

- <span span style="font-size:22px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> `Less than`: *operator that checks if the value on the left is less than the value on the right*</span>
> `SELECT * FROM {table_name} WHERE {column_name} < {string};`
```
mysql> SELECT * FROM employees WHERE salary < 56000;

+-----+---------+---------+------------+----------+--------+
| id  | fname   | lname   | desig      | dept     | salary |
+-----+---------+---------+------------+----------+--------+
| 102 | Sham    | Mohan   | Cashier    | Cash     |  32000 |
| 103 | Baburao | Apte    | Associate  | Loan     |  25000 |
| 104 | Paul    | Philip  | Accountant | Accounts |  45000 |
| 105 | Alex    | Watt    | Associate  | Deposit  |  36000 |
| 107 | Leena   | Jhonson | Lead       | Cash     |  34000 |
| 109 | Alex    | Croft   | Probation  | Loan     |  40000 |
+-----+---------+---------+------------+----------+--------+
```
<br>

- <span span style="font-size:22px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> `>=`: *operator that checks if the value on the left is greater than or equal to the value on the right*</span>
> `SELECT * FROM {table_name} WHERE {column_name} >= {string};`
```
mysql> SELECT * FROM employees WHERE salary >= 56000;

+-----+-------+---------+---------+----------+--------+
| id  | fname | lname   | desig   | dept     | salary |
+-----+-------+---------+---------+----------+--------+
| 101 | Raju  | Rastogi | Manager | Loan     |  56000 |
| 106 | Rick  | Watt    | Manager | Accounts |  67000 |
| 108 | John  | Paul    | Manager | IT       |  77000 |
+-----+-------+---------+---------+----------+--------+
```
<br>

- <span span style="font-size:22px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> `Less than=`: *operator that checks if the value on the left is less than or equal to the value on the right*</span>
> `SELECT * FROM {table_name} WHERE {column_name} <= {string};`
```
mysql> SELECT * FROM employees WHERE salary <= 56000;

+-----+---------+---------+------------+----------+--------+
| id  | fname   | lname   | desig      | dept     | salary |
+-----+---------+---------+------------+----------+--------+
| 101 | Raju    | Rastogi | Manager    | Loan     |  56000 |
| 102 | Sham    | Mohan   | Cashier    | Cash     |  32000 |
| 103 | Baburao | Apte    | Associate  | Loan     |  25000 |
| 104 | Paul    | Philip  | Accountant | Accounts |  45000 |
| 105 | Alex    | Watt    | Associate  | Deposit  |  36000 |
| 107 | Leena   | Jhonson | Lead       | Cash     |  34000 |
| 109 | Alex    | Croft   | Probation  | Loan     |  40000 |
+-----+---------+---------+------------+----------+--------+
```
<br>

## <span style="font-size:35px; display: block; margin-top: 50px;">**Logical Operators**</span>
- <span span style="font-size:22px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> `AND`: *operator combines two conditions, returning true only if both are true, otherwise false*</span>
> `Condition 1 AND Condition 2`
```
mysql> SELECT * FROM employees WHERE salary=56000 AND dept='Loan';

+-----+-------+---------+---------+------+--------+
| id  | fname | lname   | desig   | dept | salary |
+-----+-------+---------+---------+------+--------+
| 101 | Raju  | Rastogi | Manager | Loan |  56000 |
+-----+-------+---------+---------+------+--------+
```
<br>

- <span span style="font-size:22px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> `OR`: *operator combines two conditions, returning true if either or both are true, otherwise false*</span>
> `Condition 1 OR Condition 2`
```
mysql> SELECT * FROM employees WHERE salary=50000 OR dept='Accounts';

# Accounts conditions match, So its return accounts match value
+-----+-------+--------+------------+----------+--------+
| id  | fname | lname  | desig      | dept     | salary |
+-----+-------+--------+------------+----------+--------+
| 104 | Paul  | Philip | Accountant | Accounts |  45000 |
| 106 | Rick  | Watt   | Manager    | Accounts |  67000 |
+-----+-------+--------+------------+----------+--------+

mysql> SELECT * FROM employees WHERE salary=77000 OR dept='IT';

# Both conditions match
+-----+-------+-------+---------+------+--------+
| id  | fname | lname | desig   | dept | salary |
+-----+-------+-------+---------+------+--------+
| 108 | John  | Paul  | Manager | IT   |  77000 |
+-----+-------+-------+---------+------+--------+
```
<br>

- <span span style="font-size:22px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> `IN`: *operator checks if a value exists within a set of values, returning true if it does, otherwise false*</span>
> `SELECT * FROM {table_name} WHERE {column_name} IN ('String', 'String', 'String');`
```
mysql> SELECT * FROM employees WHERE dept IN ('Accounts', 'Cash', 'IT');

+-----+-------+---------+------------+----------+--------+
| id  | fname | lname   | desig      | dept     | salary |
+-----+-------+---------+------------+----------+--------+
| 102 | Sham  | Mohan   | Cashier    | Cash     |  32000 |
| 104 | Paul  | Philip  | Accountant | Accounts |  45000 |
| 106 | Rick  | Watt    | Manager    | Accounts |  67000 |
| 107 | Leena | Jhonson | Lead       | Cash     |  34000 |
| 108 | John  | Paul    | Manager    | IT       |  77000 |
+-----+-------+---------+------------+----------+--------+
```
<br>

- <span span style="font-size:22px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> `NOT IN`: *operator checks if a value does not exist within a set of values, returning true if it doesn't, otherwise false*</span>
> `SELECT * FROM {table_name} WHERE {column_name} IN ('String', 'String', 'String');`
```
mysql> SELECT * FROM employees WHERE dept NOT IN ('Loan', 'Cash');

+-----+-------+--------+------------+----------+--------+
| id  | fname | lname  | desig      | dept     | salary |
+-----+-------+--------+------------+----------+--------+
| 104 | Paul  | Philip | Accountant | Accounts |  45000 |
| 105 | Alex  | Watt   | Associate  | Deposit  |  36000 |
| 106 | Rick  | Watt   | Manager    | Accounts |  67000 |
| 108 | John  | Paul   | Manager    | IT       |  77000 |
+-----+-------+--------+------------+----------+--------+
```
<br>

- <span span style="font-size:22px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> `BETWEEN`: *operator in MySQL allows you to search for values within a specific range*</span>
> `SELECT * FROM {table_name} WHERE {column_name} BETWEEN {string or number} AND {string or number};`
```
mysql> SELECT * FROM employees WHERE salary BETWEEN 40000 AND 60000;

+-----+-------+---------+------------+----------+--------+
| id  | fname | lname   | desig      | dept     | salary |
+-----+-------+---------+------------+----------+--------+
| 101 | Raju  | Rastogi | Manager    | Loan     |  56000 |
| 104 | Paul  | Philip  | Accountant | Accounts |  45000 |
| 109 | Alex  | Croft   | Probation  | Loan     |  40000 |
+-----+-------+---------+------------+----------+--------+
```
<br>

- <span span style="font-size:22px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> `CASE`: *performs conditional logic within queries, returning different results based on specified conditions*</span>
> `SELECT {colum_name} CASE WHEN {condition} END FROM {table_name};`
```
mysql> SELECT fname, salary, CASE WHEN salary >= 50000 THEN 'Higher Salary' ELSE 'Low Salary' END AS 'Salary Category' FROM employees;

+---------+--------+-----------------+
| fname   | salary | Salary Category |
+---------+--------+-----------------+
| Raju    |  56000 | Higher Salary   |
| Sham    |  32000 | Low Salary      |
| Baburao |  25000 | Low Salary      |
| Paul    |  45000 | Low Salary      |
| Alex    |  36000 | Low Salary      |
| Rick    |  67000 | Higher Salary   |
| Leena   |  34000 | Low Salary      |
| John    |  77000 | Higher Salary   |
| Alex    |  40000 | Low Salary      |
+---------+--------+-----------------+


mysql> SELECT fname, salary, CASE WHEN salary >= 50000 THEN 'Higher Salary' WHEN salary >= 40000 AND salary < 50000 THEN 'Mid Salary' ELSE 'Low Salary' END AS 'Salary Category' FROM employees;

+---------+--------+-----------------+
| fname   | salary | Salary Category |
+---------+--------+-----------------+
| Raju    |  56000 | Higher Salary   |
| Sham    |  32000 | Low Salary      |
| Baburao |  25000 | Low Salary      |
| Paul    |  45000 | Mid Salary      |
| Alex    |  36000 | Low Salary      |
| Rick    |  67000 | Higher Salary   |
| Leena   |  34000 | Low Salary      |
| John    |  77000 | Higher Salary   |
| Alex    |  40000 | Mid Salary      |
+---------+--------+-----------------+
```
<br>

- <span span style="font-size:22px; vertical-align: middle;line-height: 1; margin-bottom: 0;"> `IS NULL`: *checks if a column's value is NULL, identifying rows with missing or undefined values*</span>
> `SELECT * FROM {table_name} WHERE {column_name} IS NULL;`
```
mysql> SELECT * FROM employees WHERE fname IS NULL;
```
