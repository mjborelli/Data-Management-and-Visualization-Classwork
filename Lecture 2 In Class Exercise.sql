-- Matthew Borelli and Ian McBride

-- Q1: How Many Product Categories Exist in the NorthWind Database
select distinct CategoryName
from Categories;

-- Q2 
select BirthDate
from Employees;

-- Q3 DONT just use name as the primary key
Select FirstName, Salary
from Employees
where FirstName = 'Nancy';

-- Q4
Select max(OrderDate)
from Orders;

-- Q5
Select ShipCity
from Orders
where ShipCity = 'Charleroi';

-- Q6
Select CustomerID, Phone
from Customers
where Phone is null;

-- Q7
Select concat(FirstName, ' ' , LastName) as Full_Name, concat(Address, ', ', City, ', ', PostalCode, ', ', Country) as Full_Address
From  Employees;

-- Q8
Select *
from Orders
Where ShippedDate >= '1997-01-01'
order by ShippedDate;

-- QB alternatively
select min(ShippedDate)
from Orders
where left(ShippedDate, 4) = 1997

-- Q9
Select CompanyName, City
from Suppliers
where City = 'Paris';

-- Q10
Select distinct Country
from Suppliers;
-- use count
Select count(distinct PostalCode)
from Suppliers
Where Country = 'USA';

-- Q11 make sure to look at how the data is stored
Select ContactName
from Customers
where ContactName like '%Tan%';

-- Q12
Select EmployeeID, TerritoryID
from EmployeeTerritories
where EmployeeID = '4';