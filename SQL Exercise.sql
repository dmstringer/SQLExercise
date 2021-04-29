-- find all products --
select * from products;

-- find all products that cost $1400
select * from products where Price = 1400;

-- find all products that cost $11.99 or $13.99
select * from products where Price = 11.99 or Price = 13.99;

-- find all products that do NOT cost 11.99 - using NOT
select * from products where not Price = 11.99;

-- find  all products and sort them by price from greatest to least
select * from products order by Price desc;

-- find all employees who don't have a middle initial
select * from employees where MiddleInitial is null;

-- find distinct product prices
select distinct price from products;

-- find all employees whose first name starts with the letter ‘j’
select * from employees where firstname like 'j%';

-- find all Macbooks --
select * from products where Name like '%macbook%';

-- find all products that are on sale
select * from products where OnSale = true;

-- find the average price of all products --
select avg(Price) from products;

-- find all Geek Squad employees who don't have a middle initial 
select * from employees where Title = 'Geek Squad' and MiddleInitial is null;

-- find all products from the products table whose stock level is in the range  
-- of 500 to 1200. Order by Price from least to greatest. **Try this with the -- between keyword**
select * from products where StockLevel between 500 and 1200 order by Price;

-- joins: select all the computers from the products table:
-- using the products table and the categories table, return the product name and the category name
select p.name as 'Product Name', c.Name as 'Category Name'
from products as p
inner join categories as c
on p.CategoryID = c.CategoryID and c.Name = 'computers';

-- joins: find all product names, product prices, and products ratings that have a rating of 5
select p.name as 'Product Name', p.price as 'Product Price', r.rating as 'Product Rating'
from products as p
inner join reviews as r
on p.ProductID = r.ProductID and r.Rating = 5;

-- joins: find the employee with the most total quantity sold.  use the sum() function and group by
select SUM(s.Quantity) as 'Quantity', e.FirstName, e.LastName
from sales as s 
inner join employees as e
on e.EmployeeID = s.EmployeeID
group by s.EmployeeID
order by SUM(s.Quantity) desc;

-----------------------------------------------------------------
-- joins: find the name of the department, and the name of the category for Appliances and Games
select d.Name as 'Department Name', c.Name as 'Catagory Name'
from departments as d
inner Join categories as c
on d.DepartmentID = c.DepartmentID and c.Name = 'Appliances' or c.Name = 'Games';

-- joins: find the product name, total # sold, and total price sold,
-- for Eagles: Hotel California --You may need to use SUM()
select p.Name as 'Product Name',  sum(s.Quantity) as 'Total # Sold', (s.PricePerUnit * sum(s.Quantity)) as 'Total Price Sold'
from products as p
inner join sales as s
on p.ProductID = s.ProductID and p.Name = 'Eagles: Hotel California';

-- joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!)
select p.Name as 'Product Name', r.Reviewer as 'Reviewer Name', r.Rating as 'Rating', r.Comment
from products as p
inner join reviews as r
on p.ProductID = r.ProductID and p.Name = 'Visio TV'
order by r.Rating limit 1;

-------------------------------------------- Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */
select e.EmployeeID, e.FirstName, e.LastName, p.Name as 'Product Name', s.Quantity
from employees as e
inner join sales as s
on e.EmployeeID = s.EmployeeID
inner join products as p
on p.ProductID = s.ProductID
order by e.LastName;