DROP SCHEMA IF EXISTS CompanyOrganization;

CREATE SCHEMA CompanyOrganization;

USE CompanyOrganization;

DROP TABLE IF EXISTS CompanyOrg;

CREATE TABLE CompanyOrg(
	EmployeeID INT NOT NULL PRIMARY KEY,
    EmployeeName VARCHAR(100) NOT NULL,
    ManagerID INT,
    TitleID INT NOT NULL,
	Title VARCHAR(100) NOT NULL
 );

#	I entered the following records out of sequence and Employee ID to show
#	that you can account for ad-hoc data entry and later appends to the table,
#	and still provide a meaningfully sorted result.

INSERT INTO CompanyOrg VALUES(1,'Richard',9,4,'Executive Assistant');
INSERT INTO CompanyOrg VALUES(2,'Judith',10,3,'Director');
INSERT INTO CompanyOrg VALUES(3,'Trent',10,3,'Director');
INSERT INTO CompanyOrg VALUES(4,'Marian',9,2,'Vice President');
INSERT INTO CompanyOrg VALUES(5,'Robert',11,3,'Director');
INSERT INTO CompanyOrg VALUES(6,'Vanessa',11,3,'Director');
INSERT INTO CompanyOrg VALUES(7,'Anne',11,3,'Director');
INSERT INTO CompanyOrg VALUES(8,'Adam',4,3,'Director');
INSERT INTO CompanyOrg VALUES(9,'David',NULL,1,'CEO');
INSERT INTO CompanyOrg VALUES(10,'Aaron',9,2,'Vice President');
INSERT INTO CompanyOrg VALUES(11,'Mike',9,2,'Vice President');

#	Other fields could be shown to make the sorts explicit,
#	but this  view without IDs is good for a report.

SELECT
	T1.EmployeeName, T1.Title, T2.EmployeeName AS 'ReportsTo'
FROM
	CompanyOrg AS T1 LEFT JOIN CompanyOrg AS T2 ON T1.ManagerID = T2.EmployeeID
ORDER BY
	T1.TitleID, T2.EmployeeName, T1.EmployeeName;