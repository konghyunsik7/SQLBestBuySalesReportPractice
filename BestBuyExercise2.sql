/* joins: select all the computers from the products table:

using the products table and the categories table, return the product name and the category name */
SELECT * FROM products p
INNER JOIN categories c
on p.CategoryID = c.CategoryID
WHERE c.Name = 'computers';
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT p.Name, p.Price, r.Rating
FROM products p
INNER JOIN reviews r
ON r.ProductID = p.ProductID
WHERE r.Rating = 5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */

SELECT e.FirstName, e.LastName, sum(s.Quantity) as Result FROM sales as s
INNER JOIN employees e  
ON e.EmployeeID = s.EmployeeID
GROUP BY e.EmployeeID
order by Result DESC
limit 2;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT d.Name as 'Department Name' , c.Name as 'Category Name'
FROM categories c
INNER JOIN departments d
ON d.DepartmentID = c.DepartmentID
WHERE c.Name = "Appliances" OR c.Name = "Games";


/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
 
 SELECT p.Name AS 'Product Name', s.Quantity AS 'Total Sold', Sum(s.PricePerUnit * s.Quantity) as 'Total Price'
 FROM products p
 INNER JOIN sales s
 ON p.ProductID = s.ProductID
 WHERE p.ProductID = 97;
 

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT p.Name, r.Reviewer, min(r.Rating), r.Comment
FROM products p
INNER JOIN reviews r
ON p.ProductID = r.ProductID
WHERE p.ProductID = 857
LIMIT 1;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */

SELECT e.EmployeeID, e.FirstName, e.LastName, p.Name, Sum(s.Quantity),p.ProductID
FROM employees e
INNER JOIN sales s
ON e.EmployeeID= s.EmployeeID 
INNER JOIN products p
ON s.ProductID = p.ProductID
GROUP BY employeeID,ProductID
order by e.FirstName;


