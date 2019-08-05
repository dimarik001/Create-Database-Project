CREATE TABLE DEPARTMENT(DEP_ID INTEGER, 
DEP_NAME VARCHAR(10), 
BUILDING VARCHAR(10), 
BUDGET INTEGER, 
PRIMARY KEY(DEP_ID)); 

CREATE TABLE INSTRUCTOR(IN_ID INTEGER, 
IN_NAME VARCHAR(10), 
DEP_ID INTEGER, 
SALARY INTEGER, 
PRIMARY KEY(IN_ID), 
FOREIGN KEY(DEP_ID) REFERENCES DEPARTMENT);

CREATE TABLE STUDENT(S_ID INTEGER, 
S_NAME VARCHAR(10), 
DEP_ID INTEGER, 
TOTAL_CREDIT INTEGER, 
PRIMARY KEY(S_ID), 
FOREIGN KEY(DEP_ID) 
REFERENCES DEPARTMENT);

INSERT INTO DEPARTMENT VALUES (1, 'cs', 'D', 1000);
INSERT INTO DEPARTMENT VALUES (2, 'math', 'C', 500);
INSERT INTO DEPARTMENT VALUES (3, 'econ', 'A', 1000);
INSERT INTO DEPARTMENT VALUES (4, 'hist', 'B', 2000);
INSERT INTO DEPARTMENT VALUES (5, 'phil', 'B', 1000);

SELECT * FROM DEPARTMENT;

INSERT INTO INSTRUCTOR VALUES (51, 'Kia', 1, 20);
INSERT INTO INSTRUCTOR VALUES (52, 'Kia', 1, 20);
INSERT INTO INSTRUCTOR VALUES (53, 'James', 3, 50);
INSERT INTO INSTRUCTOR VALUES (54, 'James', 4, 660);
INSERT INTO INSTRUCTOR VALUES (55, 'Lily', 2, 7000);

SELECT * FROM INSTRUCTOR;

--PRINT ALL THE NAMES IN DEPARTMENT 
SELECT DEP_NAME FROM DEPARTMENT;

--SELECT UNIQUE NAMES OF INSTRUCTOR
SELECT DISTINCT IN_NAME FROM INSTRUCTOR;

--CREATE THE CARTESIAN PRODUCT
SELECT * FROM DEPARTMENT, INSTRUCTOR;

--FROM THE CARTESIAN PRODUCT SELECT WHERE INSTRUCTOR SALARY IS OVER 500
SELECT * FROM DEPARTMENT, INSTRUCTOR WHERE INSTRUCTOR.SALARY>500;

--SELECT FROM DEPARTMENT THE UNIQUE DEPARTMENT BUILDING NUMBER OF THE DEPARTMENT HAVING
--DE ID > 3 AND A BUDGET OVER 500

SELECT DISTINCT DEPARTMENT.BUILDING FROM DEPARTMENT WHERE DEP_ID >3 OR BUDGET<500;

SELECT IN_ID FROM INSTRUCTOR WHERE(IN_NAME) LIKE 'Kia';

-- || CONCACTINATE 
SELECT IN_NAME || IN_NAME FROM INSTRUCTOR;

--SELECT DEP_ID FROM DEP X INST FOR WHICH THE INT NAME CONTAINS 'James'

SELECT DEPARTMENT.DEP_ID FROM DEPARTMENT, INSTRUCTOR WHERE INSTRUCTOR.IN_NAME LIKE '%Ja%';

--SELECT * FROM INSTRICTOR FOR WHICH INSTRUCTOR(IN_NAME) INCLUDES 'L';
SELECT * FROM INSTRUCTOR WHERE INSTRUCTOR.IN_NAME LIKE '%L%'; 

--CONCACTINATE THE DEP_ID AND THE BUILDING NAME OF ALL THE DEPARTMENTS FOR WHICH THE BUDGET IS ABOVE 500
SELECT DEP_ID || BUILDING FROM DEPARTMENT WHERE BUDGET>500;

--AVERAGE
SELECT AVG(SALARY) 
FROM INSTRUCTOR;

SELECT IN_NAME FROM INSTRUCTOR ORDER BY IN_ID;

SELECT IN_NAME, IN_ID FROM INSTRUCTOR ORDER BY IN_NAME;

INSERT INTO STUDENT VALUES (100, 'ALI', 2, 55);
INSERT INTO STUDENT VALUES (101, 'CHRISTINA', 3, 55);
INSERT INTO STUDENT VALUES (102, 'CHRISTINA', 4, 55);
INSERT INTO STUDENT VALUES (103, 'MONIKA', 1, 55);
INSERT INTO STUDENT VALUES (104, 'MARGARITA', 5, 55);

SELECT IN_NAME, SALARY FROM INSTRUCTOR WHERE SALARY>600 ORDER BY SALARY/12;

SELECT IN_ID
FROM INSTRUCTOR
WHERE IN_NAME LIKE '%ia%'
ORDER BY IN_NAME DESC;

SELECT DISTINCT DEP_NAME, IN_NAME
FROM DEPARTMENT,INSTRUCTOR
WHERE DEP_NAME LIKE '%Ad%'
ORDER BY IN_NAME DESC;

SELECT DISTINCT IN_ID, DEP_NAME
FROM INSTRUCTOR, DEPARTMENT
WHERE INSTRUCTOR.DEP_ID = DEPARTMENT.DEP_ID
ORDER BY DEP_NAME DESC;

SELECT * FROM DEPARTMENT;

--ALTER TABLE
ALTER TABLE DEPARTMENT RENAME COLUMN DEP_NAME TO DEP_NAME1;
ALTER TABLE DEPARTMENT RENAME COLUMN DEP_NAME1 TO DEP_NAME;

--UNION
SELECT DEP_ID
FROM DEPARTMENT
UNION SELECT IN_ID
FROM INSTRUCTOR;

--AS-- CHANGE THE COLUMN NAME
SELECT DEP_ID AS ID,
DEP_NAME1 AS NAMES
FROM DEPARTMENT;


--IN
SELECT * 
FROM DEPARTMENT
WHERE DEP_ID IN (1,2,3,4,5);

--NOT IN
SELECT *
FROM INSTRUCTOR
WHERE IN_NAME LIKE '%a%'
AND
DEP_ID NOT IN (1,2,1,3);

--COUNT
SELECT COUNT (*)
FROM DEPARTMENT;

--AVG
SELECT AVG(DEP_ID)
FROM DEPARTMENT;


--CONCAT ||
SELECT DEP_ID ||''|| DEP_NAME   AS COMBINATION
FROM DEPARTMENT;

--IN
SELECT *
FROM DEPARTMENT
WHERE DEP_NAME IN('cs', 'math')
AND
BUDGET > 200
ORDER BY DEP_ID;


--COUNT NAMES
SELECT IN_NAME, COUNT(IN_NAME)
FROM INSTRUCTOR
GROUP BY IN_NAME;

--AVG GROUP
SELECT AVG(SALARY),IN_NAME
FROM INSTRUCTOR
GROUP BY IN_NAME;

--AVG
SELECT *
FROM (SELECT AVG(SALARY),
IN_NAME FROM INSTRUCTOR
GROUP BY IN_NAME),
(SELECT AVG(SALARY)
FROM INSTRUCTOR);

--SUM
SELECT *
FROM (SELECT SUM(SALARY),
IN_NAME FROM INSTRUCTOR
GROUP BY IN_NAME),
(SELECT SUM(SALARY)
FROM INSTRUCTOR);

--
SELECT *
FROM INSTRUCTOR
WHERE IN_NAME = 'Kia'
AND IN_ID-50 IN (SELECT DEP_ID
FROM DEPARTMENT);

--To change the name of column
--SELECT column_name "New Name"
--from table;

--SELECT f_id, f_last, f_first FROM faculty
--WHERE f_id BETWEEN 2 AND 4;

----('_a%') precided by one character WHEN 'a' is the second character !!!!
--SELECT f_id, f_last, f_first FROM faculty
--WHERE f_first LIKE '_a%';

--UPDATE student SET soc_ins='456-321-987' WHERE s_id=5;

--SELECT s_id || ',' || s_last || s_first ||' born on ' || birthday ||
--' and having SI number '|| soc_ins  "Information about Students" FROM student;

--UPDATE faculty SET f_first='&first', birthday='&bithday', soc_ins='&sos' WHERE f_id=8;
--Enter value for first: Gill
--Enter value for bithday: 12-JUL-85
--Enter value for sos: 123-654-789

--SELECT UPPER(f_last), LOWER(f_first)
--from faculty;


--select course_no, INSTR(course_no, 'S'),
--SUBSTR(course_no, INSTR(course_no, ' '))
--from course;

--select MIN(max_enrl),
--MAX (max_enrl),
--SUM(max_enrl)
--from course;

SELECT * FROM INSTRUCTOR 
WHERE NAME = 'kia'
AND
INST_ID-50 IN(SELECT DEP_ID FROM DEPARTMENT);

SELECT DEPARTMENT_ID, AVG(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID 
HAVING AVG (SALARY) > 7000;

SELECT DEPARTMENT_ID, AVG(SALARY)
FROM EMPLOYEES
WHERE DEPARTMENT_ID > 100
GROUP BY DEPARTMENT_ID HAVING DEPARTMENT_ID IS NOT NULL;

SELECT FIRST_NAME, AVG(SALARY)
FROM EMPLOYEES
WHERE FIRST_NAME LIKE '%k%'
GROUP BY FIRST_NAME;

SELECT FIRST_NAME, AVG(SALARY)
FROM EMPLOYEES
GROUP BY FIRST_NAME
HAVING(FIRST_NAME LIKE '%K%' OR FIRST_NAME LIKE '%k%');

SELECT AVG(K)
FROM (SELECT FIRST_NAME, AVG(SALARY) AS k
FROM EMPLOYEES
GROUP BY FIRST_NAME
HAVING (FIRST_NAME LIKE '%k%' OR FIRST_NAME LIKE '%K%'));

SELECT * FROM REGIONS;
SELECT * FROM COUNTRIES;

SELECT * FROM REGIONS
INNER JOIN COUNTRIES ON REGIONS.REGION_ID = COUNTRIES.REGION_ID;

SELECT * FROM REGIONS
LEFT OUTER JOIN COUNTRIES ON REGIONS.REGION_ID = COUNTRIES.REGION_ID;

SELECT * FROM REGIONS
RIGHT OUTER JOIN COUNTRIES ON REGIONS.REGION_ID = COUNTRIES.REGION_ID;

SELECT DEPARTMENTS.DEPARTMENT_NAME, EMPLOYEES.MANAGER_ID FROM DEPARTMENTS
LEFT OUTER JOIN EMPLOYEES ON EMPLOYEES.MANAGER_ID = DEPARTMENTS.MANAGER_ID
WHERE EMPLOYEES.MANAGER_ID IS NOT NULL;

SELECT DEPARTMENTS.DEPARTMENT_NAME, EMPLOYEES.MANAGER_ID
FROM DEPARTMENTS LEFT OUTER JOIN EMPLOYEES ON EMPLOYEES.MANAGER_ID = DEPARTMENTS.MANAGER_ID;

CREATE VIEW MY_DEP AS SELECT DEPARTMENT_ID, DEPARTMENT_NAME, LOCATION_ID
FROM DEPARTMENTS;


--CREATE VIEW
CREATE VIEW MY_EMP
AS SELECT EMPLOYEE_ID,LAST_NAME, EMAIL
FROM EMPLOYEES;


--SELECT MY VIEW
SELECT * FROM MY_EMP;

INSERT INTO MY_DEP VALUES(789,'HELOO',1700);

SELECT * FROM DEPARTMENTS
WHERE DEPARTMENT_ID = '789';

--STUDY JOIN AND GROUP BY !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!



-----------------------11.06.2019------------=======================------------------------------------======== 11.06.2019

--INNER JOIN
SELECT * 
FROM REGIONS
INNER JOIN
COUNTRIES ON REGIONS.REGION_ID = COUNTRIES.REGION_ID;

--LEFT OUTER JOIN (IN THIS CASE THE SAME OUTPUT)
SELECT * 
FROM REGIONS
LEFT OUTER JOIN
COUNTRIES ON REGIONS.REGION_ID = COUNTRIES.REGION_ID;

--RIGHT OUTER JOIN
SELECT * 
FROM REGIONS
RIGHT OUTER JOIN COUNTRIES 
ON 
REGIONS.REGION_ID = COUNTRIES.REGION_ID;

SELECT * FROM DEPARTMENTS;


--FIRST VERSION 1
SELECT * 
FROM DEPARTMENTS
INNER JOIN EMPLOYEES 
ON DEPARTMENTS.MANAGER_ID = EMPLOYEES.MANAGER_ID;


--BEST VERSION 2
SELECT DEPARTMENTS.MANAGER_ID, DEPARTMENTS.DEPARTMENT_NAME,EMPLOYEES.FIRST_NAME
FROM DEPARTMENTS
INNER JOIN EMPLOYEES
ON DEPARTMENTS.MANAGER_ID = EMPLOYEES.MANAGER_ID;

--LEFT OUTER JOIN
SELECT DEPARTMENTS.DEPARTMENT_NAME, EMPLOYEES.MANAGER_ID, EMPLOYEES.EMPLOYEE_ID
FROM DEPARTMENTS
LEFT OUTER JOIN EMPLOYEES
ON EMPLOYEES.MANAGER_ID = DEPARTMENTS.MANAGER_ID;

--FULL JOIN
SELECT DEPARTMENTS.DEPARTMENT_NAME, EMPLOYEES.MANAGER_ID
FROM (DEPARTMENTS 
FULL JOIN EMPLOYEES 
ON EMPLOYEES.MANAGER_ID = DEPARTMENTS.MANAGER_ID); 

--DATE
SELECT * FROM JOB_HISTORY
WHERE END_DATE < TO_DATE('07-12-31');

--POSITIVE NUMBER
CREATE TABLE HUMAN(
SIN_NUMBER INTEGER, 
HEIGHT INTEGER CHECK(HEIGHT > 0),
NATIONALITY VARCHAR(15)CHECK (NATIONALITY IN ('H1','H2','H318')),
PRIMARY KEY (SIN_NUMBER));



