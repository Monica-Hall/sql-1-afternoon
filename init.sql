-- 1. Create a table called person that records a person's id, name, age, height ( in cm ), city, favorite_color.
    -- 2. id should be an auto-incrementing id/primary key - Use type: SERIAL

CREATE TABLE person (
  id SERIAL PRIMARY KEY,
  name TEXT,
  age INT, 
  height DEC, 
  city VARCHAR(35),
  favorite_color VARCHAR(25)
); 


-- 3. Add 5 different people into the person database.
    -- 4. Remember to not include the person_id because it should auto-increment.

INSERT INTO person (name, age, height , city, favorite_color)
VALUES
('Monica', 33, 162.56, 'Phoenix', 'Black'), 
('Jess', 42, 165.56, 'Scottdale', 'Purple'), 
('Kai', 44, 185.42, 'Irvine', 'Blue'), 
('Damon', 39, 184.44, 'Orange', 'Red'), 
('Jake', 40, 181.55, 'Tustin', 'Gold'); 


-- 5. List all the people in the person table by height from tallest to shortest.
SELECT * FROM person ORDER BY height DESC; 

-- 6. List all the people in the person table by height from shortest to tallest.
SELECT * FROM person ORDER BY height; 

-- 7. List all the people in the person table by age from oldest to youngest.
SELECT * FROM person ORDER BY age DESC; 

-- 8. List all the people in the person table older than age 20.
SELECT * FROM person WHERE age > 20; 

-- 9. List all the people in the person table that are exactly 18.
SELECT * FROM person WHERE age = 18; 

-- 10. List all the people in the person table that are less than 20 and older than 30.
SELECT * FROM person WHERE age < 20 AND age > 30; 

-- 11. List all the people in the person table that are not 27 (Use not equals).
SELECT * FROM person WHERE age != 27; 

-- 12. List all the people in the person table where their favorite color is not red.
SELECT * FROM person WHERE favorite_color != 'Red'; 

-- 13. List all the people in the person table where their favorite color is not red and is not blue.
SELECT * FROM person 
WHERE favorite_color != 'Red' AND favorite_color != 'Blue';

-- 14. List all the people in the person table where their favorite color is orange or green.
 SELECT * FROM person 
 WHERE favorite_color = 'Orange' OR favorite_color = 'Green'; 

-- 15. List all the people in the person table where their favorite color is orange, green or blue (use IN).
 SELECT * FROM person 
 WHERE favorite_color IN ('Orange', 'Green', 'Blue'); 

-- 16. List all the people in the person table where their favorite color is yellow or purple (use IN).
 SELECT * FROM person 
 WHERE favorite_color IN ('Yellow', 'Purple');



 -- ---------------------------- ORDERS ------------------------------
 
-- 1. Create a table called orders that records: order_id, person_id, product_name, product_price, quantity.
CREATE TABLE orders (
order_id SERIAL PRIMARY KEY, 
person_id INT, 
product_name TEXT, 
product_price NUMERIC, 
quantity INT
); 

-- 2. Add 5 orders to the orders table.
    -- Make orders for at least two different people.
    -- person_id should be different for different people.
INSERT INTO orders 
(person_id, product_name, product_price, quantity) 
VALUES 
(1, 'Eggs', 5.25, 2), 
(2, 'Coffee', 2.25, 1), 
(3, 'French Toast', 6.50, 3), 
(4, 'Pancakes', 7.50, 4), 
(5, 'Burrito', 5.50, 1);

-- 3. Select all the records from the orders table.
SELECT * FROM orders;

-- 4. Calculate the total number of products ordered.
SELECT SUM(quantity) FROM orders;

-- 5. Calculate the total order price.
SELECT SUM(product_price * quantity) FROM orders;

-- 6. Calculate the total order price by a single person_id.
SELECT SUM(product_price * quantity) FROM orders WHERE person_id = 3;



-- ---------------------------- ARTIST ------------------------------

-- 1. Add 3 new artists to the artist table. ( It's already created )
INSERT INTO artist (name) 
VALUES 
('Fall Out Boy'), 
('Paramore'), 
('PANIC! At the Disco'); 

-- 2. Select 10 artists in reverse alphabetical order.
SELECT * FROM artist ORDER BY name DESC LIMIT 10;

-- 3. Select 5 artists in alphabetical order.
SELECT * FROM artist ORDER BY name LIMIT 5;

-- 4. Select all artists that start with the word 'Black'.
SELECT * FROM artist WHERE name LIKE 'Black%';

-- 5. Select all artists that contain the word 'Black'.
SELECT * FROM artist WHERE name LIKE '%Black%';



-- ---------------------------- Invoice ------------------------------

-- 1. List all employee first and last names only that live in Calgary.
SELECT first_name, last_name FROM employee WHERE city = 'Calgary';

-- 2. Find the birthdate for the youngest employee.
SELECT MAX(birth_date) from employee;

-- 3. Find the birthdate for the oldest employee.
SELECT MIN(birth_date) from employee;

-- 4. Find everyone that reports to Nancy Edwards (Use the ReportsTo column).
    -- You will need to query the employee table to find the Id for Nancy Edwards
SELECT * FROM employee WHERE reports_to = 2;

-- 5. Count how many people live in Lethbridge.
SELECT COUNT(*) FROM employee WHERE city = 'Lethbridge';



-- ---------------------------- ARTIST ------------------------------

-- 1. Count how many orders were made from the USA.
SELECT COUNT(*) FROM invoice WHERE billing_country = 'USA';

-- 2. Find the largest order total amount.
SELECT MAX(total) FROM invoice;

-- 3. Find the smallest order total amount.
SELECT MIN(total) FROM invoice;

-- 4. Find all orders bigger than $5.
SELECT * FROM invoice WHERE total > 5;

-- 5. Count how many orders were smaller than $5.
SELECT COUNT(*) FROM invoice WHERE total < 5;

-- 6. Count how many orders were in CA, TX, or AZ (use IN).
SELECT COUNT(*) FROM invoice WHERE billing_state in ('CA', 'TX', 'AZ');

-- 7. Get the average total of the orders.
SELECT AVG(total) FROM invoice;

-- 8. Get the total sum of the orders.
SELECT SUM(total) FROM invoice;
