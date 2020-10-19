CREATE DATABASE lab_mysql;
USE lab_mysql;

SHOW TABLES;

/* Crear la tabla cars*/
CREATE TABLE cars(
car_id INT AUTO_INCREMENT,
vin VARCHAR(17),
manufacturer VARCHAR(20),
model VARCHAR(20),
year YEAR,
color VARCHAR(20),
PRIMARY KEY (car_id));

SELECT * FROM cars;

/* Crear tabla Customers*/
CREATE TABLE customers(
customer_id VARCHAR(20),
name VARCHAR(30),
phone VARCHAR(20),
email VARCHAR(20),
address VARCHAR(50),
city VARCHAR(20),
state_province VARCHAR(20),
country VARCHAR(20),
postal INT,
PRIMARY KEY (customer_id));

/*Crear tabla  sales_persons*/
CREATE TABLE sales_persons(
staff_id VARCHAR(20),
name VARCHAR(20),
store VARCHAR(20),
PRIMARY KEY (staff_id));

/*Crear tabla invoices*/
CREATE TABLE invoices (
invoice_number INT,
date DATE,
car_id INT,
customer_id VARCHAR(20),
staff_id VARCHAR(20),
PRIMARY KEY (invoice_number));


#drop table invoices, cars, customers, sales_persons;




