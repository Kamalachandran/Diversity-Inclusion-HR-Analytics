create database HR_DI;

use HR_DI;

CREATE TABLE promotion (
    Employee_ID INT NOT NULL PRIMARY KEY,
    Gender VARCHAR(100),
    Job_Level_after_FY20_promotions VARCHAR(100),
    New_hire_FY20 VARCHAR(100),
    FY20_Performance_Rating INT,
    Promotion_in_FY21 VARCHAR(100),
    In_base_group_for_Promotion_FY21 VARCHAR(100),
    Target_hire_balance INT,
    FY20_leaver VARCHAR(100),
    In_base_group_for_turnover_FY20 VARCHAR(100),
    Department_01_07_2020 VARCHAR(100),
    Leaver_FY VARCHAR(100),
    Job_Level_after_FY21_promotions VARCHAR(100),
    Last_Department_in_FY20 VARCHAR(100),
    FTE_group VARCHAR(100),
    Time_type VARCHAR(100),
    Department_and_JL_group_PRA_status VARCHAR(100),
    Department_and_JL_group_for_PRA VARCHAR(100),
    Job_Level_group_PRA_status VARCHAR(100),
    Job_Level_group_for_PRA VARCHAR(100),
    Time_in_Job_Level_01_07_2020 INT,
    Job_Level_before_FY20_promotions VARCHAR(100),
    Promotion_in_FY20 VARCHAR(100),
    FY19_Performance_Rating INT,
    Age_group VARCHAR(100),
    Age_01_07_2020 INT,
    Nationality_1 VARCHAR(100),
    Region_group_nationality_1 VARCHAR(100),
    Broad_region_group_nationality_1 VARCHAR(100),
    Last_hire_date DATE,
    Years_since_last_hire INT,
    Rand DOUBLE
);

select * from Promotion limit 5;


-- 1.retrieve all employee who are from germany

SELECT 
    *
FROM
    promotion
WHERE
    Nationality_1 = 'Germany';

-- 2.count total no of male & female employee

SELECT 
    Gender, COUNT(Employee_ID) AS No_of_Employees
FROM
    promotion
GROUP BY Gender;

-- 3.show all employee who are new hire in FY20

SELECT 
    Employee_ID,Job_Level_after_FY20_promotions as Job_level
FROM
    promotion
WHERE
    New_hire_FY20 = 'Y';

-- 4.find the average performance rating by joblevel

SELECT 
    Job_Level_after_FY20_promotions AS Job_level,
    CONCAT(ROUND(AVG(FY20_Performance_Rating), 2),
            '%') AS Avg_Performance_Rating
FROM
    promotion
GROUP BY Job_Level_after_FY20_promotions
ORDER BY Job_Level_after_FY20_promotions;

-- 5.get no of employee who got a promotion in FY21

SELECT 
    COUNT(Employee_ID) AS No_of_employee_promotion_in_FY21
FROM
    promotion
WHERE
    Promotion_in_FY21 = 'Yes';

-- 6.list the top5 old employee with their age & joblevel

SELECT 
    Employee_ID,
    Age_01_07_2020 AS Age,
    Job_Level_after_FY20_promotions AS Job_level
FROM
    promotion
ORDER BY Age_01_07_2020 DESC
LIMIT 5;

-- 7.find the region with the highest no of employees

SELECT 
    Region_group_nationality_1 AS Region,
    COUNT(Employee_ID) AS No_of_Employees
FROM
    promotion
GROUP BY Region_group_nationality_1
ORDER BY COUNT(Employee_ID) DESC;

-- 8.calculate average years since last hire by region

SELECT 
    Region_group_nationality_1 AS Region,
    CONCAT(ROUND(AVG(Years_since_last_hire), 2),'%') AS Avg_Years_Since_Last_Hire
FROM
    promotion
GROUP BY Region_group_nationality_1
ORDER BY Avg_Years_Since_Last_Hire DESC;


-- 9.find the performance trend compare average FY19 performance rating Vs FY20 performance rating for each job level

SELECT 
    Job_Level_after_FY20_promotions AS Job_Level,
    CONCAT(ROUND(AVG(FY19_Performance_Rating), 2),'%') AS Avg_FY19_Performance,
    CONCAT(ROUND(AVG(FY20_Performance_Rating), 2),'%') AS Avg_FY20_Performance,
    CONCAT(ROUND(AVG(FY20_Performance_Rating) - AVG(FY19_Performance_Rating),2),'%') AS Rating_Change
FROM
    promotion
GROUP BY Job_Level_after_FY20_promotions
ORDER BY Job_Level_after_FY20_promotions;

-- 10. find employee who left in FY20 but had performance rating above 3.

SELECT 
    Employee_ID,
    Job_Level_after_FY20_promotions as Job_level,
    FY20_Performance_Rating as Performance_rating
FROM
    promotion
WHERE
    FY20_leaver = 'Yes'
        AND FY20_Performance_Rating > 3;
        
-- 11. Retrieve the number of employees categorized by their performance rating for the year 2020.

SELECT 
    FY20_Performance_Rating, COUNT(Employee_ID) AS Employee
FROM
    promotion
GROUP BY FY20_Performance_Rating
ORDER BY FY20_Performance_Rating;