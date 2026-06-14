SELECT * FROM attrition._db;


RENAME TABLE attrition._db TO emp_attrition;

SELECT * FROM emp_attrition;

SELECT `Employee ID`, COUNT(*)
FROM emp_attrition
GROUP BY `Employee ID`
HAVING COUNT(*) > 1;

SELECT
SUM(CASE WHEN `Years at Company` IS NULL THEN 1 ELSE 0 END) AS yrs_at_company,
SUM(CASE WHEN `Job Role` IS NULL THEN 1 ELSE 0 END) AS jobrole,
SUM(CASE WHEN `Monthly Income` IS NULL THEN 1 ELSE 0 END) AS monthlyincome,
SUM(CASE WHEN `Work-Life Balance` IS NULL THEN 1 ELSE 0 END) AS bal,
SUM(CASE WHEN `Job Satisfaction` IS NULL THEN 1 ELSE 0 END) AS jobsat,
SUM(CASE WHEN `Performance Rating` IS NULL THEN 1 ELSE 0 END) AS perf_rating,
SUM(CASE WHEN `Number of Promotions` IS NULL THEN 1 ELSE 0 END) AS promo,
SUM(CASE WHEN `Overtime` IS NULL THEN 1 ELSE 0 END) AS ot,
SUM(CASE WHEN `Distance from Home` IS NULL THEN 1 ELSE 0 END) AS home_dist,
SUM(CASE WHEN `Education Level` IS NULL THEN 1 ELSE 0 END) AS edu_level,
SUM(CASE WHEN `Marital Status` IS NULL THEN 1 ELSE 0 END) AS marital_status,
SUM(CASE WHEN `Number of Dependents` IS NULL THEN 1 ELSE 0 END) AS dep,
SUM(CASE WHEN `Job Level` IS NULL THEN 1 ELSE 0 END) AS job_level,
SUM(CASE WHEN `Company Size` IS NULL THEN 1 ELSE 0 END) AS com_size,
SUM(CASE WHEN `Company Tenure` IS NULL THEN 1 ELSE 0 END) AS tenure,
SUM(CASE WHEN `Remote Work` IS NULL THEN 1 ELSE 0 END) AS remotework,
SUM(CASE WHEN `Leadership Opportunities` IS NULL THEN 1 ELSE 0 END) AS ldr_opp,
SUM(CASE WHEN `Innovation Opportunities` IS NULL THEN 1 ELSE 0 END) AS innov,
SUM(CASE WHEN `Company Reputation` IS NULL THEN 1 ELSE 0 END) AS reput,
SUM(CASE WHEN `Employee Recognition` IS NULL THEN 1 ELSE 0 END) AS emp_rec,
SUM(CASE WHEN `Attrition` IS NULL THEN 1 ELSE 0 END) AS attr
FROM emp_attrition;


SELECT Attrition
FROM emp_attrition;

SELECT Attrition, COUNT(*)
FROM emp_attrition
GROUP BY Attrition;

SELECT DISTINCT `Job Role`
FROM emp_attrition;

SELECT DISTINCT `Job Satisfaction`
FROM emp_attrition;

SELECT DISTINCT `Education Level`
FROM emp_attrition;	

SELECT DISTINCT `Company Size`
FROM emp_attrition;

SELECT DISTINCT `Marital Status`
FROM emp_attrition;

SELECT DISTINCT `Employee Recognition`
FROM emp_attrition;

SELECT MIN(age), MAX(age) FROM emp_attrition;

SELECT MIN(`Years at Company`), MAX(`Years at Company`) FROM emp_attrition;

SELECT MIN(`Monthly Income`), MAX(`Monthly Income`) FROM emp_attrition;

SELECT MIN(`Company Tenure`), MAX(`Company Tenure`) FROM emp_attrition;

SELECT MIN(`Number of Promotions`), MAX(`Number of Promotions`) FROM emp_attrition;

SELECT MIN(`Distance from Home`), MAX(`Distance from Home`) FROM emp_attrition;

#...................................................................TOTAL EMPLOYEES
SELECT COUNT(`Employee ID`) as emp_count FROM emp_attrition;


#...................................................................TOTAL EMPLOYEES LEFT
SELECT COUNT(`Employee ID`) as emp_count FROM emp_attrition WHERE Attrition = 'Left';


#.......................................................ATTRITION RATE
SELECT
(SUM(CASE WHEN Attrition = 'Left' THEN 1 ELSE 0 END)*100)/COUNT(*) AS attr_pct
FROM emp_attrition;

#.........................................................AVG MONTHLY INCOME
SELECT AVG(`Monthly Income`) as avg_mon_inc
FROM emp_attrition;

#.........................................................AVG YRS OF EXP.
SELECT AVG(`Years at Company`) as yrs_at_com
FROM emp_attrition;

#.........................................................AVG COMPANY TENURE
SELECT AVG(`Company Tenure`) as company_tenure
FROM emp_attrition;


#.......................................................ATTRITION RATE BY AGE GROUP
SELECT CASE
	WHEN `age` BETWEEN 18 AND 25 THEN '18-25(EARLY)'
   WHEN `age` BETWEEN 26 AND 35 THEN '26-35(MID)'
   WHEN `age` BETWEEN 36 AND 45 THEN '36-45(MATURE)'
    ELSE '46-59(SENIOR)'
    END AS age_grp,
(SUM(CASE WHEN Attrition = 'Left' THEN 1 ELSE 0 END)*100)/COUNT(*) AS attr_pct
FROM emp_attrition
GROUP BY age_grp
ORDER BY attr_pct DESC;

#.......................................................ATTRITION RATE BY GENDER
SELECT `Gender`,
(SUM(CASE WHEN Attrition = 'Left' THEN 1 ELSE 0 END)*100)/COUNT(*) AS attr_pct
FROM emp_attrition
GROUP BY `Gender`
ORDER BY attr_pct DESC;

#.......................................................ATTRITION RATE BY MARITAL STATUS
SELECT `Marital Status`,
(SUM(CASE WHEN Attrition = 'Left' THEN 1 ELSE 0 END)*100)/COUNT(*) AS attr_pct
FROM emp_attrition
GROUP BY `Marital Status`
ORDER BY attr_pct DESC;

#.......................................................ATTRITION RATE BY EDUCATION LEVEL
SELECT `Education Level`,
(SUM(CASE WHEN Attrition = 'Left' THEN 1 ELSE 0 END)*100)/COUNT(*) AS attr_pct
FROM emp_attrition
GROUP BY `Education Level`;


#.......................................................ATTRITION RATE BY Job Level
SELECT `Job Level`,
(SUM(CASE WHEN Attrition = 'Left' THEN 1 ELSE 0 END)*100)/COUNT(*) AS attr_pct
FROM emp_attrition
GROUP BY `Job Level`
ORDER BY attr_pct DESC;


#.......................................................ATTRITION RATE BY Company Tenure
SELECT CASE
	WHEN `Company Tenure` BETWEEN 2 AND 5 THEN 'Startup(2-5)'
   WHEN `Company Tenure` BETWEEN 6 AND 15 THEN 'Growth(6-15)'
   WHEN `Company Tenure` BETWEEN 16 AND 30 THEN 'Established(16-30)'
   WHEN `Company Tenure` BETWEEN 31 AND 60 THEN 'Mature(31-60)'
    ELSE 'Legacy(60+)'
    END AS company_tenure,
(SUM(CASE WHEN Attrition = 'Left' THEN 1 ELSE 0 END)*100)/COUNT(*) AS attr_pct
FROM emp_attrition
GROUP BY company_tenure
ORDER BY attr_pct DESC;


#.......................................................ATTRITION RATE BY Work Life Balance
SELECT `Work-Life Balance`,
(SUM(CASE WHEN Attrition = 'Left' THEN 1 ELSE 0 END)*100)/COUNT(*) AS attr_pct
FROM emp_attrition
GROUP BY `Work-Life Balance`
ORDER BY attr_pct DESC;


#.......................................................ATTRITION RATE BY Remote Work
SELECT `Remote Work`,
(SUM(CASE WHEN Attrition = 'Left' THEN 1 ELSE 0 END)*100)/COUNT(*) AS attr_pct
FROM emp_attrition
GROUP BY `Remote Work`
ORDER BY attr_pct DESC;


#.......................................................ATTRITION RATE BY Promotions
SELECT `Number of Promotions`,
(SUM(CASE WHEN Attrition = 'Left' THEN 1 ELSE 0 END)*100)/COUNT(*) AS attr_pct
FROM emp_attrition
GROUP BY `Number of Promotions`
ORDER BY attr_pct DESC;


