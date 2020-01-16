-- Q1 (can do left joins here as well)
select count(distinct C.CustomerID)
  from Customers C
     join Orders O
         on C.CustomerID = O.CustomerID
	 join OrderDetails OD
		 on OD.OrderID = O.OrderID
	 join Products P
		 on P.ProductID = OD.ProductID
where ProductName = 'Chartreuse Verte';


-- Q2 (all you need is the product ID

select P.ProductName, count(P.ProductName)
    from Products P
       join OrderDetails OD
		 on P.ProductID = OD.ProductID
       join Orders O
		 on OD.OrderID = O.OrderID
group by P.ProductName
order by count(P.ProductName) desc
Limit 1;

-- Q3

Select distinct(concat(E.FirstName, ' ', E.Lastname))
   from Employees E
      join Orders O
         on E.EmployeeID = O.EmployeeID
	 join Customers C
         on C.CustomerID = O.CustomerID
	Where C.CompanyName = 'Du monde entier';

-- Q4

Select distinct(concat(E.FirstName, ' ', E.Lastname)), sum(OD.UnitPrice * OD.Quantity)
   from Employees E
      join Orders O
        on E.EmployeeID = O.EmployeeID
      join OrderDetails OD
		 on OD.OrderID = O.OrderID
	 join Products P
		 on P.ProductID = OD.ProductID
where P.ProductName = 'Outback Lager' and E.FirstName = 'Anne'
group by E.EmployeeID;

-- Q5
select distinct(S.CompanyName) -- P.ProductName is how you'd get the products (also distinctify the company name for supplier)
    from Suppliers S
	   join Products P
		 on S.SupplierID = P.SupplierID
       join OrderDetails OD
		 on P.ProductID = OD.ProductID
       join Orders O
		 on OD.OrderID = O.OrderID
	   join Customers C
         on C.CustomerID = O.CustomerID
where C.CompanyName = 'Save-A-Lot Markets';
