----1----
Objects are genereally structures that contain data, like Tables, schema etc

----2---
Index are objects assigned to table columns to get data faster
Advantages :
To quickly find data that satisfy conditions in the WHERE clause.
To find matching rows in the JOIN clause.
To maintain uniqueness of key column during INSERT and UPDATE
To Sort, Aggregate and Group data.
Disadvantages :
Additional Disk Space.
Insert, Update, Delete Statement become slow.
 

 ------3-----
 Clustred, non clustured unique and non unique indexes.
 ----4----
 When a table is created SQL Server automatically creates custered and unique indexes on primary key column and unique non clustered indexes on unique key constraints.


 -----5-----
 No. One table have only one clustered index. A clustered index sorts and stores the data rows in the table based on the index key values. Therefore, only one clustered index can be created on each
table because the data rows themselves can only be sorted in one order

-----6----
Yes. An index can be created on multiple columns. Yes the order matters.

----7----
Yes

----8-----
Data normalization is a process of organizing data to minimize data duplication, and ensure data
dependency. Normalization has a series of steps called “Forms”, the more steps you take the more
normalized your table are. There are three steps: first normal form, second normal form and third
normal form

----9----
Denormalization is about deliberately adding redundancy to improve performance.
Denormalization is used when there is a lot of tables involved in retreiving data.

---10---

By using transcations 

---11---
Primary key constraint, froeign key constraint, unique key constraint, check constraint etc

----12---
--Primary key can't have null value but unique key can. There will be only one foreign key per table where as there can be any number of unique keys per table

---13---
A foreign key (FK) is a column or combination of columns that is used to establish and enforce a link between the data in two tables. You can create a foreign key by defining a FOREIGN KEY constraint when you create or modify a table.


--14---
yes

--15---
No, foreign key doesnt have to be unique it can be null.

---16---
NO

----17---
Transaction sql server will keep databse in consitant state. Threre are many trnsaction levels in sql server like, red commited, read uncommitted, repeatble read , serializable and snapshot isolation level transaction.

--------Queries--------

-----1-----

create table customer(cust_id int, iname varchar(50))
create table [order](order_id int, cust_id int, amount money, order_date
smalldatetime)

select c.iname, sum(o.amount) total from dbo.customer c
join [order] o
on c.cust_id = o.cust_id
where year(order_date)=2002
Group by c.iname

-----2-----
create table person(id int, firstanme varchar(100), lastname varchar(100))
select * from person
where lastname like 'A%'


---3---
create table person(person_id int primary key,manager_id int null, name varchar(100)
not null)
select x.name, count(*) from person p
left join
(select * from person p where manager_id is null) x
on p.person_id= x.manager_id
group by x.name


----4--- 
insert ,update, delete statements can cause trigger to happen


---5----


create table Company(companyid int primary key, companyname varchar(100) not null)

create table Division(divisionid int primary key, divisionname varchar(100) not null)

create table Contacts(companyid int foreign key, divisionid int foreign key,
locationid varchar(100) foreign key, suitid int foreign key,mail varchar(100),
primary key (companyid, divisionid, locationid,suitid))

create table Physical_location(locationid int primary key, address varchar(100) not
null)

create table Contacts_address(suitid int primary key,mail varchar(100))
 






