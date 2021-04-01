use AdventureWorks2019
--What is a result set? 
An SQL result set is a set of rows from a database, as well as metadata about the query such as the column names, and the types and sizes of each column. Depending on the database system, the number of rows in the result set may or may not be known.

--What is the difference between Union and Union All? 

union can not be used with recursive CTE but union all can be used with recursive CTEunion will give the unique records but union all gives duplicate tounion will sort the resultset based on the first column of the first select statement but union all will notunion is slower than union all
--What are the other Set Operators SQL Server has? 
UNION, UNION ALL, INTERSECT, EXCEPT

--What is the difference between Union and Join? 
JOIN combines data from many tables based on a matched condition between them. where as SQL combines the result-set of two or more SELECT statements.
Number of columns selected from each table may not be same. where as Number of columns selected from each table should be same.
Datatypes of corresponding columns selected from each table can be different.where as Datatypes of corresponding columns selected from each table should be same.

--What is the difference between INNER JOIN and FULL JOIN? 
Inner join returns only the matching rows between both the tables, non matching rows are eliminated where as Full Join or Full Outer Join returns all rows from both the tables (left & right tables), including non-matching rows from both the tables.

--What is difference between left join and outer join 
Left join is a kind of outer join. Left outer join will return all rows from left query, even if there are unmatched data. There are another two kinds of outer joins, which are right join and full join.  


--What is cross join? 
The CROSS JOIN is used to generate a paired combination of each row of the first table with each row of the second table. This join type is also known as cartesian join.

--What is the difference between WHERE clause and HAVING clause? 
The WHERE clause is used in the selection of rows according to given conditions whereas the HAVING clause is used in column operations and is applied to aggregated rows or groups. If GROUP BY is used then it is executed after the WHERE clause is executed in the query

--Can there be multiple group by columns? 
yes

--How many products can you find in the Production.Product table? 
 select count(*) from Production.product 

 -- 2 Write a query that retrieves the number of products in the Production.Product table that are included in a subcategory. The rows that have NULL in column ProductSubcategoryID are considered to not be a part of any subcategory. 
  select count(*) from Production.product where productsubcategoryId is not null

  /* 3
How many Products reside in each SubCategory? Write a query to display the results with the following titles.   */
Select distinct productsubcategoryId, count(*) as CountedProducts from Production.product
group by productsubcategoryId

--4 How many products that do not have a product subcategory.
select count(*) from Production.product where productsubcategoryId is null

--5 Write a query to list the summary of products in the Production.ProductInventory table. 
select [ProductID], sum(Quantity) as thesum from Production.ProductInventory 
Group by ProductID

--6 Write a query to list the summary of products in the Production.ProductInventory table and LocationID set to 40 and limit the result to include just summarized quantities less than 100. 
select [ProductID], sum(Quantity) as thesum   from Production.ProductInventory where LocationID =40 and quantity < 100
Group by ProductID

--7 Write a query to list the summary of products with the shelf information in the Production.ProductInventory table and LocationID set to 40 and limit the result to include just summarized quantities les s than 100 
select [Shelf],[ProductID], sum(Quantity) as thesum   from Production.ProductInventory where LocationID =40 and quantity < 100
Group by ProductID , shelf

-- 8 Write the query to list the average quantity for products where column LocationID has the value of 10 from the table Production.ProductInventory table. 
select [ProductID], avg(Quantity) as theAVG   from Production.ProductInventory where LocationID =10 
Group by ProductID

-- 9 Write query  to see the average quantity  of  products by shelf  from the table Production.ProductInventory 
select [ProductID],[Shelf], avg(Quantity) as theAVG   from Production.ProductInventory 
Group by [Shelf],ProductID

--10 Write query  to see the average quantity  of  products by shelf excluding rows that has the value of N/A in the column Shelf from the table Production.ProductInventory 
select [ProductID],[Shelf], avg(Quantity) as theAVG   from Production.ProductInventory where shelf != 'N/A'
Group by [Shelf],ProductID

--11 List the members (rows) and average list price in the Production.Product table. This should be grouped independently over the Color and the Class column. Exclude the rows where Color or Class are null. 
select color, avg(listprice) as avgprice from Production.product where color is not null
group by color

--12   Write a query that lists the country and province names from person. CountryRegion and person. StateProvince tables. Join them and produce a result set similar to the following.  
select c.Name as Country, s.Name as Province  from  person.stateprovince s
inner join person.CountryRegion c
on s.CountryRegionCode = c.CountryRegionCode

--13 Write a query that lists the country and province names from person. CountryRegion and person. StateProvince tables and list the countries filter them by Germany and Canada. Join them and produce a result set similar to the following. 
select c.Name as Country, s.Name as Province  from  person.stateprovince s
inner join person.CountryRegion c
on s.CountryRegionCode = c.CountryRegionCode
where c.name ='Germany' or c.name = 'Canada'

use northwind 
--14 List all Products that has been sold at least once in last 25 years. 
 select distinct p.* from dbo.products p
 inner join [dbo].[Order Details] o
 on p.productId = o.productID

 --15 List top 5 locations (Zip Code) where the products sold most
  select top(5) [ShipPostalCode], Count([ShipPostalCode]) as times from dbo.orders 
  Group by [ShipPostalCode]
  order by times desc

  --16 List top 5 locations (Zip Code) where the products sold most in last 20 years. 
  select top(5) [ShipPostalCode], Count([ShipPostalCode]) as times from dbo.orders  WHERE year(OrderDate)  < DATEADD(year,-20,GETDATE())
  Group by [ShipPostalCode]
  order by times desc

  --17  List all city names and number of customers in that city.  
    select [city], count(customerID) as NumberofCustomers from dbo.customers 
	Group by city 

--18 List city names which have more than 10 customers, and number of customers in that city  

 select [city], count(customerID) as NumberofCustomers from dbo.customers 
 Group by city 
 having count(customerID)>10
 order by NumberofCustomers desc

--19 List the names of customers who placed orders after 1/1/98 with order date. 
	

select distinct c.*  from dbo.customers c
 inner join dbo.orders o
 on c.customerID = o.customerID
 where o.orderDate >'1/1/98' 

 --20 List the names of all customers with most recent order dates  

 select  c.* , o.orderDate from dbo.customers c
 inner join dbo.orders o
 on c.customerID = o.customerID
 order by o.orderDate desc

 --21 Display the names of all customers  along with the  count of products they bought
SELECT c.CustomerID, c.CompanyName, c.ContactName, 
SUM(od.Quantity) AS QTY FROM 
Customers c 
LEFT JOIN 
Orders o 
ON c.CustomerID = o.CustomerID
LEFT JOIN 
[Order Details] od
ON o.OrderID = od.OrderID
GROUP BY c.CustomerID, c.CompanyName, c.ContactName
ORDER BY QTY;

 --22 Display the customer ids who bought more than 100 Products with count of products. 

 SELECT c.CustomerID,
SUM(od.Quantity) AS QTY FROM 
Customers c 
LEFT JOIN 
Orders o 
ON c.CustomerID = o.CustomerID
LEFT JOIN 
[Order Details] od
ON o.OrderID = od.OrderID
GROUP BY c.CustomerID
HAVING SUM(od.Quantity) > 100
ORDER BY QTY;

 --23 List all of the possible ways that suppliers can ship their products. Display the results as below 
 select a.CompanyName as Supplier, b.CompanyName as ShippingCompany from dbo.suppliers a
 cross join dbo.shippers b

 
 --24 Display the products order each day. Show Order date and Product Name. 
 select  c.CompanyName, o.Orderdate  from dbo.customers c
 inner join dbo.orders o
 on c.customerID = o.customerID


 
 --25 Displays pairs of employees who have the same job title. 
 

 --26Display all the Managers who have more than 2 employees reporting to them. 
	select EmployeeID, LastName, FirstName, count(Reportsto) as Peopleunder from dbo.employees 
	group by EmployeeID, LastName, FirstName
	having count(Reportsto) <2
	
	--27--
	SELECT c.City, c.CompanyName, c.ContactName, 'Customer' as Type
FROM Customers c
UNION
SELECT s.City, s.CompanyName, s.ContactName, 'Supplier' as Type
FROM Suppliers s;


 select CompanyName from dbo.shippers

 select * from [dbo].[Order Details]
 select * from dbo.orders
 order by orderDate desc
 sp_help 'dbo.orders'

  select * from dbo.customers where city = 'London'
  sp_help 
 



