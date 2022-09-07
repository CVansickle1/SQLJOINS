/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
 SELECT * FROM products 
 LEFT JOIN categories ON products.CategoryID = categories.CategoryID
 WHERE products.CategoryID = 1;
 
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 SELECT p.name, p.price, r.rating FROM
 products AS p
 INNER JOIN reviews AS r ON p.ProductID = r.ProductID
 WHERE r.Rating = 5;
 
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT employees.FirstName, employees.EmployeeID, SUM(sales.PricePerUnit * sales.Quantity) AS Total FROM employees
INNER JOIN sales ON sales.EmployeeID = employees.EmployeeID
group by EmployeeID
ORDER BY Total DESC;


/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT * FROM departments
LEFT JOIN categories ON categories.DepartmentID = departments.DepartmentID;

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
SELECT products.Name, SUM(sales.Quantity) AS "total # sold", SUM(sales.PricePerUnit) AS "Total Price" FROM products
LEFT JOIN sales ON products.ProductID = sales.ProductID
WHERE products.Name LIKE '%Eagles: Hotel%'; 

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT products.Name, reviews.Reviewer, reviews.rating, reviews.Comment FROM products
LEFT JOIN reviews ON products.ProductID = reviews.ProductID
WHERE products.Name LIKE "%visio%" AND Rating = 1;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */


SELECT e.employeeID, e.FirstName, e.LastName,  p.Name, s.Quantity FROM employees AS e
LEFT JOIN sales AS s ON s.EmployeeID = e.EmployeeID
INNER JOIN products AS p ON p.ProductID = s.ProductID
ORDER BY e.firstname;