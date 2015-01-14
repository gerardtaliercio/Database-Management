-- ----------------------------------------------- --
-- ----- projects: Business/Employee ------------- --
-- -----       & Production Relation ------------- --
-- -----        by: Gerard Taliercio ------------- --
-- ----------------------------------------------- --

------------
-- People --
------------

drop table if exists people;
create table people (
	peopleID	char (10) not null,
	firstName	varchar (20), 
	lastName	varchar (20),
	middleInitial	varchar (1), 
	address		varchar (20), 
primary key(peopleID)
);


----------------
-- Contractors --
----------------

drop table if exists contractors;
create table contractors (
	contractorID	char(10) not null,
	company		varchar (30), 
	school		varchar (30), 
	contractrateUSD	numeric (12,2), 
	divisionID	char (10) not null, 
primary key (contractorID),
foreign key (divisionID) references division (divisionID)
);


--------------
-- Employee --
--------------

drop table if exists employees;
create table employees (
	employeeID	char(10) not null,
	title		varchar (26), 
	startDate	date not null, 
	fireDate	date, 
	salaryUSD	numeric (12,2),
	divisionID	char (10) not null, 
	projectID	char (10) not null,  
primary key (employeeID),
foreign key (divisionID) references division (divisionID),
foreign key (projectID)  references projects (projectID)
);


-----------------
-- division    --
-----------------

drop table if exists division;
create table division (
	divisionID	char(10) not null, 
	name		varchar (26), 
	location	varchar (30), 
	employeeID	char (10) not null, 
	contractorID	char (10) not null, 
primary key (divisionID),
foreign key (employeeID)  references employees   (employeeID),
foreign key (contractorID)references contractors  (contractorID)
);

--------------
-- projects --
--------------

drop table if exists projects;
create table projects (
	projectID	char(10) not null, 
	name		varchar (26), 
	location	varchar (30), 
	startDate	date not null, 
	finishDate	date, 
	divisionID	char (10) not null, 
primary key (projectID),
foreign key (divisionID) references division (divisionID)
);

--------------
--Production--
--------------

drop table if exists production;
create table production (
	productionID	char(10) not null,
	releaseDate	date, 
	divisionID	char (10) not null, 
	projectID	char (10) not null, 
primary key (productionID),
foreign key (divisionID) references division (divisionID),
foreign key (projectID)  references projects (projectID)
);

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
---------------------------------
-- Insert Statement for People --
---------------------------------


insert into people (peopleID, firstName, lastName, middleInitial, address) values ('002', 'Bill', 'Fairbanks', 'B', 'Beirut');
insert into people (peopleID, firstName, lastName, middleInitial, address) values ('003', 'Jack', 'Mason', 'B', 'Siberia');
insert into people (peopleID, firstName, lastName, middleInitial, address) values ('004', 'Aiden', 'Flemmings', 'B', 'Beirut');
insert into people (peopleID, firstName, lastName, middleInitial, address) values ('005', 'Stuart', 'Thomas', 'B', 'Greece');
insert into people (peopleID, firstName, lastName, middleInitial, address) values ('006', 'Alec', 'Trevelyan', 'B', 'Russia');
insert into people (peopleID, firstName, lastName, middleInitial, address) values ('007', 'James', 'Bond', 'B', 'Classified');
insert into people (peopleID, firstName, lastName, middleInitial, address) values ('010', 'Le', 'Chiffe', 'A', 'France');
insert into people (peopleID, firstName, lastName, middleInitial, address) values ('011', 'Mr.' , 'Big', 'R', 'Russia');
insert into people (peopleID, firstName, lastName, middleInitial, address) values ('012', 'Sir', 'Hugo', 'D', 'London');
insert into people (peopleID, firstName, lastName, middleInitial, address) values ('013', 'Jack', 'Spang', 'F', 'Las Vegas');
insert into people (peopleID, firstName, lastName, middleInitial, address) values ('014', 'Rosa', 'Klebb', 'R', 'Russia');
insert into people (peopleID, firstName, lastName, middleInitial, address) values ('015', 'Emilio', 'Largo', 'N', 'Beirut');

select * 
from people

----------------------------------------
-- Instert Statements for Contractors --
----------------------------------------

insert into contractors (contractorID, company, school, contractrateUSD, divisionID) values ('1', 'Apple', 'University of Stamford', 44000.00, '06');
insert into contractors (contractorID, company, school, contractrateUSD, divisionID) values ('2', 'Microsoft', 'Columbia University', 56000.00, '05');
insert into contractors (contractorID, company, school, contractrateUSD, divisionID) values ('3', 'Oracle', 'ITT Tech',78000.00, '04');
insert into contractors (contractorID, company, school, contractrateUSD, divisionID) values ('4', 'Goldman Sachs', 'NYU', 65000.00, '03');
insert into contractors (contractorID, company, school, contractrateUSD, divisionID) values ('5', 'Morgan Stanley', 'Vassar College',55000.00, '02');
insert into contractors (contractorID, company, school, contractrateUSD, divisionID) values ('6', 'NYSE', 'University of Albany', 80000.00, '01');

select * 
from contractors

------------------------------------
-- Insert Statement for Employees --
------------------------------------

insert into employees (employeeID, title, startDate, fireDate, salaryUSD, divisionID, projectID) values ('002', 'Software Engineer', '06/12/2012','12/31/2013' ,95000.00, '01', '11');
insert into employees (employeeID, title, startDate, fireDate, salaryUSD, divisionID, projectID) values ('003', 'Systems Engineer', '04/14/2011', '09/23/2013', 55000.00, '02', '33');
insert into employees (employeeID, title, startDate, fireDate, salaryUSD, divisionID, projectID) values ('004', 'Software Developer', '03/15/2010','12/31/2013' , 118000.00, '03', '22');
insert into employees (employeeID, title, startDate, fireDate, salaryUSD, divisionID, projectID) values ('005', 'Java Developer', '01/01/1999', '10/31/2013', 68000.00,'01', '11');
insert into employees (employeeID, title, startDate, fireDate, salaryUSD, divisionID, projectID) values ('006', 'Business Analyst', '06/12/2012', '12/31/2013', 75000.00, '02', '33');
insert into employees (employeeID, title, startDate, fireDate, salaryUSD, divisionID, projectID) values ('007', 'projects Manager', '04/28/1993', '12/31/2013',89000.00, '05', '66');


select *
from employees

--------------------------------------
-- Insert Statement for division --
--------------------------------------

insert into division (divisionID, name, location, employeeID, contractorID) values ('01', 'Documentation', 'New Jersey', '002,005', '6');
insert into division (divisionID, name, location, employeeID, contractorID) values ('02', 'Customer Communication', 'New York','003,006', '5');
insert into division (divisionID, name, location, employeeID, contractorID) values ('03', 'Help Design', 'New Jersey', '004','4');
insert into division (divisionID, name, location, employeeID, contractorID) values ('04', 'Knowledge Transfer', 'New York',  ,'3');
insert into division (divisionID, name, location, employeeID, contractorID) values ('05', 'Research', 'New Jersey',  ,'2');
insert into division (divisionID, name, location, employeeID, contractorID) values ('06', 'Top Secret', 'Connecticut', '007','1');

select *
from division

-----------------------------------
-- Insert Statement for projects --
-----------------------------------

insert into projects (projectID, name, location, startDate, finishDate, divisionID) values ('11', 'Phone', 'New York', '07/04/2010', '11/10/2013', '01');
insert into projects (projectID, name, location, startDate, finishDate, divisionID) values ('22', 'Tablet','New York', '02/28/2009', '11/10/2013', '03');
insert into projects (projectID, name, location, startDate, finishDate, divisionID) values ('33', 'PC', 'Connecticut', '04/11/2012', '11/10/2013', '02');
insert into projects (projectID, name, location, startDate, finishDate, divisionID) values ('44', 'Laptop', 'New Jersey', '12/20/2011', '11/10/2013', '01');
insert into projects (projectID, name, location, startDate, finishDate, divisionID) values ('55', 'Holograph Phone', 'New York', '12/20/2011', '11/10/2013','04');
insert into projects (projectID, name, location, startDate, finishDate, divisionID) values ('66', 'Pocket projectsor', 'New York', '12/20/2011', '11/10/2013','05');
insert into projects (projectID, name, location, startDate, finishDate, divisionID) values ('77', 'Glass Translator', 'Connecticut', '12/20/2011', '11/10/2013','06');

select *
from projects

-----------------------------------
-- Insert Statement for production --
-----------------------------------

insert into production (productionID,  releaseDate, divisionID, projectID) values ('1', '11/28/2013', '06', '77' );
insert into production (productionID,  releaseDate, divisionID, projectID) values ('2', '11/28/2013', '05', '66' );
insert into production (productionID,  releaseDate, divisionID, projectID) values ('3', '11/28/2013', '04', '55' );
insert into production (productionID,  releaseDate, divisionID, projectID) values ('4', '11/28/2013', '01', '44' );
insert into production (productionID,  releaseDate, divisionID, projectID) values ('5', '11/28/2013', '02', '33' );
insert into production (productionID,  releaseDate, divisionID, projectID) values ('6', '11/28/2013', '03', '22' );
insert into production (productionID,  releaseDate, divisionID, projectID) values ('7', '11/28/2013', '01', '11' );
	
select * 
from production