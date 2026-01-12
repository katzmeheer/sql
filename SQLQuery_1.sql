CREATE database mihir
use mihir
SELECT name FROM master.sys.databases ORDER BY name;
EXEC sp_databases;
INSERT INTO STUDENT
VALUES ('Jolly Evans','Female',28,475),
('Alan Simmons','Male',32,405),
('Laura Bennet','Female',30,435);
SELECT * FROM STUDENT;
INSERT INTO Student(Name,Gender,Age,Marks)
OUTPUT inserted.Name,
inserted.Age,
inserted.Marks
VALUES('Greme Smith','Male',36,455);
SELECT * FROM STUDENT;
Update Student
Set Marks = 492
WHERE Name='Alan Simmons';
SELECT * FROM STUDENT;
SELECT Name , Gender , Age , Marks
FROM STUDENT
WHERE Marks=(
Select MIN(Marks)AS "Minimum Marks"
FROM  STUDENT);

SELECT NAME , MIN(Marks) AS "Minimum Marks"
FROM STUDENT
GROUP BY Name;

SELECT Name,MIN(Marks) AS "Minimum Marks"
FROM STUDENT
GROUP BY Name
HAVING MIN(Marks)>100;

Select * FROM ProductQty;
INSERT INTO ProductQty
VALUES('East','Computer','2020',130,50000),
('South','Computer','2020',450,35000),
('North','Computer','2020',250,40000),
('East','Hard Disk','2020',190,5500),
('West','Computer','2021',250,45000),
('South','Hard Disk','2021',550,4400),
('West','Hard Disk','2021',650,7500),
('East','Pen Drive','2021',120,800),
('North','Mouse','2019',160,1500),
('South','Pen Drive','2019',270,750),
('East','Mouse','2019',2000,1200),
('West','Pen Drive','2019',190,650);
Select * FROM ProductQty;
Select * FROM ProductQty;
DELETE FROM ProductQty
WHERE ID IN (1,2);
Select * FROM ProductQty;

SELECT MAX(Quantity)AS 'Maxiumum Quantity' FROM ProductQty;

SELECT Product,Quantity,Price
FROM ProductQty
WHERE Quantity = (
SELECT MAX(Quantity) AS 'Maxiumum Quantity'
FROM ProductQty);

SELECT Product,MAX(Quantity)AS 'Maximum Quantity'
FROM ProductQty
GROUP BY Product
ORDER BY PRODUCT;

SELECT Product,MAX(Quantity) AS 'Maximum Quantity'
FROM ProductQty
GROUP BY Product
HAVING MAX(Quantity)>300;

SELECT Product,MAX(Quantity*Price)AS 'Highest Value'
FROM ProductQty
GROUP BY Product;

SELECT DISTINCT Product,
MAX(Quantity)OVER (PARTITION BY Product)AS 'Highest Quantity'
FROM ProductQty;

SELECT MAX(name) AS DBNAME from sys.databases WHERE database_id<5;

Select * FROM employeeinfo;
INSERT INTO employeeinfo
VALUES('Jolly Evans','HR','2020-10-04',9,25000),
('Brayden Simmons','Engineer','2020-10-04',12,65000),
('Rose Huges','Writer','2020-10-04',13,35000),
('Laura Paul','Manager','2020-10-04',10,45000),
('Diego Simmons','Teacher','2020-10-04',12,30000),
('Antonnio Bennet','Writer','2020-10-04',13,35000),
('Laura Paul','Manager','2020-11-05',10,42000),
('Antonio Bennet','Writer','2020-11-05',9,38000),
('Rose Huges','Writer','2020-11-05',12,36000),
('Jolly Evans','HR','2020-11-05',11,30000);

SELECT * FROM employeeinfo;

SELECT SUM(salary) AS 'Total Salary' FROM employeeinfo;

SELECT SUM( DISTINCT salary) AS 'Total Salary'
FROM employeeinfo;

SELECT SUM(salary)AS 'Total Salary'
FROM employeeinfo
WHERE working_hours>9;

SELECT occupation, SUM(salary) AS 'Total Salary'
FROM employeeinfo
GROUP BY occupation;

SELECT occupation , SUM(salary)AS 'Total Salary'
FROM employeeinfo
GROUP BY occupation
ORDER BY SUM(salary);

SELECT occupation , SUM(salary)AS 'Total Salary'
FROM employeeinfo
GROUP BY occupation
HAVING SUM(salary)>50000
ORDER BY SUM(salary);

SELECT DISTINCT occupation,
SUM(salary)OVER (PARTITION BY occupation)AS 'Total Salary'
FROM employeeinfo;


SELECT AVG(working_hours) AS 'Average Working Hours'
FROM employeeinfo;

SELECT AVG(working_hours) AS 'Average Working Hours'
FROM employeeinfo
WHERE occupation = 'Writer';


SELECT occupation, AVG(working_hours) AS 'Average Working Hours'
FROM employeeinfo
GROUP BY occupation;

SELECT occupation, AVG(working_hours) AS 'Average Working Hours'
FROM employeeinfo
GROUP BY occupation
ORDER BY AVG(working_hours)DESC;

SELECT occupation, AVG(working_hours) AS 'Average Working Hours'
FROM employeeinfo
GROUP BY occupation
HAVING AVG(working_hours)>10
ORDER BY AVG(working_hours);

SELECT occupation, AVG(DISTINCT working_hours) AS 'Average Working Hours'
FROM employeeinfo
GROUP BY occupation;

SELECT COUNT(*) AS 'Total Employee' FROM employeeinfo;

SELECT COUNT(DISTINCT name) AS 'Total Employee' 
FROM employeeinfo;

SELECT COUNT(name)AS 'Total Employee'
FROM employeeinfo;

SELECT COUNT(name)AS 'Total Employee'
FROM employeeinfo
WHERE salary<50000 AND working_hours>9;

SELECT COUNT(name)AS 'Total Employee'
FROM employeeinfo
GROUP BY occupation;

SELECT COUNT(name)AS 'Total Employee'
FROM employeeinfo
GROUP BY occupation
ORDER BY COUNT(name);

SELECT COUNT(name)AS 'Total Employee'
FROM employeeinfo
GROUP BY occupation
HAVING COUNT(name)>1
ORDER BY COUNT(name);

SELECT DISTINCT occupation,
COUNT(name) OVER (PARTITION BY occupation)AS 'Total Employee'
FROM employeeinfo
ORDER BY "Total Employee";



INSERT INTO Employees
VALUES(6,'Mahesh',24,19000);
(7,'Lily',21,21000),
(8,'Mohan',24,32000),
(9,'Rahul',22,24000),
(10,'Chitra',16,15000),
(11,'Kavita',17,22000),
(12,'Andy',27,21000),
(13,'Rohan',37,56000),
(14,'Mayank',17,12000);

SELECT * FROM Employees

-- Delete rows from table '[Employees]' in schema '[dbo]'
DELETE FROM [dbo].[Employees]
WHERE  id=6
GO

SELECT *
FROM Employees
WHERE name = 'Lily';

SELECT *
FROM Employees
WHERE name <> 'Lily';

SELECT *
FROM Employees
WHERE name !='Lily';

SELECT *
FROM Employees
WHERE salary > 15000;

SELECT *
FROM Employees
WHERE salary >= 15000;


INSERT INTO Employee2 
VALUES( 'Amit', 20000),
('Riya', 15000);

SELECT * FROM EMPLOYEE2

SELECT id, name, salary, age
FROM Employee2;


SELECT name
FROM Employees
UNION
SELECT name
FROM Employee2;

SElECT id, name ,salary
FROM Employees
WHERE salary >= 15000
UNION
SELECT id,name,salary
FROM Employee2 ;

SELECT * FROM Employees;
SELECT * FROM Employee2;

UPDATE Employee2
SET age = 22
WHERE name = 'Amit';

UPDATE Employee2
SET age = 17
WHERE name = 'Riya';

INSERT INTO Employees VALUES (10, 'Karan',15, 40000);
INSERT INTO Employee2 VALUES ('Karan', 15 , 40000);

SELECT name 
FROM Employees
INTERSECT
SELECT name 
FROM Employee2

SELECT name,salary 
FROM Employees
WHERE salary >= 15000
INTERSECT
SELECT name ,salary 
FROM Employee2

SELECT *
FROM Employees
WHERE name IN ( 'Mahesh','Lily','Rahul');

SELECT *
FROM Employees
WHERE id IN ( 14,13,9,11,10);

SELECT *
FROM Employees
WHERE name NOT IN ( 'Mahesh','Lily','Rahul');

SELECT *
FROM Employees
WHERE name IS NOT NULL;

SELECT *
FROM Employees
WHERE name NOT LIKE 'M%';

SELECT *
FROM Employees
WHERE ID NOT BETWEEN 8 AND 13 ;

SELECT *
FROM Employees
WHERE NOT EXISTS ( SELECT *
        FROM Employee2
        WHERE Employees.name = Employee2.name


SELECT *
FROM Employees
WHERE id between 7 AND 13;

SELECT *
FROM Employees
WHERE id NOT BETWEEN 7 AND 11;

SELECT *
FROM Employees
WHERE salary IS NULL;

SELECT *
FROM Employees
WHERE salary IS NOT NULL;

INSERT INTO Employees
(id ,name, age, salary)
SELECT id,name,age,salary 
FROM Employee2
WHERE name IS NOT NULL;

UPDATE Employees
SET name = 'Active'
WHERE name IS NOT NULL;

DELETE
FROM Employees
WHERE name IS NOT NULL;

SELECT * FROM Employees

