-- ----------------------------------------------- --
-- ----- Project: Business/Employee  ------------- --
-- ---------- & Production Relation  ------------- --
-- ----- by: Gerard Taliercio -------------------- --
-- ----------------------------------------------- --

--
-- People
--

drop table if exists people;
create table people (
	peopleID	char (10) not null,
	firstName	varchar (20), 
	lastName	varchar (20),
	middleInitial	varchar (1), 
	address		varchar (20), 
primary key(peopleID)
);

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

--
--Contractor
--

drop table if exists contractor;
create table contractor (
	contractorID	char(10) not null,
	company		varchar (16), 
	school		varchar (16), 
	contractrateUSD	numeric (12,2), 
	departmentID	char(10) not null references department (departmentID),
primary key (contractorID)
);

insert into contractor (contractorID, company, school, contractrateUSD, departmentID) values ('1', 'Apple', 'University of Stamford', 44000.00, '06');
insert into contractor (contractorID, company, school, contractrateUSD, departmentID) values ('2', 'Microsoft', 'Columbia University', 56000.00, '05');
insert into contractor (contractorID, company, school, contractrateUSD, departmentID) values ('3', 'Oracle', 'ITT Tech',78000.00, '04');
insert into contractor (contractorID, company, school, contractrateUSD, departmentID) values ('4', 'Goldman Sachs', 'NYU', 65000.00, '03');
insert into contractor (contractorID, company, school, contractrateUSD, departmentID) values ('5', 'Morgan Stanley', 'Vassar College',55000.00, '02');
insert into contractor (contractorID, company, school, contractrateUSD, departmentID) values ('6', 'NYSE', 'University of Albany', 80000.00, '01');

select * 
from contractor

--
--Employee
--

drop table if exists employee;
create table employee (
	employeeID	char(10) not null,
	title		varchar (16), 
	startDate	date not null, 
	fireDate	date, 
	salaryUSD	numeric (12,2), 
	departmentID	char(10) not null references department (departmentID),
	projectID	char(10) not null references project (projectID),
primary key (employeeID)
);

insert into employee (employeeID, title, startDate, fireDate, salaryUSD, departmentID, projectID) values ('002', 'Software Engineer', '06/12/2012', ,95000.00, '01');
insert into employee (employeeID, title, startDate, fireDate, salaryUSD, departmentID, projectID) values ('003', 'Systems Engineer', '04/14/2011', '09/23/2013', 55000.00, '02');
insert into employee (employeeID, title, startDate, fireDate, salaryUSD, departmentID, projectID) values ('004', 'Software Developer', '03/15/2010', , 118000.00, '03');
insert into employee (employeeID, title, startDate, fireDate, salaryUSD, departmentID, projectID) values ('005', 'Java Developer', '01/01/1999', '10/31/2013', 68000.00,'01');
insert into employee (employeeID, title, startDate, fireDate, salaryUSD, departmentID, projectID) values ('006', 'Business Analyst', '06/12/2012', , 75000.00, '02');
insert into employee (employeeID, title, startDate, fireDate, salaryUSD, departmentID, projectID) values ('007', 'Project Manager', '04/28/1993', ,89000.00, '05');


select *
from employee

--
-- Department
--

drop table if exists department;
create table department (
	departmentID	char(10) not null, 
	name		varchar (20), 
	location	varchar (16), 
	employeeID	char(10) not null references employee  (employeeID),
	contractorID	char(10) not null references contactor (contractorID),
primary key (departmentID)
);

insert into department (departmentID, name, location, employeeID, contractorID) values ('01', 'Documentation', 'New Jersey', '002,005', '6');
insert into department (departmentID, name, location, employeeID, contractorID) values ('02', 'Customer Communication', 'New York','003,006', '5');
insert into department (departmentID, name, location, employeeID, contractorID) values ('03', 'Help Design', 'New Jersey', '004','4');
insert into department (departmentID, name, location, employeeID, contractorID) values ('04', 'Knowledge Transfer', 'New York',  ,'3');
insert into department (departmentID, name, location, employeeID, contractorID) values ('05', 'Research', 'New Jersey',  ,'2');
insert into department (departmentID, name, location, employeeID, contractorID) values ('06', 'Top Secret', 'Connecticut', '007','1');

select *
from department

--
-- Project
--

drop table if exists project;
create table project (
	projectID	char(10) not null, 
	name		varchar (16), 
	location	varchar (16), 
	startDate	date not null, 
	finishDate	date, 
	departmentID	char(10) not null references department (departmentID),
primary key (projectID)
);

insert into project (projectID, name, location, startDate, finishDate, departmentID) values ('11', 'Phone', 'New York', '07/04/2010', '11/10/2013', '01');
insert into project (projectID, name, location, startDate, finishDate, departmentID) values ('22', 'Tablet','New York', '02/28/2009', '11/10/2013', '03');
insert into project (projectID, name, location, startDate, finishDate, departmentID) values ('33', 'PC', 'Connecticut', '04/11/2012', '11/10/2013', '02');
insert into project (projectID, name, location, startDate, finishDate, departmentID) values ('44', 'Laptop', 'New Jersey', '12/20/2011', '11/10/2013', '01');
insert into project (projectID, name, location, startDate, finishDate, departmentID) values ('55', 'Holograph Phone', 'New York', '12/20/2011', '11/10/2013','04');
insert into project (projectID, name, location, startDate, finishDate, departmentID) values ('66', 'Pocket Projector', 'New York', '12/20/2011', '11/10/2013','05');
insert into project (projectID, name, location, startDate, finishDate, departmentID) values ('77', 'Glass Translator', 'Connecticut', '12/20/2011', '11/10/2013','06');

select *
from project

--
--Product
--

drop table if exists product;
create table product (
	productID	char(10) not null,
	releaseDate	date, 
	departmentID	char(10) not null references department (departmentID),
	projectID	char(10) not null references project (projectID), 
primary key (productID)
);

insert into product (productID,  releaseDate, departmentID, projectID) values ('1', '11/28/2013', '06', '77' );
insert into product (productID,  releaseDate, departmentID, projectID) values ('2', '11/28/2013', '05', '66' );
insert into product (productID,  releaseDate, departmentID, projectID) values ('3', '11/28/2013', '04', '55' );
insert into product (productID,  releaseDate, departmentID, projectID) values ('4', '11/28/2013', '01', '44' );
insert into product (productID,  releaseDate, departmentID, projectID) values ('5', '11/28/2013', '02', '33' );
insert into product (productID,  releaseDate, departmentID, projectID) values ('6', '11/28/2013', '03', '22' );
insert into product (productID,  releaseDate, departmentID, projectID) values ('7', '11/28/2013', '01', '11' );
	
select * 
from product
