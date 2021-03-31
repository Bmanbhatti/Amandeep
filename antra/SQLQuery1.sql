/*
Write a query that retrieves the columns ProductID, Name, Color and ListPrice from the
Production.Product table, with no filter.
*/
 

/*
Write a query that retrieves the columns ProductID, Name, Color and ListPrice from the
Production.Product table, the rows that are 0 for the column ListPrice
*/
select [ProductID],[Name],[Color],[Listprice] from Production.Product  where ListPrice = 0

/*
Write a query that retrieves the columns ProductID, Name, Color and ListPrice from the
Production.Product table, the rows that are rows that are NULL for the Color column.
*/
select [ProductID],[Name],[Color],[Listprice] from Production.Product  where Color is null 

/*
Write a query that retrieves the columns ProductID, Name, Color and ListPrice from the
Production.Product table, the rows that are not NULL for the Color column. */
select [ProductID],[Name],[Color],[Listprice] from Production.Product  where Color is not null 

/*
Write a query that retrieves the columns ProductID, Name, Color and ListPrice from the
Production.Product table, the rows that are not NULL for the column Color, and the column
ListPrice has a value greater than zero.
*/
select [ProductID],[Name],[Color],[Listprice] from Production.Product  where Color is not null and ListPrice !=0

/*
Generate a report that concatenates the columns Name and Color from the
Production.Product table by excluding the rows that are null for color.
*/
select Concat([Name],' ',[Color]) from Production.Product  where Color is not null 


/*
Write a query that generates the following result set from Production.Product:
Name And Color
--------------------------------------------------
NAME: LL Crankarm -- COLOR: Black
NAME: ML Crankarm -- COLOR: Black
NAME: HL Crankarm -- COLOR: Black
NAME: Chainring Bolts -- COLOR: Silver
NAME: Chainring Nut -- COLOR: Silver
NAME: Chainring -- COLOR: Black
*/

select Concat('NAME: ',[Name],'-- COLOR: ',[Color]) from Production.Product where Color is not null

/*
Write a query to retrieve the to the columns ProductID and Name from the
Production.Product table filtered by ProductID from 400 to 500
*/
select [ProductID],[Name] from Production.Product  where ProductID between 400 and 500

/*
Write a query to retrieve the to the columns ProductID, Name and color from the
Production.Product table restricted to the colors black and blue
*/
select [ProductID],[Name],[Color] from Production.Product  where Color = 'black' or Color = 'blue'

/*
Write a query to generate a report on products that begins with the letter S.
*/
select * from Production.Product where name like 'S%'

/*
Write a query that retrieves the columns Name and ListPrice from the Production.Product
table. Your result set should look something like the following. Order the result set by the
Name column.
*/
 select [Name],[ListPrice] from Production.Product where name like 'S%' order by Name

 /*
 Write a query that retrieves the columns Name and ListPrice from the Production.Product
table. Your result set should look something like the following. Order the result set by the
Name column. The products name should start with eitherA; or S
 */

  select [Name],[ListPrice] from Production.Product where name like 'A%'or name like 'S%' order by Name

  /*
  Write a query so you retrieve rows that have a Name that begins with the letters SPO, but is
then not followed by the letter K. After this zero or more letters can exists. Order the result
set by the Name column.
  */
  select [Name],[ListPrice] from Production.Product where name like 'SPO%' and name not like 'SPOK%' order by name 

/*
Write a query that retrieves unique colors from the table Production.Product. Order the
results in descending manner
*/
select Distinct [Color]from Production.Product order by Color desc 

/*
Write a query that retrieves the unique combination of columns ProductSubcategoryID and
Color from the Production.Product table. Format and sort so the result set accordingly to
the following. We do not want any rows that are NULL.in any of the two columns in the
result.
*/
select Distinct [ProductSubcategoryID], [Color]from Production.Product 
where ProductSubcategoryID is not null and Color is not null 

/*
Something is “wrong” with the WHERE clause in the following query.
We do not want any Red or Black products from any SubCategory than those with the value
of 1 in column ProductSubCategoryID, unless they cost between 1000 and 2000.
 
Note:
The LEFT() function will be covered in a forthcoming module.
 
 
SELECT ProductSubCategoryID, LEFT([Name],35) AS [Name] , Color, ListPrice FROM Production.Product
WHERE Color IN ('Red', 'Black')
OR ListPrice BETWEEN 1000 AND 2000
AND ProductSubCategoryID = 1
ORDER BY ProductID

*/

SELECT ProductSubCategoryID, LEFT([Name],35) AS [Name] , Color, ListPrice FROM Production.Product
WHERE ProductSubCategoryID = 1 or Color != 'Red' and Color != 'Black'  OR ListPrice BETWEEN 1000 AND 2000


/*
Write the query in the editor and execute it. Take a look at the result set and then adjust
the query so it delivers the following result set.
*/

SELECT ProductSubCategoryID, LEFT([Name],35) AS [Name] , Color, ListPrice FROM Production.Product
WHERE Color IN ('Red', 'Black') AND ProductSubCategoryID = 1 OR ListPrice BETWEEN 1000 AND 2000
