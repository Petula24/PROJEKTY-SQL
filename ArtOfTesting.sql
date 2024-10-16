CREATE TABLE EmployeeDetails(
	EmpID	INT PRIMARY kEY,
	FullName	VARCHAR(20),
	ManagerID	INT,
	DateOfJoining	DATE,
	City	VARCHAR(20)
);

CREATE TABLE EmployeeSalary (
	EmpID INT,
	Project	VARCHAR(2),
	Salary	INT,
	Variable INT 
);

INSERT INTO EmployeeDetails (EmpID, FullName, ManagerID, DateOfJoining,City)
VALUES (121, 'John Snow', 321, '2019/01/31', 'Toronto'),
		(321, 'Walter White', 986, '2020/01/30', 'California'),
		(421, 'Kuldeep Rana', 876, '2021/11/27', 'New Delhi');

INSERT INTO EmployeeSalary (EmpID, Project, Salary, Variable)
VALUES (121, 'P1', 8000, 500),
		(321, 'P2', 10000, 1000),
		(421, 'P1', 12000, 0)


-- 1) Napište SQL dotaz pro získání EmpID a FullName všech zamìstnancù pracujících pod manažerem s id 986

SELECT EmpID, FullName
FROM EmployeeDetails
WHERE ManagerID = 986;

-- 2) Napište dotaz pro naètení rùzných projektù dostupných z tabulky EmployeeSalary

SELECT DISTINCT(Project)
FROM EmployeeSalary;

-- 3) Napište SQL dotaz pro zjištìní poètu zamìstnancù pracujících v projektu P1

SELECT COUNT(*)
FROM EmployeeSalary
WHERE Project = 'P1';

-- 4) Napište  SQL dotaz pro zjištìní maximální, minimální a prùmìrné mzdy zamìstnancù

SELECT
	MAX(Salary) AS MaxSalary,
	MIN(Salary) AS MinSalary,
	AVG(Salary) AS AvgSalary
FROM EmployeeSalary;

-- 5) Napište SQL dotaz a najdìte ID zamìstnance, jehož plat je v rozsahu 9000 až 15000

SELECT EmpID
FROM EmployeeSalary
WHERE Salary BETWEEN 9000 AND 15000;

-- 6) Napištì SQL dotaz pro vyhledávání zamìstnancù, kteøí žijí v Torontu a pracují pod manažerem s ID 321

SELECT EmpID
FROM EmployeeDetails
WHERE City = 'Toronto' AND ManagerID = 321;

-- 7) Napištì SQL dotaz pro vyhledávání všech zamìstnancù, kteøí žijí v Kalifornii nebo pracují pod manažerem s ID 321

SELECT EmpID
FROM EmployeeDetails
WHERE City = 'California' OR ManagerID = 321;

-- 8) Napištì SQL dotaz pro získání všech zamìstnancù, kteøí pracují na jiných projektech než P1

SELECT EmpID, Project
FROM EmployeeSalary
WHERE Project != 'P1';

-- 9) Napištì SQL dotaz pro zobrazení celkové mzdy každého zamìstnance, který pøidá hodnotu Salary s VARIABLE

SELECT EmpID, Salary + Variable AS TotalSalary
FROM EmployeeSalary;

-- 10) Napištì SQL dotaz pro vyhledávání zamìstnancù, jejichž jméno zaèíná libovolnými dvìma znaky,
-- následuje text "hn" a konèí libovolnou sekvencí znakù

SELECT FullName
FROM EmployeeDetails
WHERE FullName like '__hn%';

-- 11) Napištì SQL dotaz pro naètení všech EmpID, která jsou pøítomna v jedné z tabulek

SELECT EmpID
FROM EmployeeDetails
UNION
SELECT EmpID
FROM EmployeeSalary;

-- 12) Napištì dotaz SQL pro naètení EmpID, která jsou pøítomna v obou tabulkách

SELECT EmpID
FROM EmployeeDetails
WHERE EmpID IN ( SELECT EmpID
				FROM EmployeeDetails);

-- 13) Napištì dotaz SQL pro naètení EmpId, která jsou pøitomna v EmployeeDetails, ale ne v EmployeeSalary

SELECT EmpID
FROM EmployeeDetails
WHERE EmpID NOT IN ( SELECT EmpID
					FROM EmployeeSalary);

-- 14) Napište SQL dotaz pro získání úplných jmen zamìstnance a nahraïte mezeru '-'

SELECT REPLACE(FullName,' ','-')
FROM EmployeeDetails;

-- 15) Napištì SQL dotaz pro naètení jmen zamìstnancù s platem vyšším nebo rovným 5000 a menším nebo rovným 10000

SELECT FullName
FROM EmployeeDetails
WHERE EmpID IN ( SELECT EmpID
				FROM EmployeeSalary
				WHERE Salary BETWEEN 5000 AND 10000); 

-- 16) Napište dotaz SQL pro zjištìní aktuálního data a èasu

SELECT GETDATE() as [Datum a èas];

-- 17) Napište SQL dotaz pro naètení všech podrobností o zamìstancích z tabulky EmployeeDetails, kteøí se pøipojili v roce 2020

SELECT *
FROM EmployeeDetails
WHERE DateOfJoining BETWEEN '2020/01/01' AND '2020/12/31';

-- 18) Napište SQL dotaz pro naètení všech záznamù zamìstnancù z tabulky EmployyeeDetails, kteøí mají záznam o mzdì v tabulce EmployeeSalary

SELECT *
FROM EmployeeDetails ED
WHERE EXISTS (SELECT *
				FROM EmployeeSalary ES
				WHERE ED.EmpID = ES.EmpID);

-- 19) Napištì SQL dotaz pro získání projektového poètu zamìstnancù seøazených podle poètu projektu v sestupném poøadí

SELECT project, COUNT(EmpID) AS pocet
FROM EmployeeSalary
GROUP BY Project
ORDER BY Project DESC;

-- 20) Napište dotaz pro získání jmen zamìstnancù a platových záznamù. 
-- Zobrazte podrobnosti o zamìstnanci, i když u zemìstnance neexistuje záznam o mzdì

SELECT ED.FullName, ES.Salary
FROM EmployeeDetails ED
LEFT JOIN EmployeeSalary ES
ON ED.EmpID = ES.EmpID;

-- 21) Napište SQL dotaz, který naète všechny zamìstnance, kteøí jsou zároveò manažery z tabulky EmloyeeDetails

SELECT ED.EmpID, ED.FullName
FROM EmployeeDetails ED
JOIN EmployeeDetails EM
ON ED.EmpID = EM.ManagerID;



