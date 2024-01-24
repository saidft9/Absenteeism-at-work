--creat join table
 SELECT * FROM	Absenteeism_at_work a-- naming it as a
LEFT JOIN compensation b
ON a.ID = b.ID
LEFT JOIN Reasons c
ON a.Reason_for_absence = c.Number;

-- Find the healthiest
SELECT * FROM Absenteeism_at_work
WHERE Social_drinker = 0 AND Social_smoker = 0
AND Body_mass_index < 25 AND Absenteeism_time_in_hours < (SELECT AVG(Absenteeism_time_in_hours) FROM Absenteeism_at_work)

-- Compensation rate increase for non smokers / Budget 980000 so 0.69$ per H/ 120$ Per month
SELECT COUNT(*) FROM Absenteeism_at_work
WHERE Social_smoker=

--Optimize the query
SELECT
a.ID,
c.Reason,
Month_of_absence,
Body_mass_index,

Case WHEN Body_mass_index <18.5 then 'Underweight'
	WHEN Body_mass_index BETWEEN 18.5 and 25 then 'Healthy'
	WHEN Body_mass_index BETWEEN 25 AND 30 then 'Overweight'
	WHEN Body_mass_index > 30  then 'Obese'
	ELsE 'UNKOWN' END AS BMI_Category,
CASE WHEN Month_of_absence IN (12,1,2) THEN 'Winter'
	WHEN Month_of_absence IN (3,4,5) THEN 'Spring'
	WHEN Month_of_absence IN (6,7,8) THEN 'Summer'
	WHEN Month_of_absence IN (9,10,11) THEN 'Autumn'
	ELSE 'UNKOWN' END AS Season_of_absence,
CASE WHEN AGE BETWEEN 18 AND 30 then 'young Adult'
	WHEN AGE BETWEEN 30 AND 40 then 'Adult'
	WHEN AGE BETWEEN 40 AND 60 then 'Middle-Aged'
	ElSE 'OLD' END AS Category_Age,
Day_of_the_week,
Education,
Son,
Reason_for_absence,
Social_smoker,
Social_drinker,
Transportation_expense,
Distance_from_Residence_to_Work,
Pet,
Disciplinary_failure,
Age,
Work_load_Average_day,
Absenteeism_time_in_hours
FROM Absenteeism_at_work a
LEFT JOIN compensation b
ON a.ID = b.ID
LEFT JOIN Reasons c
ON a.Reason_for_absence = c.Number;

SELECT Work_load_Average_day FROM Absenteeism_at_work