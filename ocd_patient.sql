SELECT * FROM HEALTHCARE.ocd_patient;
USE HEALTHCARE;

-- Count of pateints by gender and their average obs score. -- 
SELECT 
	Gender, 
	COUNT(`Patient ID`) AS patient_count,
    ROUND(AVG(`Y-BOCS Score (Obsessions)`), 2) AS avg_obs_score
FROM ocd_patient
GROUP BY GENDER; 


-- Calculating the patient_count percentages, from above --
WITH gender_count AS 
	(SELECT 
	Gender, 
	COUNT(`Patient ID`) AS patient_count,
    ROUND(AVG(`Y-BOCS Score (Obsessions)`), 2) AS avg_obs_score
FROM ocd_patient
GROUP BY GENDER),

total AS 
	(SELECT 
		SUM(patient_count) AS total_count
	FROM gender_count) 
SELECT 
	g.Gender, 
	g.patient_count,
	g.avg_obs_score,
	ROUND((patient_count/t.total_count) * 100 , 2) AS percentage

FROM gender_count g
JOIN total t;



-- Count of patients that visited the clinc every month--
set sql_safe_updates = 0;

UPDATE ocd_patient
SET `OCD Diagnosis Date` = STR_TO_DATE(`OCD Diagnosis Date`, '%m/%d/%Y')
WHERE `OCD Diagnosis Date` IS NOT NULL 
  AND STR_TO_DATE(`OCD Diagnosis Date`, '%m/%d/%Y') IS NOT NULL;

ALTER TABLE ocd_patient
MODIFY COLUMN `OCD Diagnosis Date` DATE;

SELECT 
	date_format(`OCD Diagnosis Date`, '%Y-%m-01') AS month,
    COUNT(`Patient ID`) as pateint_count
    
FROM ocd_patient
GROUP BY month 
ORDER BY month;



-- Most common obs type and its avg obs score -- 
SELECT 
	`Obsession Type`,
    COUNT(`Patient ID`) AS patient_count,
    ROUND(AVG(`Y-BOCS Score (Obsessions)`), 2) AS avg_obs_score
FROM ocd_patient
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;



-- The most common comp type and its average score -- 
SELECT 
	`Compulsion Type`,
    COUNT(`Patient ID`) AS patient_count,
    ROUND(AVG(`Y-BOCS Score (Compulsions)`), 2) AS avg_comps_score
FROM ocd_patient
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1; 



-- AGE BASED ANALYSIS --
SELECT 
    CASE 
        WHEN Age < 18 THEN 'Child'
        WHEN Age BETWEEN 18 AND 30 THEN 'Young Adult'
        WHEN Age BETWEEN 31 AND 50 THEN 'Adult'
        ELSE 'Senior'
    END AS age_group,
    COUNT(`Patient ID`) AS patient_count,
    ROUND(AVG(`Y-BOCS Score (Obsessions)`), 2) AS avg_obs_score
FROM ocd_patient
GROUP BY age_group;



-- Top severity patients (high-risk flagging) --
SELECT 
    COUNT(*) AS high_risk_patients,
    ROUND(100*COUNT(*) / (SELECT COUNT(*) FROM ocd_patient), 1) AS percentage
FROM ocd_patient
WHERE `Y-BOCS Score (Obsessions)` > 25 
   OR `Y-BOCS Score (Compulsions)` > 25;
   
   

-- Obsession type vs compulsion type cross analysis --
SELECT 
    `Obsession Type`,
    `Compulsion Type`,
    COUNT(*) AS cases
FROM ocd_patient
GROUP BY 1,2
ORDER BY cases DESC;


















