USE lab_mysql;

UPDATE customers
SET email = 'ppicasso@gmail.com'
WHERE customer_id = '10001';

UPDATE customers
SET email = 'lincoln@us.gov'
WHERE customer_id = '20001';

UPDATE customers
SET email = 'hello@napoleon.me'
WHERE customer_id = '30001';

SELECT * FROM customers;

UPDATE sales_persons
SET store = 'Miami'
WHERE staff_id= '00005';

SELECT * FROM sales_persons;
