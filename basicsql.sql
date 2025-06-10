Use MyDatabase;
-- this is a single line comment

/* This is 
a Multi line comment */

-- Order by--> Sort the data either by Asc or Desc

/*Group by- in between where and order by ----> Combine rows with same value and aggregate the column by another column

rule--All columns in select must be either aggregated or included in group by*/

select country, sum(score) as total from customers group by country;

select country, sum(score) as total_score,count(id) as total_customers from customers group by country;

/* Having --- Filters the data after aggregation and can be used only with Group by
where condition ---- should be used before aggregation
Having --After the aggregation and alaises wont work*/

select country,avg(score) as avg_score from customers where score !=0 
Group by country 
Having avg(score) > 430;

-- Top -->Limit the data
select Top 3 * from customers order by score DESC;

select Top 2 * from orders order by order_date DESC;

--Data Definition Language(DDL) - CREATE,ALTER,DROP

Create table persons(
id int not null,
person_name varchar(20) NOT null,
birth_date date,
phone varchar(10) not null
constraint pk_persons primary key(id)   --- To validate the primary key -> constraint key name(only visible for the database) primary key(column name)
);

-- Alter ->adding new column or editing the table like changing the data type.Editing the existing table
/*alter table table_name  
add or delete column_name datatype */
alter table persons 
add email varchar(50) not null;

alter table persons
drop column phone;

-- drop-deleting the table from the database
drop table persons;

--DATA MANIPULATION LANGUAGE--INSERT,UPDATE,DELETE
--insert
insert into customers 
values
      (6,'kusala','reddy',NULL),
      (7,'Garshan',NULL,400);

select * from customers;

-- update- change the row data for the existing table...Always use where condition in update to avoid updating all rows unintentionally
/* upadte table_name
set column1 =value1,
    column 2= value 2
where <condition>*/

update customers
set country='Germany'
where id=6;

update customers
set score=0
where score is NULL;

-- Delete--- delete the rows in a table not the whole table
delete from customers
where id>5;

/*Truncate-- delete all the data in the table .The difference between delete and truncation
if we are working with large tables truncate will work faster.*/
    

