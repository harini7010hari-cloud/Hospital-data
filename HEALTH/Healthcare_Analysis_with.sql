use [Healthcare ]

SELECT TOP 10* FROM [dbo].[healthcare_dataset];

SELECT *
FROM Healthcare_Dataset
WHERE Name IS NULL 
   OR [Age] IS NULL 
   OR [Gender] IS NULL 
   OR [Billing_Amount] IS NULL;

WITH CTE AS (
    SELECT *,
           ROW_NUMBER() OVER(PARTITION BY [Name], [Date_of_Admission], [Hospital] ORDER BY Name) AS rn
    FROM Healthcare_Dataset
)
DELETE FROM CTE WHERE rn > 1;

select COUNT(Name) from [dbo].[healthcare_dataset];

UPDATE Healthcare_Dataset
SET Gender = CASE 
               WHEN Gender LIKE 'M%' THEN 'Male'
               WHEN Gender LIKE 'F%' THEN 'Female'
               ELSE Gender
             END;

UPDATE Healthcare_Dataset
SET [Blood_Type] = REPLACE([Blood_Type], ' ', '');


select [Billing_Amount] from Healthcare_Dataset


ALTER TABLE Healthcare_Dataset
ALTER COLUMN [Billing_Amount] DECIMAL(18,0);

SELECT COUNT(DISTINCT [Name] ) AS patientcount
FROM Healthcare_Dataset;

SELECT AVG([Billing_Amount]) AS AverageBilling FROM Healthcare_Dataset;

SELECT [Medical_Condition], COUNT(*) AS PatientCount
FROM Healthcare_Dataset
GROUP BY [Medical_Condition]
ORDER BY PatientCount DESC;

SELECT Gender, COUNT(*) AS Total
FROM Healthcare_Dataset
GROUP BY Gender;

SELECT Hospital, AVG([Billing_Amount]) AS AvgBill
FROM Healthcare_Dataset
GROUP BY Hospital
ORDER BY AvgBill DESC;

SELECT [Test_Results], COUNT(*) AS Total
FROM Healthcare_Dataset
GROUP BY [Test_Results];


SELECT 
    AVG([Billing_Amount]) AS AvgBilling,
    STDEV([Billing_Amount]) AS StdDevBilling
FROM Healthcare_Dataset;
SELECT *  
FROM Healthcare_Dataset
WHERE Age < 50 OR Age > 10;