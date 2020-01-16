/*
	SQL QUERIES FOR MULTIPLE TABLES

	Written by John Gough | 01.15.2020

*/

-- If you ever need to search for metadata in your database, 
-- you can query the Information Schema as follows:

SELECT * 
FROM INFORMATION_SCHEMA.COLUMNS
WHERE COLUMN_NAME like '%CUSTOMER%';

SELECT * 
FROM INFORMATION_SCHEMA.TABLES;

USE econ100_northwin;

-- To begin lets build a query starting from a single table
-- this table gives information about orders at an
-- aggregate level.

-- We say the 'grain' of this table is the 
-- Order.

SELECT OrderID,
		CustomerID,
        EmployeeID,
        OrderDate,
        RequiredDate,
        ShippedDate,
        ShipVia,
        Freight,
        ShipName,
        ShipAddress,
        ShipCity,
        ShipRegion,
        ShipPostalCode,
        ShipCountry
FROM Orders;

-- Another query from a single table.
-- the grain of this table is the ProductID.
-- We could think of this as the order's
-- line items.

-- This is a linking table. We would say that
-- this table has a many to many relationship
-- between orders and products.

select 	OrderID,
		ProductID,
        UnitPrice,
        Quantity,
        Discount
from OrderDetails;

-- This is another single table query.
-- This one has a grain of ProductID, and 
-- is an entity table  instead of a 
-- relationship table unlike OrderDetails.

select 	ProductID,
		ProductName,
        SupplierID,
        CategoryID,
        QuantityPerUnit,
        UnitPrice,
        UnitsInStock,
        UnitsOnOrder,
        ReorderLevel,
        Discontinued
from Products;

-- This query joins orders to their
-- line items using an inner join

select *
from Orders O
	inner join OrderDetails D
		on O.OrderID = D.OrderID;

-- You'll notice that OrderID now
-- appears twice in the result set.
-- You can also execute this query
-- by simply typing join - as demonstrated
-- below:

select *
from Orders O
	join OrderDetails D
		on O.OrderID = D.OrderID;

-- This query joins orders to their line
-- items to their product descriptions:

select *
from Orders O
	join OrderDetails D
		on O.OrderID = D.OrderID
	join Products P
		on D.ProductID = P.ProductID;
        
-- I now have a completely flat result set.
-- There is some duplication to be aware of
-- in that primary keys are brought in when you
-- ask for the complete result set using *.

-- I can further complete this result set by 
-- joining supplier and category information as
-- shown below:

select *
from Orders O
	join OrderDetails D
		on O.OrderID = D.OrderID
	join Products P
		on D.ProductID = P.ProductID
	join Suppliers S
		on P.SupplierID = S.SupplierID
	join Categories C
		on P.CategoryID = C.CategoryID;
        
-- Using a left join I can match all
-- customer to all of their orders - 
-- without losing individuals who may not 
-- have placed an order.

select *
from Customers C
	left join Orders O 
		on C.CustomerID = O.CustomerID;
        
-- I can check and see who those entities are
-- in the database that have not made an order 
-- by using a where clause as follows:

select *
from Customers C
	left join Orders O 
		on C.CustomerID = O.CustomerID
where O.OrderID is null;

-- This shows me that I have four records that
-- are unassociated with any orders.

-- A quick word on the group by clause

select City, count(*)
from Customers
group by city
having count(*) > 1
order by count(*) desc;
-- make groups in your results set





