SET GLOBAL local_infile=1;

CREATE SCHEMA IF NOT EXISTS ndap;
USE ndap;

CREATE TABLE IF NOT EXISTS FarmersInsuranceData (
    rowID INT AUTO_INCREMENT PRIMARY KEY,
    srcYear INT,
    srcStateName VARCHAR(255),
    srcDistrictName VARCHAR(255),
    InsuranceUnits INT,
    TotalFarmersCovered INT,
    ApplicationsLoaneeFarmers INT,
    ApplicationsNonLoaneeFarmers INT,
    InsuredLandArea FLOAT,
    FarmersPremiumAmount DECIMAL(10,2),
    StatePremiumAmount DECIMAL(10,2),
    GOVPremiumAmount DECIMAL(10,2),
    GrossPremiumAmountToBePaid DECIMAL(10,2),
    SumInsured DECIMAL(15,2),
    PercentageMaleFarmersCovered FLOAT,
    PercentageFemaleFarmersCovered FLOAT,
    PercentageOthersCovered FLOAT,
    PercentageSCFarmersCovered FLOAT,
    PercentageSTFarmersCovered FLOAT,
    PercentageOBCFarmersCovered FLOAT,
    PercentageGeneralFarmersCovered FLOAT,
    PercentageMarginalFarmers FLOAT,
    PercentageSmallFarmers FLOAT,
    PercentageOtherFarmers FLOAT,
    YearCode INT,
    Year_ VARCHAR(255),
    Country VARCHAR(255),
    StateCode INT,
    DistrictCode INT,
    TotalPopulation INT,
    TotalPopulationUrban INT,
    TotalPopulationRural INT,
    TotalPopulationMale INT,
    TotalPopulationMaleUrban INT,
    TotalPopulationMaleRural INT,
    TotalPopulationFemale INT,
    TotalPopulationFemaleUrban INT,
    TotalPopulationFemaleRural INT,
    NumberOfHouseholds INT,
    NumberOfHouseholdsUrban INT,
    NumberOfHouseholdsRural INT,
    LandAreaUrban FLOAT,
    LandAreaRural FLOAT,
    LandArea FLOAT
);

USE ndap;
show tables;
desc farmersinsurancedata;


LOAD DATA LOCAL INFILE "C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\data.csv"
INTO TABLE FarmersInsuranceData
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

select * from farmersinsurancedata;

SELECT COUNT(*) AS row_count FROM FarmersInsuranceData;

UPDATE farmersinsurancedata
SET 
  InsuranceUnits = COALESCE(InsuranceUnits, 0),
  TotalFarmersCovered = COALESCE(TotalFarmersCovered, 0),
  ApplicationsLoaneeFarmers = COALESCE(ApplicationsLoaneeFarmers, 0),
  ApplicationsNonLoaneeFarmers = COALESCE(ApplicationsNonLoaneeFarmers, 0),
  InsuredLandArea = COALESCE(InsuredLandArea, 0),
  FarmersPremiumAmount = COALESCE(FarmersPremiumAmount, 0),
  StatePremiumAmount = COALESCE(StatePremiumAmount, 0),
  GOVPremiumAmount = COALESCE(GOVPremiumAmount, 0),
  GrossPremiumAmountToBePaid = COALESCE(GrossPremiumAmountToBePaid, 0),
  SumInsured = COALESCE(SumInsured, 0),
  PercentageMaleFarmersCovered = COALESCE(PercentageMaleFarmersCovered, 0),
  PercentageFemaleFarmersCovered = COALESCE(PercentageFemaleFarmersCovered, 0),
  PercentageOthersCovered = COALESCE(PercentageOthersCovered, 0),
  PercentageSCFarmersCovered = COALESCE(PercentageSCFarmersCovered, 0),
  PercentageSTFarmersCovered = COALESCE(PercentageSTFarmersCovered, 0),
  PercentageOBCFarmersCovered = COALESCE(PercentageOBCFarmersCovered, 0),
  PercentageGeneralFarmersCovered = COALESCE(PercentageGeneralFarmersCovered, 0),
  PercentageMarginalFarmers = COALESCE(PercentageMarginalFarmers, 0),
  PercentageSmallFarmers = COALESCE(PercentageSmallFarmers, 0),
  PercentageOtherFarmers = COALESCE(PercentageOtherFarmers, 0),
  YearCode = COALESCE(YearCode, 0),
  StateCode = COALESCE(StateCode, 0),
  DistrictCode = COALESCE(DistrictCode, 0),
  TotalPopulation = COALESCE(TotalPopulation, 0),
  TotalPopulationUrban = COALESCE(TotalPopulationUrban, 0),
  TotalPopulationRural = COALESCE(TotalPopulationRural, 0),
  TotalPopulationMale = COALESCE(TotalPopulationMale, 0),
  TotalPopulationMaleUrban = COALESCE(TotalPopulationMaleUrban, 0),
  TotalPopulationMaleRural = COALESCE(TotalPopulationMaleRural, 0),
  TotalPopulationFemale = COALESCE(TotalPopulationFemale, 0),
  TotalPopulationFemaleUrban = COALESCE(TotalPopulationFemaleUrban, 0),
  TotalPopulationFemaleRural = COALESCE(TotalPopulationFemaleRural, 0),
  NumberOfHouseholds = COALESCE(NumberOfHouseholds, 0),
  NumberOfHouseholdsUrban = COALESCE(NumberOfHouseholdsUrban, 0),
  NumberOfHouseholdsRural = COALESCE(NumberOfHouseholdsRural, 0),
  LandAreaUrban = COALESCE(LandAreaUrban, 0),
  LandAreaRural = COALESCE(LandAreaRural, 0),
  LandArea = COALESCE(LandArea, 0)
WHERE rowID IS NOT NULL;


use ndap;

-- ----------------------------------------------------------------------------------------------
-- SECTION 1. 
-- SELECT Queries [5 Marks]

-- 	Q1.	Retrieve the names of all states (srcStateName) from the dataset.
-- ###
-- 	[2 Marks]
-- ###
-- TYPE YOUR CODE BELOW >
SELECT DISTINCT srcStateName
FROM FarmersInsuranceData;


-- <write your answers in the empty spaces given, the length of solution queries (and the solution writing space) can vary>

###

-- 	Q2.	Retrieve the total number of farmers covered (TotalFarmersCovered) 
-- 		and the sum insured (SumInsured) for each state (srcStateName), ordered by TotalFarmersCovered in descending order.
-- ###
-- 	[3 Marks]
-- ###
-- TYPE YOUR CODE BELOW >
SELECT srcStateName, 
       SUM(TotalFarmersCovered) AS TotalFarmersCovered,
       SUM(SumInsured) AS SumInsured
FROM farmersinsurancedata
GROUP BY srcStateName
ORDER BY TotalFarmersCovered DESC;

-- ###

-- --------------------------------------------------------------------------------------
-- SECTION 2. 
-- Filtering Data (WHERE) [15 Marks]

-- 	Q3.	Retrieve all records where Year is '2020'.
-- ###
-- 	[2 Marks]
-- ###
-- TYPE YOUR CODE BELOW >
SELECT * FROM farmersinsurancedata
WHERE YearCode = '2020';

-- ###

-- 	Q4.	Retrieve all rows where the TotalPopulationRural is greater than 1 million and the srcStateName is 'HIMACHAL PRADESH'.
-- ###
-- 	[3 Marks]
-- ###
-- TYPE YOUR CODE BELOW >
SELECT * FROM farmersinsurancedata
WHERE TotalPopulationRural > 1000000 
AND srcStateName = 'HIMACHAL PRADESH';

-- ###

-- 	Q5.	Retrieve the srcStateName, srcDistrictName, and the sum of FarmersPremiumAmount for each district in the year 2018, 
-- 		and display the results ordered by FarmersPremiumAmount in ascending order.
-- ###
-- 	[5 Marks]
-- ###
-- TYPE YOUR CODE BELOW >
SELECT 
	srcStateName, 
    srcDistrictName, 
    SUM(FarmersPremiumAmount) AS Total_Farmers_Premium_Amt
    FROM farmersinsurancedata
    WHERE YearCode='2018'
    GROUP BY srcStateName, srcDistrictName
    ORDER BY Total_Farmers_Premium_Amt;

-- ###

-- 	Q6.	Retrieve the total number of farmers covered (TotalFarmersCovered) and the sum of premiums (GrossPremiumAmountToBePaid) for each state (srcStateName) 
-- 		where the insured land area (InsuredLandArea) is greater than 5.0 and the Year is 2018.
-- ###
-- 	[5 Marks]
-- ###
-- TYPE YOUR CODE BELOW >

SELECT 
	srcStateName, 
    SUM(TotalFarmersCovered) AS TotalFarmersCovered,
    SUM(GrossPremiumAmountToBePaid) AS TotalPremiumAmount
FROM farmersinsurancedata
WHERE InsuredLandArea > 5.0 AND YearCode = 2018
GROUP BY srcStateName;
	  
-- ###
-- ------------------------------------------------------------------------------------------------

-- SECTION 3.
-- Aggregation (GROUP BY) [10 marks]

-- 	Q7. 	Calculate the average insured land area (InsuredLandArea) for each year (srcYear).
-- ###
-- 	[3 Marks]
-- ###
-- TYPE YOUR CODE BELOW >
SELECT srcYear, 
       AVG(InsuredLandArea) AS AverageInsuredLandArea
FROM farmersinsurancedata
GROUP BY srcYear
ORDER BY srcYear ASC;

-- ###

-- 	Q8. 	Calculate the total number of farmers covered (TotalFarmersCovered) for each district (srcDistrictName) where Insurance units is greater than 0.
-- ###
-- 	[3 Marks]
-- ###
-- TYPE YOUR CODE BELOW >

SELECT 
	srcDistrictName, 
	SUM(TotalFarmersCovered) AS TotalFarmersCovered
FROM farmersinsurancedata
WHERE InsuranceUnits > 0
GROUP BY srcDistrictName
ORDER BY TotalFarmersCovered;

-- ###

-- 	Q9.	For each state (srcStateName), calculate the total premium amounts (FarmersPremiumAmount, StatePremiumAmount, GOVPremiumAmount) 
-- 		and the total number of farmers covered (TotalFarmersCovered). Only include records where the sum insured (SumInsured) is greater than 500,000 (remember to check for scaling).
-- ###
-- 	[4 Marks]
-- ###
-- TYPE YOUR CODE BELOW >

SELECT 
    srcStateName,
    SUM(FarmersPremiumAmount) AS TotalFarmersPremium,
    SUM(StatePremiumAmount) AS TotalStatePremium,
    SUM(GOVPremiumAmount) AS TotalGovPremium,
    SUM(TotalFarmersCovered) AS TotalFarmersCovered
FROM 
    FarmersInsuranceData
WHERE 
    SumInsured > 500  -- Scaled: 500 = 500,000 INR
GROUP BY 
    srcStateName
ORDER BY 
    srcStateName;




-- ###

-- -------------------------------------------------------------------------------------------------
-- SECTION 4.
-- Sorting Data (ORDER BY) [10 Marks]

-- 	Q10.	Retrieve the top 5 districts (srcDistrictName) with the highest TotalPopulation in the year 2020.
-- ###
-- 	[2 Marks]
-- ###
-- TYPE YOUR CODE BELOW >

SELECT
	srcDistrictName,
    TotalPopulation
FROM farmersinsurancedata
WHERE srcYear = '2020'
ORDER BY TotalPopulation DESC
LIMIT 5;

-- ###

-- 	Q11.	Retrieve the srcStateName, srcDistrictName, and SumInsured for the 10 districts with the lowest non-zero FarmersPremiumAmount, 
-- 		ordered by insured sum and then the FarmersPremiumAmount.
-- ###
-- 	[3 Marks]
-- ###
-- TYPE YOUR CODE BELOW >

SELECT 
	srcStateName, 
    srcDistrictName,
    SumInsured
FROM farmersinsurancedata
WHERE FarmersPremiumAmount > 0
ORDER BY FarmersPremiumAmount ASC, SumInsured ASC
LIMIT 10;

###

-- 	Q12. 	Retrieve the top 3 states (srcStateName) along with the year (srcYear) where the ratio of insured farmers (TotalFarmersCovered) to the total population (TotalPopulation) is highest. 
-- 		Sort the results by the ratio in descending order.
-- ###
-- 	[5 Marks]
-- ###
-- TYPE YOUR CODE BELOW >
SELECT 
    srcStateName, 
    srcYear, 
    (TotalFarmersCovered * 1.0 / TotalPopulation) AS InsuredFarmersRatio
FROM farmersinsurancedata
WHERE TotalPopulation > 0  
ORDER BY InsuredFarmersRatio DESC
LIMIT 3;

-- ###

-- -------------------------------------------------------------------------------------------------

-- SECTION 5.
-- String Functions [6 Marks]

-- 	Q13. 	Create StateShortName by retrieving the first 3 characters of the srcStateName for each unique state.
-- ###
-- 	[2 Marks]
-- ###
-- TYPE YOUR CODE BELOW >
SELECT DISTINCT 
    srcStateName, 
    LEFT(srcStateName, 3) AS StateShortName
FROM farmersinsurancedata;


-- ###

-- 	Q14. 	Retrieve the srcDistrictName where the district name starts with 'B'.
-- ###
-- 	[2 Marks]
-- ###
-- TYPE YOUR CODE BELOW >
SELECT 
	srcDistrictName
    FROM farmersinsurancedata
    WHERE srcDistrictName LIKE 'B%';

-- ###

-- 	Q15. 	Retrieve the srcStateName and srcDistrictName where the district name contains the word 'pur' at the end.
-- ###
-- 	[2 Marks]
-- ###
-- TYPE YOUR CODE BELOW >
SELECT 
	srcStateName,
    srcDistrictName
FROM farmersinsurancedata
WHERE srcDistrictName LIKE 'PUR%';

-- ###

-- -------------------------------------------------------------------------------------------------

-- SECTION 6.
-- Joins [14 Marks]

-- 	Q16. 	Perform an INNER JOIN between the srcStateName and srcDistrictName columns to retrieve the aggregated FarmersPremiumAmount for districts where the district’s Insurance units for an individual year are greater than 10.
-- ###
-- 	[4 Marks]
-- ###
-- TYPE YOUR CODE BELOW >

SELECT 
    t.srcYear, 
    t.srcStateName, 
    t.srcDistrictName, 
    SUM(t.FarmersPremiumAmount) AS TotalFarmersPremium
FROM farmersinsurancedata t
WHERE t.InsuranceUnits > 10
GROUP BY t.srcYear, t.srcStateName, t.srcDistrictName;

-- ###

-- 	Q17.	Write a query that retrieves srcStateName, srcDistrictName, Year, TotalPopulation for each district and the the highest recorded FarmersPremiumAmount for that district over all available years
-- 		Return only those districts where the highest FarmersPremiumAmount exceeds 20 crores.
-- ###
-- 	[5 Marks]
-- ###
-- TYPE YOUR CODE BELOW >

SELECT 
    f.srcStateName,
    f.srcDistrictName,
    f.srcYear,
    f.TotalPopulation,
    max_data.MaxPremiumAmount AS MaxPremiumInINR
FROM FarmersInsuranceData f
JOIN (
    SELECT 
        srcStateName,
        srcDistrictName,
        MAX(FarmersPremiumAmount) AS MaxPremiumAmount
    FROM FarmersInsuranceData
    GROUP BY srcStateName, srcDistrictName
    HAVING MAX(FarmersPremiumAmount) > 20  -- 20 crores
) AS max_data
ON f.srcStateName = max_data.srcStateName 
AND f.srcDistrictName = max_data.srcDistrictName
AND f.FarmersPremiumAmount = max_data.MaxPremiumAmount
ORDER BY MaxPremiumInINR DESC;


-- ###

-- 	Q18.	Perform a LEFT JOIN to combine the total population statistics with the farmers’ data (TotalFarmersCovered, SumInsured) for each district and state. 
-- 		Return the total premium amount (FarmersPremiumAmount) and the average population count for each district aggregated over the years, where the total FarmersPremiumAmount is greater than 100 crores.
-- 		Sort the results by total farmers' premium amount, highest first.
-- ###
-- 	[5 Marks]
-- ###
-- TYPE YOUR CODE BELOW >
SELECT 
    f.srcStateName,
    f.srcDistrictName,
    SUM(f.FarmersPremiumAmount) AS TotalFarmersPremium_Lakhs,
    SUM(f.TotalFarmersCovered) AS TotalFarmersCovered,
    SUM(f.SumInsured) AS TotalSumInsured,
    ROUND(AVG(p.TotalPopulation), 0) AS AvgPopulation
FROM FarmersInsuranceData f
LEFT JOIN (
    SELECT 
        srcStateName,
        srcDistrictName,
        srcYear,
        AVG(TotalPopulation) AS TotalPopulation
    FROM FarmersInsuranceData
    WHERE TotalPopulation IS NOT NULL
    GROUP BY srcStateName, srcDistrictName, srcYear
) p
ON f.srcStateName = p.srcStateName 
AND f.srcDistrictName = p.srcDistrictName 
AND f.srcYear = p.srcYear
GROUP BY f.srcStateName, f.srcDistrictName
HAVING SUM(f.FarmersPremiumAmount) > 10000
ORDER BY TotalFarmersPremium_Lakhs DESC;


-- ###

-- -------------------------------------------------------------------------------------------------

-- SECTION 7.
-- Subqueries [10 Marks]

-- 	Q19.	Write a query to find the districts (srcDistrictName) where the TotalFarmersCovered is greater than the average TotalFarmersCovered across all records.
-- ###
-- 	[2 Marks]
-- ###
-- TYPE YOUR CODE BELOW >
SELECT 
    srcDistrictName, 
    srcStateName, 
    TotalFarmersCovered
FROM farmersinsurancedata
WHERE TotalFarmersCovered > (SELECT AVG(TotalFarmersCovered) FROM farmersinsurancedata);


-- ###

-- 	Q20.	Write a query to find the srcStateName where the SumInsured is higher than the SumInsured of the district with the highest FarmersPremiumAmount.
-- ###
-- 	[3 Marks]
-- ###
-- TYPE YOUR CODE BELOW >

SELECT DISTINCT 
	srcStateName
FROM farmersinsurancedata
WHERE SumInsured > (
    SELECT MAX(SumInsured) 
    FROM farmersinsurancedata 
    WHERE FarmersPremiumAmount = (SELECT MAX(FarmersPremiumAmount) FROM farmersinsurancedata)
);

-- ###

-- 	Q21.	Write a query to find the srcDistrictName where the FarmersPremiumAmount is higher than the average FarmersPremiumAmount of the state that has the highest TotalPopulation.
-- ###
-- 	[5 Marks]
-- ###
-- TYPE YOUR CODE BELOW >
SELECT srcDistrictName, srcStateName, FarmersPremiumAmount
FROM farmersinsurancedata
WHERE FarmersPremiumAmount > (
    -- Get the average FarmersPremiumAmount for the state with the highest TotalPopulation
    SELECT AVG(FarmersPremiumAmount)
    FROM farmersinsurancedata
    WHERE srcStateName = (
        -- Find the state with the highest TotalPopulation
        SELECT srcStateName 
        FROM farmersinsurancedata 
        ORDER BY TotalPopulation DESC 
        LIMIT 1
    )
)
ORDER BY FarmersPremiumAmount DESC;




-- ###

-- -------------------------------------------------------------------------------------------------

-- SECTION 8.
-- Advanced SQL Functions (Window Functions) [10 Marks]

-- 	Q22.	Use the ROW_NUMBER() function to assign a row number to each record in the dataset ordered by total farmers covered in descending order.
-- ###
-- 	[3 Marks]
-- ###
-- TYPE YOUR CODE BELOW >

SELECT 
    ROW_NUMBER() OVER (ORDER BY TotalFarmersCovered DESC) AS RowNum,
    srcStateName,
    srcDistrictName,
    TotalFarmersCovered
FROM farmersinsurancedata;



-- ###

-- 	Q23.	Use the RANK() function to rank the districts (srcDistrictName) based on the SumInsured (descending) and partition by alphabetical srcStateName.
-- ###
-- 	[3 Marks]
-- ###
-- TYPE YOUR CODE BELOW >
SELECT 
    srcStateName,
    srcDistrictName,
    SumInsured,
    RANK() OVER (PARTITION BY srcStateName ORDER BY SumInsured DESC) AS RankInState
FROM farmersinsurancedata
ORDER BY srcStateName ASC, RankInState ASC;



-- ###

-- 	Q24.	Use the SUM() window function to calculate a cumulative sum of FarmersPremiumAmount for each district (srcDistrictName), ordered ascending by the srcYear, partitioned by srcStateName.
-- ###
-- 	[4 Marks]
-- ###
-- TYPE YOUR CODE BELOW >
SELECT 
    srcStateName,
    srcDistrictName,
    srcYear,
    FarmersPremiumAmount,
    SUM(FarmersPremiumAmount) OVER (
        PARTITION BY srcStateName, srcDistrictName 
        ORDER BY srcYear ASC
    ) AS CumulativeFarmersPremium
FROM farmersinsurancedata
ORDER BY srcStateName ASC, srcDistrictName ASC, srcYear ASC;




-- ###

-- -------------------------------------------------------------------------------------------------

-- SECTION 9.
-- Data Integrity (Constraints, Foreign Keys) [4 Marks]

-- 	Q25.	Create a table 'districts' with DistrictCode as the primary key and columns for DistrictName and StateCode. 
-- 		Create another table 'states' with StateCode as primary key and column for StateName.
-- ###
-- 	[2 Marks]
-- ###
-- TYPE YOUR CODE BELOW >

-- Create 'states' table
CREATE TABLE states (
    StateCode INT PRIMARY KEY,
    StateName VARCHAR(255) NOT NULL
);

-- Create 'districts' table
CREATE TABLE districts (
    DistrictCode INT PRIMARY KEY,
    DistrictName VARCHAR(255) NOT NULL,
    StateCode INT,
    FOREIGN KEY (StateCode) REFERENCES states(StateCode) ON DELETE CASCADE
);

-- ###

-- 	Q26.	Add a foreign key constraint to the districts table that references the StateCode column from a states table.
-- ###
-- 	[2 Marks]
-- ###
-- TYPE YOUR CODE BELOW >

ALTER TABLE districts 
ADD CONSTRAINT fk_statecode
FOREIGN KEY (StateCode) 
REFERENCES states(StateCode) 
ON DELETE CASCADE 
ON UPDATE CASCADE;



-- ###

-- -------------------------------------------------------------------------------------------------

-- SECTION 10.
-- UPDATE and DELETE [6 Marks]

-- 	Q27.	Update the FarmersPremiumAmount to 500.0 for the record where rowID is 1.
-- ###
-- 	[2 Marks]
-- ###
-- TYPE YOUR CODE BELOW >
UPDATE farmersinsurancedata
SET FarmersPremiumAmount = 500.0
WHERE rowID = 1;

-- ###

-- 	Q28.	Update the Year to '2021' for all records where srcStateName is 'HIMACHAL PRADESH'.
-- ###
-- 	[2 Marks]
-- ###
-- TYPE YOUR CODE BELOW >

SET SQL_SAFE_UPDATES = 0;

UPDATE farmersinsurancedata
SET srcYear = '2021'
WHERE srcStateName = 'HIMACHAL PRADESH';

-- ###

-- 	Q29.	Delete all records where the TotalFarmersCovered is less than 10000 and Year is 2020.
-- ###
-- 	[2 Marks]
-- ###
-- TYPE YOUR CODE BELOW >

DELETE FROM farmersinsurancedata
WHERE TotalFarmersCovered < 10000 
AND srcYear = 2020;

-- ###