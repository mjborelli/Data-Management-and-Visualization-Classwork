/*
	SQL QUERIES FOR SINGLE TABLES

	Written by John Gough | 13.01.2020

*/

-- Example of a Select Statement
-- Watch your spelling - MySQL is also
-- case sensitive when it comes to column and
-- table names. Check those first if you
-- get an error message.

select *
from Employees
where LastName like 'C%';

-- A select statement which returns orders between the given
-- dates, ordering them by date.

select *
from Orders
-- where OrderDate = '05/06/1998' DOESN'T WORK because wrong format
where OrderDate between '1990-01-01' and '2000-06-01'
order by OrderDate desc;

-- A select statement which returns an empty result set.

select *
from Orders
where OrderDate < '2000-01-01'; -- =! for NOT EQUAL

-- A select statement which returns an actors full name.

select EmployeeID, concat(FirstName, ' ', LastName) -- as Full_Name
from  Employees;

-- A select statement which renames the columns of a result set.

select Description as Category_Description
from Categories;

-- A select statement which doesn't have a calculated column name.

select concat(FirstName, ' ', LastName)
from Employees;

-- A select statement with a calculated  column using arithmetic 
-- operators.


select OrderID, ProductID, ((Unitprice - Discount) * Quantity) as Line_Item_Total
from OrderDetails;

-- A select statement with a calculated  column using arithmetic 
-- operators, using parentheses to control the sequence of operations.

select (10 + 5)/2;

select (10 + 5)/2
from dual; -- SQL doesn't require a FROM statement, things like Oracle might

-- A select statement using the left function to return the first
-- four digits on the left of the date as the year.

select OrderDate, left(OrderDate,4) as Order_Year
from Orders;

-- A select statement that rounds an decimal to a whole number.

select Freight, round(Freight) as Freight_Rounded
from Orders;

-- A select statement which transforms the order date from one format
-- to another. 

select OrderDate, date_format(Orderdate, '%m/%d/%y') as 'MM/DD/YYYY'
from Orders;

-- Two queries about vendor city and state. One returns all city and state
-- rows, the other only the distinct pairings, de-duping the results

select City
from Customers
where City = 'Sao Paulo';

select distinct City, PostalCode
from Customers
where City = 'Sao Paulo';

-- A select statement which uses the logical opperator 'or'.

select *
from Territories
where TerritoryDescription like 'Westboro%' 
	or TerritoryDescription like 'Bedford%'
    -- and something; would change meaning

-- A select statement with a compound condition.

select 	D.*, 
		((Unitprice - Discount) * Quantity) as Line_Item_Total
from OrderDetails D
where ((Unitprice - Discount) * Quantity) > 1000;

-- A select statement with an example of an IN phrase.

select *
from Products
where CategoryID in (1,5,6)
order by CategoryID;

-- A select statement with an example of a NOT IN phrase.

select *
from Products
where CategoryID not in (1,5,6)
order by CategoryID;

-- A select statement with a between phrase.

select OrderDate, date_format(Orderdate, '%m/%d/%y') as 'MM/DD/YYYY'
from Orders
where OrderDate between '1997-01-01' and '1997-06-01';

-- A select statement with a NOT between phrase.

select OrderDate, date_format(Orderdate, '%m/%d/%y') as 'MM/DD/YYYY'
from Orders
where OrderDate not between '1997-01-01' and '1997-06-01';

-- A select statement with a LIKE phrase.

select *
from Customers
where PostalCode like '05%';

-- A select statement which returns NULLS

select *
from Customers
where Fax is null;

-- A select statement which excludes  NULLS

select *
from Customers
where Fax is not null;

-- A select statement with an ORDER BY clause that
-- sorts by one column ascending. (Default)

select *
from Products
order by UnitPrice asc;

-- A select statement with an ORDER BY clause that
-- sorts by one column descending.

select *
from Products
order by UnitPrice desc;

-- REGEX, returns any address with the string 'dr'. 

select *
from Customers
where Address regexp 'dr';

select *
from Customers
where Address like '%dr%';

-- REGEX, returns any address where the string begins with '1'.

select *
from Customers
where address regexp '^1';

-- REGEX, returns any address where the string ends with 'ne'.

select *
from Customers
where address regexp 'ne$';

-- REGEX, returns any address where the string contains 'ne' or 'dr'.

select *
from Customers
where address regexp 'ne|dr'; -- can add karats to this!

-- REGEX, returns any address where the string contains either
-- 'be' or 'ba'.

select *
from Customers
where address regexp 'b[ea]';

-- REGEX, returns any address where the string contains either
-- 'm' + any letter m through z.

select *
from Customers
where address regexp 'm[m-z]';


-- REGEX, returns any city that ends with an 'n' preceded by a vowel
-- and at least one other letter.

select *
from Customers
where City regexp '[a-z][aeiou]n$';


