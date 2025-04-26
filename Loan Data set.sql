-- 1. What is the Loan approval rate across different property areas ( urban/rural/semiurban)?
select Property_Area, sum(loan_status = 'Yes') as Total_Approved,
count(case when Loan_status = 'Yes' then 1 end)*100.0/count(*) As Approval_Rate
From Loan_Data
Group by Property_Area

-- 2. How many loans were approved and rejected?
select Loan_Status, Count(*) as Total_count
From Loan_Data
Group by Loan_Status

-- 3. WHat is the approval rate for applicants with good vs. poor credit history?
select Credit_History, count(case when Loan_status = 'Yes' then 1 end)*100.0/count(*) as Approval_rate
From Loan_Data
Group by Credit_History

-- 4. What is the average income of applicants whose loans were approved compared to those who were rejected?
Select Loan_Status, Avg(Applicantincome) as Average_income
From Loan_Data
Group by Loan_Status

-- 5. What is the correlation between the number of dependents and Loan approval rates?
select Dependents, sum(Loan_status = 'Yes') as Total_approved,
Count(case when Loan_status = 'Yes' then 1 end)*100.0/ count(*) as Approval_rate
From Loan_Data
Group by Dependents 