TCL & DCL Assignment

Part A – Theory:

1.What does TCL stand for?
Transaction control language.

2. Name the TCL commands
- Start transaction
- Commit
- Rollback
- Save Point

3. What is the purpose of COMMIT?
Permanently saving option

4. What is the difference between COMMIT and ROLLBACK?
- Commit is used to permanently save all the changes made in a transaction.
- Rollback is used to cancel the changes made in the current transaction.

5. What does SAVEPOINT do?
A Save point creates a checkpoint so we can roll back to that save point instead of
undoing the entire transaction.

6. What does DCL stand for?
Data control language.

7. Name the DCL commands.
- Grant
- Revoke

8. What is the purpose of GRANT?
Grant is used to give database access to a user.

9. What is the purpose of REVOKE?
Revoke is used to remove the access given to a user.

10. Can we rollback after COMMIT? Explain.
No once we commit the changes are permanently saved and cannot rollback. 

PART B - SETUP:
--DATABASE CREATED
CREATE DATABASE OFFICE;

--SET DATABSE DEFAULT
USE OFFICE;

--TABLE CREATED
CREATE TABLE Employee(
EmpID INT PRIMARY KEY,
EmpName VARCHAR(50),
Department VARCHAR(30),
Salary DECIMAL(10,2)
);

--DATA INSERT TO TABLE
INSERT INTO Employee VALUES
(101,'Rahul','IT',45000),
(102,'Priya','HR',52000),
(103,'Amit','Finance',60000),
(104,'Sneha','IT',48000),
(105,'John','HR',55000);


Part C – TCL Practical:

1.Increase Rahul's salary by ₹5000. Do not commit immediately. Verify the result.Rollback
the transaction. What is Rahul's final salary?
START TRANSACTION;
UPDATE EMPLOYEE SET SALARY = SALARY+5000 WHERE EMPID = 101; 
SELECT * FROM EMPLOYEE;
ROLLBACK;
SELECT * FROM EMPLOYEE;

2.Increase every employees salary by 10%. Commit the transaction. Verify the result?
START TRANSACTION;
UPDATE EMPLOYEE SET SALARY = SALARY * 1.10; 
COMMIT;
SELECT * FROM EMPLOYEE;

3.Increase Rahul salary by ₹3000. Create SAVEPOINT sp1. Increase Priya's salary by
₹5000. Rollback to sp1. Which employee's salary is rolled back?
START TRANSACTION;
UPDATE EMPLOYEE SET SALARY = SALARY+3000 WHERE EMPID = 101; 
SAVEPOINT SP1;
UPDATE EMPLOYEE SET SALARY = SALARY+5000 WHERE EMPID = 102; 
ROLLBACK;
SELECT * FROM EMPLOYEE;

4.DELETE HR employees. Rollback. How many HR employees remain?
START TRANSACTION;
DELETE FROM EMPLOYEE WHERE DEPARTMENT = 'HR';
ROLLBACK;
SELECT * FROM EMPLOYEE;

5. DELETE Finance employees. COMMIT. Then ROLLBACK. Will the Finance employee
return? Explain.
START TRANSACTION;
DELETE FROM EMPLOYEE WHERE DEPARTMENT = 'FINANCE';
COMMIT;
ROLLBACK;
SELECT * FROM EMPLOYEE;

Part D – DCL:

1. Write a query to GRANT SELECT on Employee to student1.
GRANT SELECT ON Employee TO student1;

2. Write a query to GRANT INSERT on Employee to student1.
GRANT INSERT ON Employee TO student1;

3. Write a query to GRANT UPDATE on Employee to student1.
GRANT UPDATE ON Employee TO student1;

4. Write a query to REVOKE INSERT from student1.
REVOKE INSERT ON Employee FROM student1;

5. Write a query to REVOKE ALL permissions from student1.
REVOKE ALL PRIVILEGES ON Employee FROM student1;

Part E – Scenario Based:

1.A cashier accidentally updates 500 customer records before commit. Which TCL
command should be used?
Ans - Rollback

2. Salary changes are verified and should become permanent. Which command should be
used?
Ans - Commit

3. Undo only the last set of changes without affecting earlier updates. Which command
should be used?
Ans - Rollback to savepoint

4. A new employee should only view employee records. Which DCL command will you
use?
Ans - Grant select update on employee to cashier1;

5. A user should no longer have permission to delete records. Which DCL command will
you use?
Ans – Revoke delete on employee from students;

Part F – Output Prediction:

1.START TRANSACTION;
 UPDATE Employee SET Salary=Salary+5000 WHERE EmpID=101;
 ROLLBACK;
 SELECT Salary FROM Employee WHERE EmpID=101;
 Question: Will the updated or original salary be displayed?
Ans – The original salary is displayed because rollback reverse the update.

2. START TRANSACTION;
 UPDATE Employee SET Salary=Salary+5000 WHERE EmpID=101;
 COMMIT;
 ROLLBACK;
 Question: Is the salary restored? Why?
Ans – No because commit save update permanently. So rollback didn t work.

3.START TRANSACTION;
 UPDATE Employee SET Salary=Salary+1000 WHERE EmpID=101;
 SAVEPOINT A;
 UPDATE Employee SET Salary=Salary+2000 WHERE EmpID=102;
 ROLLBACK TO A;
 COMMIT;
 Question: Which employee receives the salary increment?
Ans – Raghul (empid 101) receives the salary increment

Final questions:

1. Increase all IT salaries by 15%.
Ans - UPDATE Employee SET Salary = Salary * 1.15 WHERE Department = 'IT';

2. Create a SAVEPOINT.
Ans - SAVEPOINT S1;

3. Increase all HR salaries by ₹2,000.
Ans- UPDATE Employee SET Salary = Salary + 2000 WHERE Department = 'HR';

4. Rollback only the HR update.
Ans - Rollback;

5. Commit remaining changes.
Ans – Commit;

6. Grant SELECT and UPDATE to student1.
Ans - GRANT SELECT, UPDATE ON Employee TO student1;

7. Revoke only UPDATE from student1.
Ans - REVOKE UPDATE ON Employee FROM student1;
