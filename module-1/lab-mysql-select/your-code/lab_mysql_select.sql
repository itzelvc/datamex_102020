/*CREATE DATABASE lab_mysql_select;

USE lab_mysql_select;*/

/* ---------------------------------------------------------------------------------------------------
                                     Visualizar tablas
 ---------------------------------------------------------------------------------------------------*/       

SELECT * FROM authors;

SELECT * FROM discounts;

SELECT * FROM employee;

SELECT * FROM jobs;

SELECT * FROM pub_info;

SELECT * FROM publishers;

SELECT * FROM roysched;

SELECT * FROM sales;

SELECT * FROM stores;

SELECT * FROM titleauthor;

SELECT * FROM titles;

/* ---------------------------------------------------------------------------------------------------
                                      Challenge 1
 ---------------------------------------------------------------------------------------------------*/                                  
/* La tabla titleauthor tiene 25 registros */
SELECT COUNT(*) FROM titleauthor;

SELECT a.au_id AS 'AUTHOR ID', a.au_lname AS 'LAST NAME', a.au_fname AS 'FIRST NAME', t.title AS 'TITLE', p.pub_name AS 'PUBLISHER'
FROM authors AS a 
INNER JOIN titleauthor AS ta ON a.au_id = ta.au_id
INNER JOIN titles AS t ON ta.title_id = t.title_id
INNER JOIN publishers AS p ON t.pub_id = p.pub_id
ORDER BY a.au_id;

/* Comprobar que sean 25 registros */
SELECT COUNT(*) FROM
(SELECT a.au_id AS 'AUTHOR ID', a.au_lname AS 'LAST NAME', a.au_fname AS 'FIRST NAME', t.title AS 'TITLE', p.pub_name AS 'PUBLISHER'
FROM authors AS a 
INNER JOIN titleauthor AS ta ON a.au_id = ta.au_id
INNER JOIN titles AS t ON ta.title_id = t.title_id
INNER JOIN publishers AS p ON t.pub_id = p.pub_id
ORDER BY a.au_id) AS C;

/* ---------------------------------------------------------------------------------------------------
                                      Challenge 2
 ---------------------------------------------------------------------------------------------------*/       
SELECT a.au_id AS 'AUTHOR ID', a.au_lname AS 'LAST NAME', a.au_fname AS 'FIRST NAME', p.pub_name AS 'PUBLISHER', COUNT(title) AS 'TITLE_COUNT'
FROM authors AS a 
INNER JOIN titleauthor AS ta ON a.au_id = ta.au_id
INNER JOIN titles AS t ON ta.title_id = t.title_id
INNER JOIN publishers AS p ON t.pub_id = p.pub_id
GROUP BY a.au_id, a.au_lname, a.au_fname,  p.pub_name
ORDER BY a.au_id DESC, p.pub_name DESC;

/*Comprobar que la suma sea 25*/
SELECT SUM(TITLE_COUNT)
FROM 
(SELECT a.au_id AS 'AUTHOR ID', a.au_lname AS 'LAST NAME', a.au_fname AS 'FIRST NAME', p.pub_name AS 'PUBLISHER', COUNT(title) AS 'TITLE_COUNT'
FROM authors AS a 
INNER JOIN titleauthor AS ta ON a.au_id = ta.au_id
INNER JOIN titles AS t ON ta.title_id = t.title_id
INNER JOIN publishers AS p ON t.pub_id = p.pub_id
GROUP BY a.au_id, a.au_lname, a.au_fname,  p.pub_name
ORDER BY a.au_id DESC, p.pub_name DESC) AS COMP;

/* ---------------------------------------------------------------------------------------------------
                                      Challenge 3
 ---------------------------------------------------------------------------------------------------*/
 SELECT a.au_id AS 'AUTHOR ID', a.au_lname AS 'LAST NAME', a.au_fname AS 'FIRST NAME', SUM(s.qty) AS TOTAL
 FROM authors AS a
 INNER JOIN titleauthor AS ta ON a.au_id = ta.au_id
 INNER JOIN sales AS s ON ta.title_id = s.title_id
 GROUP BY  a.au_id
 ORDER BY TOTAL DESC
 LIMIT 3;
 
 /* ---------------------------------------------------------------------------------------------------
                                      Challenge 4
 ---------------------------------------------------------------------------------------------------*/
SELECT a.au_id AS 'AUTHOR ID', a.au_lname AS 'LAST NAME', a.au_fname AS 'FIRST NAME', IFNULL(SUM(s.qty), 0) AS TOTAL
FROM authors AS a
LEFT JOIN titleauthor AS ta ON a.au_id = ta.au_id
LEFT JOIN sales AS s ON ta.title_id = s.title_id
GROUP BY  a.au_id
ORDER BY TOTAL DESC
LIMIT 23;