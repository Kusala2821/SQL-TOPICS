use MyDatabase;

/* Inner join: Returns only the matching rows from the two tables
syntax: select * 
from A
inner join B
on <condition> eg: A.key=B.key*/

--Get all customers along with their orders,with only for customers who have placed the order
SELECT c.id,c.first_name,o.order_id,o.sales from 
customers as c inner join orders as o
on c.id=o.customer_id;

/*Left Join: returns all rows from the left and only the matching records from right table
syntax: select *
from A
left Join B
on <condition> */

--Get all customers along with their orders including those without orders
select c.id,c.first_name,c.country,c.score,o.order_id,o.sales
from customers as c left join orders as o
on c.id=o.customer_id;

/*right Join: returns all rows from the right and only the matching records from left table
syntax: select *
from A
right Join B
on <condition> */

--Get all customers along with their orders including orders without matching the customers
select c.id,c.first_name,o.order_id,o.sales
from customers as c right join orders as o
on c.id=o.customer_id;

--Get all customers along with their orders including orders without matching the customers(using left join)
select c.id,c.first_name,o.order_id,o.sales
from orders as o left join customers as c
on c.id=o.customer_id;

/* Full Join: Returns all the rows from the two tables
Syntax: select * from A 
full join B
on <condition>*/

--Get all customers and all orders,even if theres is no match
                                                                                                                                                                        

/*Left anti join: Return rows from the left table that has no match in right table
syntax: select * from A 
left Join B
on A.key = B.key
where B.key is Null;*/

-- Get all customers who havent placed any order
Select c.id,c.first_name,o.order_id,o.sales
from customers c left join orders o
on c.id=o.customer_id
where o.customer_id is NULL;

/*Right anti join: Return rows from the right table that has no match in left table
syntax: select * from A 
right Join B
on A.key = B.key
where A.key is Null;*/

--Get all orders without matching customers
Select c.id,c.first_name,o.order_id,o.sales
from customers c right join  orders o
on c.id=o.customer_id
where c.id is Null

--Get all orders without matching customers(using left anti join
select *
from orders o left join customers c 
on c.id=o.customer_id
where c.id is null ;

/* Full anti Join: Returns only rows that dont match in either tables
Syntax: select * from A 
full join B
on <condition>
where b.key is null or a.key is null*/

-- Find the customers without orders and orders without customers
select *
from customers c full join orders o
on c.id=o.customer_id
where c.id is null or o.customer_id is null;

--Task: Get all the customers along with their orders but only for customers who have placed an order(without using inner join)
select *
from customers c full join orders o
on c.id=o.customer_id
where c.id is not null and o.customer_id is not null;

/* cross join- combines every row from left with every row from right .All possible combinations(cartesian join)
syntax: select * from A cross join B   (no condition needed) */

--Generate all the possible combinations of customers and orders
select * from customers cross join orders;

--Task- Using SalesDB ,Retrieve all list of all orders,along with the customer, product ,and employee details.
use SalesDB;
 
select o.OrderID,c.FirstName as CustomerFirstName,c.LastName CustomerLastName,p.Product,o.Sales,p.Price,e.FirstName as sales_person_name from
sales.Orders as o
left join sales.Customers as c on o.CustomerID = c.CustomerID
left join sales.Products as p on o.ProductID = p.ProductID
left join sales.Employees as e on o.SalesPersonID = e.EmployeeID;


