create database Bank_Analysis_Project;
use Bank_Analysis_Project;
select count(id) from finance_1;
select count(id) from finance_2;
select * from finance_2;
select * from finance_1;

-- >> KPI 1 : Year Wise Loam Amount
select year(issue_d) as year_of_issue,sum(loan_amnt) as Total_Loan_Amnt from finance_1 
group by year_of_issue
order by year_of_issue;

-- > KPI 2 : Grade and sub grade wise revol_bal
select grade,sub_grade, sum(revol_bal) as Total_revol_bal
from finance_1 inner join finance_2
on(finance_1.id = finance_2.id)
group by grade , sub_grade
order by grade , sub_grade;

-- > KPI 3 : Total Payment for Verified Status Vs Total Payment for Non Verified Status
select verification_status,
concat("$", format(round(sum(total_pymnt)/1000000,2),2),"M") as total_payment
from finance_1 inner join finance_2
on(finance_1.id = finance_2.id)
group by verification_status;

-- > KPI 4 : State wise and month wise loan status
select addr_state , last_credit_pull_D,loan_status
from finance_1 inner join finance_2
on(finance_1.id = finance_2.id)
group by addr_state , last_credit_pull_D,loan_status
order by last_credit_pull_D;

-- > KPI 5 : Home ownership Vs last payment date stats
select home_ownership,last_pymnt_d,
concat("$", format(round(sum(last_pymnt_amnt)/1000,2),2),"k") as total_Amount
from finance_1 inner join finance_2
on(finance_1.id = finance_2.id)
group by home_ownership,last_pymnt_d
order by last_pymnt_d desc,home_ownership desc;
    
