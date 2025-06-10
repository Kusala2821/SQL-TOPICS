use SalesDB;
/* Set operators  Rules
1. set operator can be used almost in all clauses where|Join| Group By|Having
2.Order by is allowed only once at the end of the query.
Eg:
select FirstName,LastName from customers
join clause
where clause
groupby clause----------1st select statement

union----set operator

select FirstName,LastName from employees
join clause
where clause
groupby clause----------2nd select statement

order by firstname-----order by can be used only at the end to sort the final result

3.The number of columns in each query must be the same
4.Data types of columns in each query must be comaptible
5.The order of columns in each query must be the same
6.If you want to do aliases put it in first query because first query controls the column names */

-- union: return all the distinct rows from both queries.and remove the duplicate rows from the result
select e.FirstName,e.LastName from sales.Employees as e
union
select c.FirstName,c.LastName from sales.Customers as c;

--union all:Return all rows from both the queries including duplicates
select e.FirstName,e.LastName from sales.Employees as e
union all
select c.FirstName,c.LastName from sales.Customers as c;

--Except:return all the distinct rows from the first query that are not found in the second query
select FirstName,LastName from sales.Employees
Except
select FirstName,LastName from sales.Customers;

--Intersect- Return only the rows that are common in both queries
select FirstName,LastName from sales.Employees
intersect
select FirstName,LastName from sales.Customers;

--Task:oders data are stored in separate tables(orders and orders archieve) so combine all orders data into one report without duplicates
--For better understanding instead of using (*)
select 'orders' as sourcetable
 ,[OrderID]
      ,[ProductID]
      ,[CustomerID]
      ,[SalesPersonID]
      ,[OrderDate]
      ,[ShipDate]
      ,[OrderStatus]
      ,[ShipAddress]
      ,[BillAddress]
      ,[Quantity]
      ,[Sales]
      ,[CreationTime] from sales.Orders
union
select 'ordersarchieve' as sourcetable
 ,[OrderID]
      ,[ProductID]
      ,[CustomerID]
      ,[SalesPersonID]
      ,[OrderDate]
      ,[ShipDate]
      ,[OrderStatus]
      ,[ShipAddress]
      ,[BillAddress]
      ,[Quantity]
      ,[Sales]
      ,[CreationTime] from sales.OrdersArchive
order by OrderID;


































































































































































































