/* WHERE COndition operetors:
1.Comparision Operators---> =,  <> or !=,  >,  >=,  <,  <=
2.Logical operators---> AND, OR, NOT
3.Range Operator-->Bewtween
4.Membership operator--> IN,NOT IN
5.Search Operator--> LIKE  */

-- NOT Operator
select * from customers
where not country='USA';

--IN and NOT IN Operator
select * from customers
where country IN ('Germany','USA');

/*LIKE operator Types
1.% --Anytging o,1 or many charcters
2._ --Exactly 1 charcter    Eg: __b%-->means 'B' before we need to have exact 2 values after b any charcters will be fine --Albert*/

-- first name start with 'M'
select * from customers where first_name like 'M%';

-- first name has 'r' in third position
select * from customers where first_name like '__r%';




